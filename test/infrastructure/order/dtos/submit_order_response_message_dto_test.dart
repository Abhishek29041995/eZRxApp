import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_message_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'Type': 'fake-type',
        'Message': 'fake-message',
      };
    });
    test('Test fromDomain', () {
      final configsDto = SubmitOrderResponseMessageDto.fromDomain(
        SubmitOrderResponseMessageDto.fromJson(data).toDomain(),
      );

      expect(configsDto.type, 'fake-type');
    });

    test('Test toJson', () {
      final configsDto = SubmitOrderResponseMessageDto.fromDomain(
        SubmitOrderResponseMessageDto.fromJson(data).toDomain(),
      ).toJson();

      expect(configsDto['Type'], 'fake-type');
    });
  });
}
