import 'package:freezed_annotation/freezed_annotation.dart';

part 'mp_remote_config.freezed.dart';

@freezed
class MPRemoteConfig with _$MPRemoteConfig {
  const MPRemoteConfig._();

  const factory MPRemoteConfig({
    required List<String> whiteList,
  }) = _MPRemoteConfig;

  factory MPRemoteConfig.empty() => const MPRemoteConfig(
        whiteList: <String>[],
      );
}
