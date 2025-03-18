import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage.freezed.dart';

@freezed
class Usage with _$Usage {
  const Usage._();

  const factory Usage({
    required String usageCode,
    required String usageDescription,
  }) = _Usage;

  factory Usage.empty() => const Usage(
        usageCode: '',
        usageDescription: '',
      );
}
