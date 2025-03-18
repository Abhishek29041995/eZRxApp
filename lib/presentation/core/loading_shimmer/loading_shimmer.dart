import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

part 'with_child.dart';
part 'tile.dart';
part 'logo.dart';
part 'material_loading_shimmer.dart';

enum LoadingShimmerType {
  withChild,
  tile,
  logo,
  circular,
  product,
}

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer._({
    super.key,
    required this.type,
    this.child,
    this.enabled,
    this.line,
    this.center = true,
  });
  final LoadingShimmerType type;
  final Widget? child;
  final bool? enabled;
  final int? line;
  final bool center;

  factory LoadingShimmer.withChild({
    required Widget child,
    bool enabled = true,
    bool center = true,
  }) {
    return LoadingShimmer._(
      type: LoadingShimmerType.withChild,
      enabled: enabled,
      center: center,
      child: child,
    );
  }

  factory LoadingShimmer.tile({
    bool enabled = true,
    int line = 1,
  }) {
    return LoadingShimmer._(
      type: LoadingShimmerType.tile,
      enabled: enabled,
      line: line,
    );
  }

  factory LoadingShimmer.logo({Key? key}) {
    return LoadingShimmer._(
      type: LoadingShimmerType.logo,
      key: key,
    );
  }

  factory LoadingShimmer.circular() =>
      const LoadingShimmer._(type: LoadingShimmerType.circular);

  factory LoadingShimmer.product() => const LoadingShimmer._(
        type: LoadingShimmerType.product,
      );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingShimmerType.withChild:
        return _WithChild(
          enabled: enabled!,
          center: center,
          child: child!,
        );
      case LoadingShimmerType.logo:
        return const _Logo();
      case LoadingShimmerType.tile:
        return _Tile(enabled: enabled!, line: line!);
      case LoadingShimmerType.circular:
        return LoadingAnimationWidget.discreteCircle(
          key: WidgetKeys.loader,
          color: ZPColors.primary,
          secondRingColor: ZPColors.secondary,
          thirdRingColor: ZPColors.orange,
          size: 30,
        );
      case LoadingShimmerType.product:
        return const MaterialLoading();
    }
  }
}
