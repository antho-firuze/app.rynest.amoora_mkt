import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class PwdForgotView extends ConsumerWidget {
  const PwdForgotView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Lupa Kode Sandi')),
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
                      10.height,
                      Text('Masukkan email yang terkait dengan akun Anda').tsBody(),
                      5.height,
                      Text('dan Kode OTP akan dikirim ke email anda,').tsBody(),
                      20.height,
                      CustomInput(
                        minWidth: 500,
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).email = val,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (p0) => p0!.isEmpty
                            ? 'Kolom email harap di isi'
                            : !p0.isEmail()
                            ? 'Isi dengan alamat email yang benar'
                            : null,
                      ),
                      20.height,
                      CustomButton(
                        // busy: state.isLoading,
                        minWidth: 200,
                        child: Text('Kirim Kode Verifikasi!'),
                        onPressed: () async {
                          if (formStateKey.currentState!.validate() == false) {
                            return;
                          }

                          ref.read(authCtrlProvider.notifier).sendCode();

                          // var result = await context.push('/code_verify');
                          // if (result == true) {
                          //   // ignore: use_build_context_synchronously
                          //   context.pop(true);
                          // }
                        },
                      ),
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
