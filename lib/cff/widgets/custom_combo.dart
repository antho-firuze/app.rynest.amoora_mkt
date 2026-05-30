import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import 'button/custom_button.dart';
import 'custom_dialog.dart';

enum ComboType { gender, religion }

enum GenderList {
  male('Laki-laki'),
  female('Perempuan');

  const GenderList(this.desc);
  final String desc;
}

enum ReligionList {
  islam('Islam'),
  kriskat('Kristen Katholik'),
  krispro('Kristen Protestan'),
  hindu('Hindu'),
  budha('Budha');

  const ReligionList(this.desc);
  final String desc;
}

class CustomCombo extends StatefulWidget {
  const CustomCombo({
    super.key,
    this.controller,
    this.onSubmitted,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enterPressed,
    this.formatter,
    this.validator,
    this.onChanged,
    this.items,
    this.type = ComboType.gender,
  });

  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(dynamic val)? onChanged;
  final Function(String val)? onSubmitted;
  final bool enabled;
  final bool readOnly;
  final bool? isPassword;
  final int maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function()? enterPressed;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? val)? validator;
  final List<String>? items;
  final ComboType type;

  @override
  State<CustomCombo> createState() => _CustomComboState();
}

class _CustomComboState extends State<CustomCombo> with SingleTickerProviderStateMixin {
  bool isEmpty = true;
  bool showPassword = false;
  String? labelText;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    if (widget.readOnly || !widget.enabled) {
      labelText = widget.hintText;
    }

    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
    controller.addListener(checkValue);
    // Future.delayed(
    //   Duration.zero,
    //   () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    // );
  }

  void checkValue() {
    setState(() {
      isEmpty = controller.text.isEmpty;
      labelText = controller.text.isEmpty ? null : widget.hintText;
    });
  }

  Widget? generateCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) => widget.enabled && !widget.readOnly
      ? currentLength >= maxLength!
            ? Text('Max $maxLength chars').tsCaption().clr(Colors.red)
            : Text('$currentLength').tsCaption()
      : null;

  @override
  Widget build(BuildContext context) {
    var showClearBtn = InkWell(
      onTap: () => controller.text = '',
      child: (!isEmpty && !widget.readOnly && widget.enabled) ? Icon(Icons.clear) : Container(),
    );

    var showPasswordVisibility = InkWell(
      onTap: () => setState(() {
        showPassword = !showPassword;
      }),
      child: widget.isPassword == true
          ? SizedBox(width: 45, child: Icon(showPassword ? Icons.visibility : Icons.visibility_off))
          : Container(),
    );

    return TextFormField(
      controller: controller,
      autofocus: false,
      focusNode: widget.focusNode,
      // style: tsBodyM(),
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: true,
      obscureText: showPassword ? !showPassword : widget.isPassword!,
      buildCounter: generateCounter,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
        if (widget.enterPressed != null) widget.enterPressed!();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      inputFormatters: widget.formatter,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        labelText: labelText,
        // labelStyle: tsBodyM(),
        hintText: widget.hintText,
        // hintStyle: tsBodyM(),
        helperText: widget.helperText,
        counterText: widget.maxLength == null ? '' : null,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            showClearBtn,
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.arrow_drop_down, size: 30)),
            showPasswordVisibility,
            widget.suffixIcon ?? Container(),
          ],
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 47, minWidth: 37, minHeight: 47),
      ),
      onTap: () async => await showDialog(
        context: context,
        builder: (context) {
          List<String> items = switch (widget.type) {
            ComboType.gender => GenderList.values.map((e) => e.desc).toList(),
            ComboType.religion => ReligionList.values.map((e) => e.desc).toList(),
          };
          return ComboDialog<String>(items: items, onSelected: (value) => controller.text = value);
        },
      ),
    );
  }
}

class ComboDialog<T> extends StatelessWidget {
  const ComboDialog({super.key, required this.items, this.onSelected});

  final List<T> items;
  final Function(T value)? onSelected;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: Text('Pilihan :'),
      content: SingleChildScrollView(
        child: Column(
          children: List.generate(items.length, (index) {
            final item = items[index];
            return ListTile(
              title: Text("$item"),
              onTap: () {
                if (onSelected != null) onSelected!(item);
                context.pop();
              },
            );
          }),
        ),
      ),
      actions: [CustomButton(child: const Text('BATAL'), onPressed: () => context.pop())],
    );
  }
}
