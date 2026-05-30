import 'dart:async';
import 'dart:convert';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/services/api_service.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:amoora_mkt/features/auth/views/signin_view.dart';
import 'package:amoora_mkt/cff/services/alert_service.dart';
import 'package:amoora_mkt/cff/services/sharedpref_service.dart';
import 'package:amoora_mkt/cff/services/snackbar_service.dart';
import 'package:amoora_mkt/cff/core/app_config.dart';
import 'package:amoora_mkt/features/auth/model/jwt_token.dart';
import 'package:amoora_mkt/features/auth/model/user.dart';
import 'package:amoora_mkt/features/auth/views/code_verify_view.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthCtrl extends _$AuthCtrl {
  final _kLogName = 'AUTH-CTRL';

  final String tokenKey = 'COOKIE_TOKEN';
  final String userKey = 'CURRENT_USER';
  final _rememberKey = 'COOKIE_REMEMBER';

  JwtToken? token;
  User? user;
  String identifier = '', password = '', password_old = '', password_confirm = '';
  String email = '', name = '', fullName = '', phone = '';
  bool isRemember = false;
  String verifyCode = '', verifyType = 'email';
  int countdownTimer = 60 * 3;
  bool isCountdownExpired = false;

  @override
  FutureOr<User?> build() => null;

  Future<bool> isAuthorized() async {
    _getRemember();
    _getToken();

    bool result = await _isTokenValid();
    if (result) {
      _getUser();
      return true;
    }

    return false;
  }

  Future<String?> getValidToken({bool forceToSignIn = false}) async {
    bool result = await _isTokenValid();
    if (result) {
      return token?.accessToken;
    }

    if (forceToSignIn) {
      bool result = await ref.read(pageUtilsProvider).goto(page: SignInView());
      return result ? token?.accessToken : null;
    } else {
      return null;
    }
  }

  Future<bool> _isTokenValid() async {
    if (token == null) {
      logD("Token is null, need sign in", name: _kLogName);
      await signOut(force: true);
      return false;
    }
    if (token!.isExpired()) {
      logD("Token has expired, request refresh token", name: _kLogName);
      token = await _refreshToken();
      if (token == null) {
        logD("Refresh token has expired too, need re-sign in again", name: _kLogName);
        await signOut(force: true);
        return false;
      } else {
        logD("New token obtained", name: _kLogName);
        _setToken(token);
        return true;
      }
    }
    logD("The token still valid", name: _kLogName);
    return true;
  }

  Future _setRemember() async {
    if (isRemember) {
      final remember = {"identifier": identifier, "password": password};
      await ref.read(sharedPrefProvider).setString(_rememberKey, jsonEncode(remember));
      logD("setRemember => true | identifier : $identifier", name: _kLogName);
    } else {
      identifier = '';
      password = '';
      await ref.read(sharedPrefProvider).remove(_rememberKey);
    }
  }

  void _getRemember() {
    final data = ref.read(sharedPrefProvider).getString(_rememberKey);
    logD("getRemember => ${data != null ? 'Exits' : 'Not Exist'}", name: _kLogName);
    if (data != null) {
      final remember = jsonDecode(data);
      identifier = remember['identifier'];
      password = remember['password'];
      isRemember = true;
      logD("getRemember => identifier : ${remember['identifier']}", name: _kLogName);
    } else {
      identifier = '';
      password = '';
      isRemember = false;
    }
  }

  void _getUser() {
    final data = ref.read(sharedPrefProvider).getString(userKey);
    user = data != null ? User.fromJson(jsonDecode(data)) : null;
    state = AsyncData(user);
  }

  Future _setUser(User? value) async {
    user = value;
    state = AsyncData(value);
    if (value == null) {
      await ref.read(sharedPrefProvider).remove(userKey);
    } else {
      await ref.read(sharedPrefProvider).setString(userKey, jsonEncode(value.toJson()));
    }
  }

  void _getToken() {
    final data = ref.read(sharedPrefProvider).getString(tokenKey);
    token = data != null ? JwtToken.fromJson(jsonDecode(data)) : null;
    logD("getToken => ${data != null ? 'Exits' : 'Not Exist'}", name: _kLogName);
  }

  Future _setToken(JwtToken? value) async {
    token = value;
    if (value == null) {
      await ref.read(sharedPrefProvider).remove(tokenKey);
    } else {
      await ref.read(sharedPrefProvider).setString(tokenKey, jsonEncode(value.toJson()));
    }
  }

  Future<JwtToken?> _refreshToken() async {
    final reqs = Reqs(path: '/api/v1/auth/refresh_token', data: {});
    final _state = await AsyncValue.guard(
      () async => await ref.read(apiServiceProvider).refreshToken(reqs: reqs, refreshToken: token?.refreshToken),
    );

    if (_state.hasError) return null;

    final _token = JwtToken.fromJson(_state.value);
    return _token;
  }

  Future<bool> signOut({bool force = false}) async {
    if (force) {
      await _setUser(null);
      await _setToken(null);
      return true;
    }

    final result = await AlertService.confirm(
      body: "Anda yakin ingin keluar ?",
      onYes: () async {
        await _setUser(null);
        await _setToken(null);
      },
    );

    return result == null ? false : result;
  }

  Future<void> signUp() async {
    final reqs = Reqs(
      path: '/api/v1/auth/signup',
      data: {
        "identifier": email,
        "email": email,
        "password": password,
        "name": name,
        "full_name": fullName,
        "phone": phone,
      },
    );
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    final jwtToken = JwtToken.fromJson(_state.value);
    final user = User.fromJson(_state.value['user']);

    _setToken(jwtToken);
    _setUser(user);

    await AlertService.showOk(body: 'Perdaftaran Akun Berhasil !', onOk: () => ref.read(goRouterProvider).pop());
  }

  Future<bool> signIn() async {
    logD("signIn => process...", name: _kLogName);

    final reqs = Reqs(path: '/api/v1/auth/signin', data: {"identifier": identifier, "password": password});
    final _state = await AsyncValue.guard(
      () async => await ref.read(apiServiceProvider).call(reqs: reqs, withToken: false),
    );

    if (_state.hasError) return false;

    final jwtToken = JwtToken.fromJson(_state.value);
    final user = User.fromJson(_state.value['user']);

    await _setToken(jwtToken);
    await _setUser(user);
    await _setRemember();

    logD("signIn => success", name: _kLogName);
    return true;
  }

  Future<void> sendCode() async {
    logD("sendCode => process...", name: _kLogName);

    final reqs = Reqs(path: '/api/v1/auth/send_code', data: {"email": email, "send_via": verifyType});
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    verifyCode = _state.value['verification_code'];
    verifyType = 'forgot_password';
    countdownTimer = 60 * 3;
    isCountdownExpired = false;

    await AlertService.showOk(
      body: 'Kode OTP telah dikirimkan, silahkan anda cek email anda.',
      onOk: () async {
        logD("sendCode => success", name: _kLogName);
        // final result = await ref.read(goRouterProvider).push('/code_verify');
        final result = await ref.read(pageUtilsProvider).goto(page: CodeVerifyView());
        if (result == true) {
          ref.read(goRouterProvider).pop(true);
        }
      },
    );
  }

  Future<void> resendCode() async {
    if (isCountdownExpired == false) {
      return SnackBarService.show(message: 'Hitung mundur masih berlaku !');
    }

    logD("resendCode => process...", name: _kLogName);

    switch (verifyType) {
      case 'email':
        final reqs = Reqs(
          path: '/api/v1/auth/send_verification_code',
          data: {"type": "email", "is_testing": AppConfig.isTesting},
        );
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD("resendCode => verification_code : ${_state.value['verification_code']}", name: _kLogName);
        verifyCode = _state.value['verification_code'];
        break;
      case 'phone':
        final reqs = Reqs(
          path: '/api/v1/auth/send_verification_code',
          data: {"type": "phone", "is_testing": AppConfig.isTesting},
        );
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD("resendCode => verification_code : ${_state.value['verification_code']}", name: _kLogName);
        verifyCode = _state.value['verification_code'];
        break;
      default:
        final reqs = Reqs(path: '/api/v1/auth/send_code', data: {"email": email, "send_via": "sms"});
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD("resendCode => verification_code : ${_state.value['verification_code']}", name: _kLogName);
        verifyCode = _state.value['verification_code'];
    }

    await AlertService.showOk(
      body: 'Kode verifikasi telah dikirimkan ulang silahkan anda cek kembali !',
      onOk: () async {
        isCountdownExpired = false;
      },
    );
  }

  Future<void> resetPwd() async {
    final reqs = Reqs(
      path: '/api/v1/auth/reset_pwd',
      data: {"email": email, "password": password, "need_confirm": false},
    );
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, silahkan anda coba masuk dengan kode sandi terbaru !',
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> changePwd() async {
    final reqs = Reqs(
      path: '/api/v1/auth/change_pwd',
      data: {"old_password": password_old, "new_password": password, "need_confirm": false},
    );
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, kode sandi sudah berubah !',
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> verifyEmail() async {
    await AlertService.confirm(
      body: 'Apakah anda ingin verifikasi email sekarang?',
      onYes: () async {
        final reqs = Reqs(
          path: '/api/v1/auth/send_verification_code',
          data: {"type": "email", "is_testing": AppConfig.isTesting},
        );
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD(_state.value['verification_code']);
        verifyCode = _state.value['verification_code'];
        verifyType = 'email';
        countdownTimer = 60 * 3;
        isCountdownExpired = false;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan cek email anda !',
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              await confirmVerificationCode();
              await AlertService.showOk(body: 'Alamat Email telah ter-verifikasi.');
            }
          },
        );
      },
    );
  }

  Future<void> verifyPhone() async {
    await AlertService.confirm(
      body: 'Apakah anda ingin verifikasi nomor telepon sekarang?',
      onYes: () async {
        final reqs = Reqs(
          path: '/api/v1/auth/send_verification_code',
          data: {"type": "phone", "is_testing": AppConfig.isTesting},
        );
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD(_state.value['verification_code']);
        verifyCode = _state.value['verification_code'];
        verifyType = 'phone';
        isCountdownExpired = false;
        countdownTimer = 60 * 5;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan anda cek !',
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              await confirmVerificationCode();
              await AlertService.showOk(body: 'Nomor HP telah ter-verifikasi.');
            }
          },
        );
      },
    );
  }

  Future<void> confirmVerificationCode() async {
    final reqs = Reqs(path: '/api/v1/auth/confirm_verification_code', data: {"type": verifyType});
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    if (verifyType == 'email') {
      // ref.read(profileCtrlProvider).updateCurrProfileLocal({'is_email_verified': 1});
      return;
    }
    if (verifyType == 'phone') {
      // ref.read(profileCtrlProvider).updateCurrProfileLocal({'is_phone_verified': 1});
      return;
    }
  }

  Future<void> unregister() async {
    await AlertService.confirm(
      body: 'Anda yakin ingin menutup Akun ?',
      onYes: () async {
        final reqs = Reqs(
          path: '/api/v1/auth/send_verification_code',
          data: {"type": "unregister", "is_testing": AppConfig.isTesting},
        );
        final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

        if (_state.hasError) return;

        logD(_state.value['verification_code']);
        verifyCode = _state.value['verification_code'];
        verifyType = 'unregister';
        isCountdownExpired = false;
        countdownTimer = 60 * 3;

        await AlertService.showOk(
          body: 'Kode verifikasi telah dikirim, silahkan cek email anda !',
          onOk: () async {
            final result = await ref.read(pageUtilsProvider).goto(page: const CodeVerifyView());
            if (result == true) {
              if (ref.read(goRouterProvider).canPop()) ref.read(goRouterProvider).pop();
              await closingAccount();
              await AlertService.showOk(
                body: 'Akun anda telah berhasil di TUTUP !.',
                onOk: () => ref.read(goRouterProvider).pop(true),
              );
            }
          },
        );
      },
    );
  }

  Future<void> closingAccount() async {
    final reqs = Reqs(
      path: '/api/v1/auth/closing_account',
      data: {"is_send_email_info": true, "is_testing": AppConfig.isTesting},
    );
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (_state.hasError) return;

    await signOut(force: true);
  }
}
