import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PdfViewPage extends StatelessWidget {
  final String url;
  final String titleText;
  const PdfViewPage({
    super.key,
    this.url = '',
    this.titleText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: titleText.isEmpty,
        title: titleText.isNotEmpty
            ? Text(context.tr(titleText))
            : SvgPicture.asset(
                'assets/svg/ezrx+logo.svg',
                height: 30,
                fit: BoxFit.scaleDown,
              ),
      ),
      body: SafeArea(
        child: PDF(
          pageFling: false,
          autoSpacing: !Platform.isAndroid,
        ).fromUrl(
          url,
          placeholder: (double progress) => Align(
            alignment: Alignment.center,
            child: LoadingShimmer.circular(),
          ),
          errorWidget: (error) => Center(
            key: WidgetKeys.errorLoadingUrl,
            child: Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.1,
              ),
              child: Image.asset(
                PngImage.error,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
