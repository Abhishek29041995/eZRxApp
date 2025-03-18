import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isFavourite;
  final VisualDensity? visualDensity;
  final VoidCallback onTap;
  final BoxConstraints? constraints;
  final bool enable;
  final double? iconSize;

  const FavouriteIcon({
    super.key,
    required this.isFavourite,
    required this.onTap,
    this.iconSize,
    this.visualDensity,
    this.constraints,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: ZPColors.transparent,
      splashColor: ZPColors.transparent,
      onPressed: enable ? onTap : null,
      visualDensity: visualDensity,
      padding: EdgeInsets.zero,
      constraints: constraints,
      key: WidgetKeys.favoritesIcon,
      iconSize: iconSize,
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
        color: ZPColors.darkYellow,
        key: WidgetKeys.statusFavoriteIcon(isFavourite),
      ),
    );
  }
}
