import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class PwdResetView extends ConsumerWidget {
  const PwdResetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Input kode sandi baru')),
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
                      20.height,
                      Text('Reset Kode Sandi').tsTitle(),
                      10.height,
                      Text('Silahkan masukkan kode sandi anda yang baru').tsBody(),
                      40.height,
                      CustomInput(
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).password = val,
                        hintText: 'Kode sandi baru',
                        isPassword: true,
                        validator: (p0) => p0!.isEmpty
                            ? 'Kolom kode sandi harus di isi'
                            : p0.length < 5
                            ? 'Minimum 5 karakter'
                            : null,
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      20.height,
                      CustomInput(
                        onChanged: (val) => ref.read(authCtrlProvider.notifier).password_confirm = val,
                        hintText: 'Konfirmasi kode sandi baru',
                        isPassword: true,
                        validator: (p0) => p0! != ref.read(authCtrlProvider.notifier).password
                            ? 'Kolom ini harus sama dengan kolom kode sandi di atas'
                            : null,
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),
                      40.height,
                      CustomButton(
                        // busy: state.isLoading,
                        minWidth: 200,
                        child: Text('Simpan'),
                        onPressed: () {
                          if (formStateKey.currentState!.validate() == false) {
                            return;
                          }
                          // Submit
                          ref.read(authCtrlProvider.notifier).resetPwd();
                        },
                      ),
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
