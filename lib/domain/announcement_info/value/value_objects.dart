import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

class HtmlContent extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory HtmlContent(String input) {
    return HtmlContent._(right(input));
  }

  String get appendedImgSrcWithBaseUrl =>
      addBaseUrlToImgSrc(value.getOrElse(() => ''));

  String get appendedImgSrcWithBaseUrlWithMedia =>
      addBaseUrlToImgSrcWithMedia(value.getOrElse(() => ''));

  const HtmlContent._(this.value);
}

class Attachment extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Attachment(String input) {
    return Attachment._(right(input));
  }

  String get getSvgIconForFileType =>
      svgIconForFileType(value.getOrElse(() => ''));
  String get getFileNameFromPath => fileNameFromPath(value.getOrElse(() => ''));

  const Attachment._(this.value);
}
