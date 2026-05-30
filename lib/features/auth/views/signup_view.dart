import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/cff/widgets/logo.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      // customBackground: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/pattern-01.png'),
      //       repeat: ImageRepeat.repeat,
      //       opacity: 1,
      //       colorFilter: ColorFilter.mode(oBlack.whenDark(oWhite, context), BlendMode.srcIn),
      //     ),
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [Color(0xFFDAEFFC).whenDark(oBlack, context), const Color(0xFFDAEFFC).whenDark(oBlack, context)],
      //     ),
      //   ),
      // ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Daftar baru')),
        body: ListView(
          children: [
            Form(
              key: formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      40.height,
                      Column(
                        children: [
                          SizedBox(width: 200, child: Logo(src: 'assets/icons/logo-amoora.png')),
                          40.height,
                          Text('Selamat Datang!').tsTitle(scale: .85).bold().clr(primaryLight),
                          Text('Buat akun Anda untuk mengakses layanan digital kami.').tsBody(),
                        ],
                      ),
                      40.height,
                      CustomInput(
                        minWidth: 500,
                        initialValue: ref.read(authCtrlProvider.notifier).fullName,
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).fullName = val,
                        hintText: 'Nama Lengkap',
                        prefixIcon: const Icon(Icons.person_outline),
                        validator: (p0) => p0!.isEmpty ? 'Kolom nama lengkap harus di isi' : null,
                      ),
                      20.height,
                      CustomInput(
                        minWidth: 500,
                        initialValue: ref.read(authCtrlProvider.notifier).email,
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).email = val,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (p0) =>
                            p0!.isEmpty || !p0.isEmail() ? 'Harap di isi dengan alamat email yang benar' : null,
                      ),
                      20.height,
                      CustomInput(
                        minWidth: 500,
                        initialValue: ref.read(authCtrlProvider.notifier).password,
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).password = val,
                        hintText: 'Password',
                        isPassword: true,
                        validator: (p0) => p0!.isEmpty
                            ? 'Kolom password harus di isi'
                            : p0.length < 5
                            ? 'Minimum 5 karakter'
                            : null,
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      20.height,
                      // CustomInput(
                      //   minWidth: 500,
                      //   initialValue: ref.read(textPasswordConfirmProvider),
                      //   onChanged: (val) => ref.read(textPasswordConfirmProvider.notifier).state = val,
                      //   hintText: 'Konfirmasi kode sandi',
                      //   isPassword: true,
                      //   validator: (p0) => p0! != ref.read(textPasswordProvider)
                      //       ? 'Kolom ini harus sama dengan kolom kode sandi'
                      //       : null,
                      //   prefixIcon: const Icon(Icons.lock_outline),
                      // ),
                      // 20.height,
                      // CustomInput(
                      //   minWidth: 500,
                      //   initialValue: ref.read(textNameProvider),
                      //   onChanged: (val) => ref.read(textNameProvider.notifier).state = val,
                      //   hintText: 'Nama Panggilan',
                      //   prefixIcon: const Icon(Icons.face_outlined),
                      //   validator: (p0) => p0!.isEmpty ? 'Kolom nama panggilan harus di isi' : null,
                      // ),
                      // 20.height,
                      // CustomInput(
                      //   minWidth: 500,
                      //   initialValue: ref.read(textPhoneProvider),
                      //   onChanged: (val) => ref.read(textPhoneProvider.notifier).state = val,
                      //   hintText: 'Nomor Telpon',
                      //   prefixIcon: const Icon(Icons.phone_outlined),
                      //   validator: (p0) => p0!.isEmpty ? 'Kolom nomor telpon harus di isi' : null,
                      // ),
                      // 40.height,
                      CustomButton(
                        // busy: state.isLoading,
                        minWidth: 200,
                        child: Text('Daftar'),
                        onPressed: () async {
                          // if (formStateKey.currentState!.validate() == false) {
                          //   return;
                          // }
                          // // Submit
                          // ref.read(authCtrlProvider.notifier).signUp();

                          ref.read(goRouterProvider).pop();
                        },
                      ),
                      // 20.height,
                      // CustomRichText(
                      //   text: TextSpan(
                      //     text: 'Sudah punya akun? ',
                      //     style: tsBodyM(),
                      //     children: [
                      //       TextSpan(
                      //         text: 'Yuk masuk !',
                      //         style: tsBodyM().link(),
                      //         recognizer: TapGestureRecognizer()..onTapDown = (details) => context.pop(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // 20.height,
                      // Center(child: Opacity(opacity: .6, child: Text('Atau daftar dengan').tsBody())),
                      // 20.height,
                      // CustomButton(type: ButtonType.google, onPressed: () {}),
                      // 5.height,
                      // CustomButton(type: ButtonType.apple, onPressed: () {}),
                      20.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
