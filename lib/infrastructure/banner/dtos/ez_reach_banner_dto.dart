import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ez_reach_banner_dto.freezed.dart';
part 'ez_reach_banner_dto.g.dart';

@freezed
class EZReachBannerDto with _$EZReachBannerDto {
  const EZReachBannerDto._();

  @HiveType(typeId: 5)
  const factory EZReachBannerDto({
    @JsonKey(name: 'bannerId', defaultValue: '')
    @HiveField(0)
    required String bannerId,
    @JsonKey(name: 'bannerCampaignName', defaultValue: '')
    @HiveField(1)
    required String bannerCampaignName,
    @JsonKey(name: 'startDate', defaultValue: '')
    @HiveField(2)
    required String startDate,
    @JsonKey(name: 'bannerUrl', defaultValue: '')
    @HiveField(3)
    required String tabBannerUrl,
    @JsonKey(name: 'endDate', defaultValue: '')
    @HiveField(4)
    required String endDate,
    @JsonKey(name: 'websiteUrl', defaultValue: '')
    @HiveField(5)
    required String navigationalURL,
    @JsonKey(name: 'bannerCountId', defaultValue: 0)
    @HiveField(6)
    required int bannerCountId,
    @JsonKey(name: 'salesRep', defaultValue: false)
    @HiveField(7)
    required bool salesRep,
    @JsonKey(name: 'status', defaultValue: '')
    @HiveField(8)
    required String status,
    @JsonKey(name: 'customers', defaultValue: false)
    @HiveField(9)
    required bool customers,
    @JsonKey(name: 'companyName', defaultValue: '')
    @HiveField(10)
    required String companyName,
    @JsonKey(name: 'targetProduct', defaultValue: '')
    @HiveField(11)
    required String targetProduct,
    @JsonKey(name: 'keyWord', defaultValue: '')
    @HiveField(12)
    required String keyWord,
    @JsonKey(name: 'bannerCampaignLocations', defaultValue: <String>[])
    @HiveField(13)
    required List<String> bannerCampaignLocations,
    @JsonKey(name: 'salesOrg', defaultValue: <String>[])
    @HiveField(14)
    required List<String> salesOrg,
    @JsonKey(name: 'countryCode', defaultValue: <String>[])
    @HiveField(15)
    required List<String> countryCode,
    @JsonKey(name: 'mobileBannerImg', defaultValue: '')
    @HiveField(16)
    required String mobileBannerUrl,
  }) = _EZReachBannerDto;

  factory EZReachBannerDto.fromJson(Map<String, dynamic> json) =>
      _$EZReachBannerDtoFromJson(json);

  EZReachBanner toDomain() {
    return EZReachBanner.empty().copyWith(
      id: bannerId,
      mobileBannerUrl: mobileBannerUrl.isEmpty ? tabBannerUrl : mobileBannerUrl,
      title: bannerCampaignName,
      description: targetProduct,
      navigationalURL: EZReachBannerLink(navigationalURL),
      serial: bannerCountId,
      isCustomer: customers,
      tabBannerUrl: tabBannerUrl,
      keyword: StringValue(keyWord),
    );
  }

  factory EZReachBannerDto.fromDomain(EZReachBanner banner) {
    return EZReachBannerDto(
      bannerId: banner.id,
      tabBannerUrl: banner.tabBannerUrl,
      bannerCampaignName: banner.title,
      targetProduct: banner.description,
      navigationalURL: banner.navigationalURL.getOrDefaultValue(''),
      bannerCountId: banner.serial,
      customers: banner.isCustomer,
      keyWord: banner.keyword.getOrDefaultValue(''),
      salesOrg: [banner.salesOrg],
      mobileBannerUrl: banner.mobileBannerUrl,
      startDate: '',
      endDate: '',
      salesRep: banner.isPreSalesOrg,
      status: '',
      companyName: '',
      bannerCampaignLocations: <String>[],
      countryCode: <String>[],
    );
  }
}
