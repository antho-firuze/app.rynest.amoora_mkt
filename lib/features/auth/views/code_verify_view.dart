import 'package:amoora_mkt/cff/widgets/custom_rich_text.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/services/snackbar_service.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/countdown_timer.dart';
import 'package:amoora_mkt/cff/widgets/forms/otp_fields.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:go_router/go_router.dart';

class CodeVerifyView extends ConsumerWidget {
  const CodeVerifyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCountdownExpired = ref.watch(authCtrlProvider.notifier).isCountdownExpired;

    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Verifikasi Kode')),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.height,
                  Text('Kode verifikasi telah dikirim').tsTitle(),
                  20.height,
                  Text(
                    'Silahkan masukkan kode verifikasi yang telah anda terima',
                    textAlign: TextAlign.center,
                  ).tsBody(),
                  15.height,
                ],
              ),
            ),
            // OTP Fields
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OTPFields(
                  minWidth: 500,
                  length: 6,
                  onCompleted: (pin) async {
                    debugPrint(pin);
                    if (pin!.length >= 6) {
                      if (pin == ref.read(authCtrlProvider.notifier).verifyCode) {
                        return context.pop(true);
                      }

                      SnackBarService.show(message: 'Kode yang anda masukkan salah !');
                    }
                  },
                ),
              ),
            ),
            20.height,
            20.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isCountdownExpired == false) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Kode akan kadaluarsa dalam ').tsBody(),
                        CountDownTimer(
                          secondsRemaining: ref.read(authCtrlProvider.notifier).countdownTimer,
                          countDownStyle: tsBody(),
                          whenTimeExpires: () => ref.read(authCtrlProvider.notifier).isCountdownExpired = true,
                        ),
                      ],
                    ),
                    20.height,
                  ],
                  CustomRichText(
                    TextSpan(
                      text: 'Tidak terima kode verifikasi? ',
                      style: tsBody(),
                      children: [
                        TextSpan(
                          text: 'Kirim ulang !',
                          style: tsBody().link(),
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (details) async => await ref.read(authCtrlProvider.notifier).resendCode(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
