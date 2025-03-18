import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

String addBaseUrlToImgSrc(String input) {
  final document = HtmlParser.parseHTML(input);
  final imgElements = document.querySelectorAll('img');
  for (final element in imgElements) {
    final srcAttribute = element.attributes['src'];
    if (srcAttribute != null && !srcAttribute.startsWith('http')) {
      element.attributes['src'] =
          '${GetIt.instance<Config>().announcementImageBaseUrl}${srcAttribute.replaceRange(0, 3, '')}';
    }
  }

  return document.outerHtml;
}

String addBaseUrlToImgSrcWithMedia(String input) {
  final document = HtmlParser.parseHTML(input);
  final imgElements = document.querySelectorAll('img');
  for (final element in imgElements) {
    final srcAttribute = element.attributes['src'];
    if (srcAttribute != null && !srcAttribute.startsWith('http')) {
      final cleanedSrcAttribute = srcAttribute.replaceAll('"', '');
      element.attributes['src'] =
          '${GetIt.instance<Config>().announcementImageBaseUrl}media$cleanedSrcAttribute';
    }
  }

  return document.outerHtml;
}

String svgIconForFileType(String source) {
  switch (fileTypeFromPath(source)) {
    case '.pdf':
      return SvgImage.pdfIcon;
    case '.doc':
      return SvgImage.documentIcon;
    case '.xls':
      return SvgImage.xlsIcon;
    default:
      return SvgImage.documentIcon;
  }
}
