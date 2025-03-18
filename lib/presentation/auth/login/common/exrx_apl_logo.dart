import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class EzrxAplLogo extends StatelessWidget {
  const EzrxAplLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.ezrxAplLogo,
      padding: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        SvgImage.ezrxapl,
      ),
    );
  }
}
