import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details po doc ', () {
    setUp(() async {
      data = {
        'Url': 'fake-url',
        'Name': 'fake-name',
      };
    });

    test('Test fromDomain', () {
      final configsDto =
          PoDocumentsDto.fromDomain(PoDocumentsDto.fromJson(data).toDomain());
      expect(configsDto.url, 'fake-url');
    });

    test('Test fromDomain', () {
      final configsDto =
          PoDocumentsDto.fromDomain(PoDocumentsDto.fromJson(data).toDomain())
              .toJson();
      expect(configsDto['url'], 'fake-url');
    });
  });
}
