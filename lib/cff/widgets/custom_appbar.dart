import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.decoration,
    this.actions,
    this.automaticallyImplyLeading = true,
  });

  final Widget? leadingIcon;
  final Widget? title;
  final bool automaticallyImplyLeading;
  final Decoration? decoration;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(.7),
      ),
      child: SizedBox(
        height: kToolbarHeight,
        child: Container(
          decoration: decoration,
          child: AppBar(
            title: title,
            backgroundColor: Colors.transparent,
            actions: actions,
          ),
        ),
        // child: Container(
        //   decoration: decoration ?? const BoxDecoration(color: primaryLight),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       // Leading Icon
        //       if (leadingIcon == null && automaticallyImplyLeading)
        //         const BackButton()
        //       else
        //         leadingIcon!,
        //       // Title name
        //       Padding(
        //         padding: EdgeInsets.only(
        //           left: leadingIcon != null ? 0 : 20,
        //         ),
        //         child: title,
        //       ),
        //       // Actions widget
        //       if (actions != null)
        //         Expanded(
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: actions!.reversed.toList(),
        //           ),
        //         ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
