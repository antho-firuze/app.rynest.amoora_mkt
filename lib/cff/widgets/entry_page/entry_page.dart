import 'package:flutter_riverpod/legacy.dart';
import 'package:amoora_mkt/cff/widgets/entry_page/type_textbox.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Type { datetime, email, multiline, name, number, phone, address, text }

final isFormValidated = StateProvider<bool>((ref) => false);

class EntryPage extends ConsumerWidget {
  const EntryPage({
    super.key,
    required this.title,
    this.hint,
    this.type = Type.text,
    this.initialValue,
    this.description,
    this.onSubmit,
  });

  final Type type;
  final String title;
  final String? hint;
  final String? description;
  final String? initialValue;
  final Function(dynamic val)? onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(isFormValidated.notifier).state = false;
      },
      child: MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: switch (type) {
            Type.text => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              inputType: TextInputType.text,
              onSubmit: onSubmit,
            ),
            Type.number => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              inputType: TextInputType.number,
              onSubmit: onSubmit,
            ),
            Type.phone => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              inputType: TextInputType.phone,
              onSubmit: onSubmit,
            ),
            Type.datetime => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              onSubmit: onSubmit,
              inputType: TextInputType.datetime,
            ),
            Type.email => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              onSubmit: onSubmit,
              inputType: TextInputType.emailAddress,
            ),
            Type.multiline => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              onSubmit: onSubmit,
              inputType: TextInputType.multiline,
            ),
            Type.name => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              onSubmit: onSubmit,
              inputType: TextInputType.name,
            ),
            Type.address => TypeTextBox(
              hint: hint,
              description: description,
              initialValue: initialValue,
              onSubmit: onSubmit,
              inputType: TextInputType.streetAddress,
            ),
          },
        ),
      ),
    );
  }
}
