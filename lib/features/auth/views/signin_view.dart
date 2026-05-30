import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/services/snackbar_service.dart';
import 'package:amoora_mkt/cff/utils/debouncer.dart';
import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/cff/widgets/custom_checkbox.dart';
import 'package:amoora_mkt/cff/widgets/custom_rich_text.dart';
import 'package:amoora_mkt/cff/widgets/logo.dart';
import 'package:amoora_mkt/features/auth/views/pwd_forgot_view.dart';
import 'package:amoora_mkt/features/auth/views/signup_view.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key, this.isEmbed = false, this.canPop = true});

  final bool isEmbed;
  final bool canPop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        debugPrint('onPopInvoked');

        Debouncer(milliseconds: 2000).confirm(
          () => SnackBarService(message: Text('Tekan lagi untuk keluar').center()).shown(bottom: 50),
          () => context.pop(false),
        );
      },
      child: MyUI(
        // showInfoScreen: true,
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
          appBar: AppBar(titleSpacing: 20, title: Text('Sign In'), automaticallyImplyLeading: isEmbed),
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
                            Text('Selamat Datang Kembali!').tsTitle(scale: .85).bold().clr(primaryLight),
                            Text('Login untuk mengakses semua fitur terbaik kami.').tsBody(),
                          ],
                        ),
                        40.height,
                        CustomInput(
                          minWidth: 500,
                          initialValue: ref.read(authCtrlProvider.notifier).identifier,
                          onChanged: (val) => ref.read(authCtrlProvider.notifier).identifier = val,
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
                          validator: (p0) => p0!.isEmpty ? 'Kolom password harap di isi' : null,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        10.height,
                        Consumer(
                          builder: (context, ref, child) {
                            return SizedBox(
                              width: context.isLandscape || context.isWidthScreen ? 500 : double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: CustomCheckBox(
                                      captionW: Text('Remember me').tsCaption().link(),
                                      value: ref.watch(authCtrlProvider.notifier).isRemember,
                                      onChanged: (bool val) => ref.read(authCtrlProvider.notifier).isRemember = !ref
                                          .read(authCtrlProvider.notifier)
                                          .isRemember,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var result = await context.goto(page: const PwdForgotView());
                                      // var result = await context.push('/pwd_forgot');
                                      if (result == true) {
                                        // ignore: use_build_context_synchronously
                                        context.pop();
                                      }
                                    },
                                    child: Text('Lupa kode sandi?').tsCaption().link(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        20.height,
                        CustomButton(
                          minWidth: 200,
                          child: Text('Log In'),
                          onPressed: () async {
                            if (formStateKey.currentState!.validate() == false) {
                              return;
                            }

                            bool result = await ref.read(authCtrlProvider.notifier).signIn();
                            if (result && !isEmbed) {
                              if (context.mounted) context.pop(true);
                            }

                            // ref.read(goRouterProvider).go('/home');
                          },
                        ),
                        // 20.height,
                        // Opacity(opacity: .6, child: Text('Atau login dengan').tsBody()),
                        // 20.height,
                        // CustomButton(minWidth: 300, type: ButtonType.google, onPressed: () {}),
                        // 5.height,
                        // CustomButton(minWidth: 300, type: ButtonType.apple, onPressed: () {}),
                        20.height,
                        CustomRichText(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Belum punya akun? ', style: tsBody(context)),
                              TextSpan(
                                text: 'Daftar!',
                                style: tsBody().link().bold(),
                                recognizer: TapGestureRecognizer()
                                  ..onTapDown = (details) async {
                                    var result = await context.goto(page: const SignUpView());
                                    if (result == true) {
                                      // ignore: use_build_context_synchronously
                                      context.pop(true);
                                    }
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
