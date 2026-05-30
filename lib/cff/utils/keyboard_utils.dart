import 'package:flutter/material.dart';

extension Keyboard on BuildContext {
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
}
