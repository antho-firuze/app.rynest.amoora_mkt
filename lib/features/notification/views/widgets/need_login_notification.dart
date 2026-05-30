import 'package:flutter/material.dart';

class NeedLoginNotification extends StatelessWidget {
  const NeedLoginNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Login'),
        ],
      ),
    );
  }
}
