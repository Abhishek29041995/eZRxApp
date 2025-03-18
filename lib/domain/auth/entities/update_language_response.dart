import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_language_response.freezed.dart';

@freezed
class UpdateLanguageResponse with _$UpdateLanguageResponse {
  factory UpdateLanguageResponse({
    required bool success,
  }) = _UpdateLanguageResponse;
}
