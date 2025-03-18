import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final locator = GetIt.instance;

  group('EZReachBannerLink value object', () {
    setUpAll(
      () => locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat),
    );
    test(
      'valid External url',
      () {
        const input = 'https://www.larocheposay.vn/';
        final username = EZReachBannerLink(input);
        expect(username.isExternalLink, true);
      },
    );

    test(
      'invalid  External url',
      () {
        const input = 'www.larocheposay.vn';
        final username = EZReachBannerLink(input);
        expect(username.isExternalLink, false);
      },
    );

    test(
      'valid External url',
      () {
        const input =
            'https://uat-ph.ezrxplus.com/product-details/000000000011002079';
        final username = EZReachBannerLink(input);
        expect(username.isInternalLink, true);
      },
    );

    test(
      'invalid Internal url',
      () {
        const input = 'https://www.larocheposay.vn/';
        final username = EZReachBannerLink(input);
        expect(username.isInternalLink, false);
      },
    );
  });
}
