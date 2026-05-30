import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/custom_image.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.image,
    this.initial,
    this.size = 45,
    this.borderRadius,
    this.ratio = 1.0,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.circle,
    this.onTap,
  });

  final String? image;
  final String? initial;
  final double size;
  final BoxFit fit;
  final double ratio;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final imageSrc = image ?? 'assets/images/avatar.png';
    final errorWidget = CustomImage(src: 'assets/images/avatar-broken.png', onTap: onTap, fit: fit);
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: primaryLight,
          borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(12),
          shape: shape,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: shape == BoxShape.circle
              ? Center(
                  child: OverflowBox(
                    maxWidth: size * ratio,
                    maxHeight: size * ratio,
                    child: CustomImage(src: imageSrc, onTap: onTap, fit: fit, errorWidget: errorWidget),
                  ),
                )
              : Center(
                  child: OverflowBox(
                    maxWidth: size * ratio,
                    maxHeight: size * ratio,
                    child: CustomImage(src: imageSrc, onTap: onTap, fit: fit, errorWidget: errorWidget),
                  ),
                ),
        ),
      ),
    );
    // return SizedBox(
    //   width: width,
    //   height: height,
    //   child: Container(
    //     // padding: EdgeInsets.all(border ?? 6),
    //     decoration: BoxDecoration(
    //       color: primaryLight,
    //       borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(12),
    //       shape: shape,
    //     ),
    //     child: Stack(
    //       clipBehavior: Clip.none,
    //       fit: StackFit.passthrough,
    //       children: [
    //         Positioned.fill(
    //           child: ClipRRect(
    //             borderRadius: borderRadius ?? BorderRadius.circular(12),
    //             child: image == null && initial == null
    //                 ? CustomImage(src: 'assets/images/avatar.png', onTap: onTap)
    //                 : image != null
    //                     ? CustomImage(src: image, onTap: onTap)
    //                     : LogoInitial(initial: initial!),
    //           ),
    //         ),
    //         if (onTapUpdate != null)
    //           Positioned(
    //             bottom: 0,
    //             right: 0,
    //             child: CustomIcon(
    //               SuperIcons.is_camera_outline,
    //               size: 30,
    //               backgroundColor: Colors.black45,
    //               onPressed: onTapUpdate!,
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
