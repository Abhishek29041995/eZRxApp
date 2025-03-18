import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      //   data = json.decode(
      //     await rootBundle
      //         .loadString('assets/json/getMaterialBundleListResponse.json'),
      //   );
    });
    // test('Test toDomain', () {
    //   dynamic makeResponseCamelCase(String resp) {
    //     final camelCaseJsonKeys = resp.replaceAllMapped(
    //       RegExp(
    //         '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
    //       ),
    //       (Match m) {
    //         return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
    //       },
    //     );

    //     return jsonDecode(camelCaseJsonKeys);
    //   }

    //   final configs = BundleInfoDto.fromJson(makeResponseCamelCase(jsonEncode(
    //     data['data']['GetBundles'][0]['Bundles'][0]['BundleInformation'][0],
    //   ))).toDomain();
    //   expect(configs.sequence, 1);
    // });

    // test('Test fromDomain', () {
    //   dynamic makeResponseCamelCase(String resp) {
    //     final camelCaseJsonKeys = resp.replaceAllMapped(
    //       RegExp(
    //         '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
    //       ),
    //       (Match m) {
    //         return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
    //       },
    //     );

    //     return jsonDecode(camelCaseJsonKeys);
    //   }

    //   final configsDto = BundleInfoDto.fromDomain(BundleInfoDto.fromJson(
    //     makeResponseCamelCase(
    //         jsonEncode(data['data']['GetBundles'][0]['Bundles'][0]['BundleInformation'][0])),
    //   ).toDomain());
    //   expect(configsDto.sequence, 1);
    // });

    // test('Test toJson', () {
    //   dynamic makeResponseCamelCase(String resp) {
    //     final camelCaseJsonKeys = resp.replaceAllMapped(
    //       RegExp(
    //         '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
    //       ),
    //       (Match m) {
    //         return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
    //       },
    //     );

    //     return jsonDecode(camelCaseJsonKeys);
    //   }

    //   final configsDtoMap = BundleInfoDto.fromDomain(BundleInfoDto.fromJson(
    //     makeResponseCamelCase(
    //         jsonEncode(data['data']['GetBundles'][0]['Bundles'][0]['BundleInformation'][0])),
    //   ).toDomain())
    //       .toJson();
    //   expect(configsDtoMap['sequence'], 1);
    // });
  });
}
