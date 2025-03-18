import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_reach_banner.freezed.dart';

@freezed
class EZReachBanner with _$EZReachBanner {
  const EZReachBanner._();

  const factory EZReachBanner({
    required String id,
    required int serial,
    required bool isPreSalesOrg,
    required bool isCustomer,
    required String mobileBannerUrl,
    required String tabBannerUrl,
    required String title,
    required String description,
    required String buttonLabel,
    required EZReachBannerLink navigationalURL,
    required String salesOrg,
    required StringValue keyword,
    required String category,
  }) = _EZReachBanner;

  factory EZReachBanner.empty() => EZReachBanner(
        id: '',
        serial: 0,
        isPreSalesOrg: false,
        isCustomer: false,
        mobileBannerUrl: '',
        title: '',
        description: '',
        buttonLabel: '',
        navigationalURL: EZReachBannerLink(''),
        salesOrg: '',
        keyword: StringValue(''),
        category: '',
        tabBannerUrl: '',
      );

  bool get isNotEmpty => this != EZReachBanner.empty();
}
