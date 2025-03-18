import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class EdgeCheckbox extends StatelessWidget {
  final Widget body;
  final bool value;
  final ValueChanged<bool> onChanged;

  const EdgeCheckbox({
    super.key,
    required this.body,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(!value);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: value ? ZPColors.greenIconColor : ZPColors.transparent,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: body,
          ),
          _SelectedIcon(visible: value),
        ],
      ),
    );
  }
}

class _SelectedIcon extends StatelessWidget {
  const _SelectedIcon({
    required this.visible,
  });
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return visible
        ? Positioned(
            key: WidgetKeys.itemCheckBadge,
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: _Triangle(),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: const BoxDecoration(
                      color: ZPColors.greenIconColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 4,
                    child: Icon(
                      Icons.check,
                      size: MediaQuery.of(context).size.width * 0.05,
                      color: ZPColors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  //ignore: code-duplication
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
