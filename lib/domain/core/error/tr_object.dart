import 'package:freezed_annotation/freezed_annotation.dart';

part 'tr_object.freezed.dart';

@freezed
class TRObject with _$TRObject {
  const TRObject._();
  const factory TRObject(
    String message, {
    @Default(<String, String>{}) Map<String, String> arguments,
  }) = _TRObject;
}
