import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_right.freezed.dart';

@freezed
class AccessRight with _$AccessRight {
  const AccessRight._();

  const factory AccessRight({
    required bool users,
    required bool orders,
    required bool promos,
    required bool hCPHUB,
    required bool products,
    required bool services,
    required bool analytics,
    required bool loyaltyScheme,
    required bool adminPOAttachment,
  }) = _AccessRight;

  factory AccessRight.empty() => const AccessRight(
        users: false,
        orders: false,
        promos: false,
        hCPHUB: false,
        products: false,
        services: false,
        analytics: false,
        loyaltyScheme: false,
        adminPOAttachment: false,
      );
}
