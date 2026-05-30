import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
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
    this.showCaptionFromHint = true,
    this.backgroundColor,
    this.borderRadius = 8,
    this.borderSide = const BorderSide(color: primaryLight),
    this.autoLabel = true,
    this.minWidth,
    this.height,
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
  final bool showCaptionFromHint;
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
  final Color? backgroundColor;
  final double borderRadius;
  final BorderSide borderSide;
  final bool autoLabel;
  final double? minWidth;
  final double? height;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> with SingleTickerProviderStateMixin {
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
      labelText = widget.showCaptionFromHint ? labelText : null;
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
    var showClearBtn = (!isEmpty && !widget.readOnly && widget.enabled)
        ? InkWell(onTap: () => controller.text = '', child: Icon(Icons.clear))
        : null;

    var showPasswordVisibility = widget.isPassword == true
        ? InkWell(
            onTap: () => setState(() {
              showPassword = !showPassword;
            }),
            child: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
          )
        : null;

    return SizedBox(
      height: widget.height,
      width: context.isLandscape || context.isWidthScreen ? widget.minWidth : double.infinity,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        focusNode: widget.focusNode,
        // style: tsBodyM(),
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
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
          // isDense: true,
          // contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          filled: widget.backgroundColor != null,
          fillColor: widget.backgroundColor,
          labelText: widget.autoLabel ? labelText : null,
          // labelStyle: tsBodyM(),
          hintText: widget.hintText,
          // hintStyle: tsBodyM(),
          helperText: widget.helperText,
          counterText: widget.maxLength == null ? '' : null,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: primaryLight,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showClearBtn != null) showClearBtn,
                if (showPasswordVisibility != null) showPasswordVisibility,
                if (widget.suffixIcon != null) widget.suffixIcon!,
              ],
            ),
          ),
          suffixIconColor: primaryLight,
          // suffixIconConstraints: const BoxConstraints(
          //   maxHeight: 47,
          //   minWidth: 37,
          //   minHeight: 47,
          // ),
          border: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}
