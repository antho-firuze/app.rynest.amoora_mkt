import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, this.isFavorite = false, this.onPressed});

  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Favorite',
      onPressed: onPressed,
      icon: isFavorite ? const Icon(Icons.favorite, color: oRed50) : const Icon(Icons.favorite_outline, color: oWhite),
    );
  }
}
