import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_remote_config.freezed.dart';

@freezed
class PromotionRemoteConfig with _$PromotionRemoteConfig {
  const PromotionRemoteConfig._();

  const factory PromotionRemoteConfig({
    required List<String> blackList,
  }) = _PromotionRemoteConfig;

  factory PromotionRemoteConfig.empty() => const PromotionRemoteConfig(
        blackList: <String>[],
      );
}
