import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class AssetCard extends ConsumerWidget {
  const AssetCard({
    super.key,
    required this.assetEntity,
    this.onTap,
  });

  final AssetEntity assetEntity;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onTap,
            child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
