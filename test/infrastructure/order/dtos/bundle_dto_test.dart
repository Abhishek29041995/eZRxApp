import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // late dynamic data;
  group('Test bundleDto ', () {
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

    //   final configs = BundleDto.fromJson(makeResponseCamelCase(jsonEncode(
    //     data['data']['GetBundles'][0]['Bundles'][0],
    //   ))).toDomain();
    //   expect(configs.bundleCode, '0010276898');
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

    //   final configsDto = BundleDto.fromDomain(BundleDto.fromJson(
    //     makeResponseCamelCase(
    //         jsonEncode(data['data']['GetBundles'][0]['Bundles'][0])),
    //   ).toDomain());
    //   expect(configsDto.bundleCode, '0010276898');
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

    //   final configsDtoMap = BundleDto.fromDomain(BundleDto.fromJson(
    //     makeResponseCamelCase(
    //         jsonEncode(data['data']['GetBundles'][0]['Bundles'][0])),
    //   ).toDomain())
    //       .toJson();
    //   expect(configsDtoMap['bundleCode'], '0010276898');
    // });
  });
}
