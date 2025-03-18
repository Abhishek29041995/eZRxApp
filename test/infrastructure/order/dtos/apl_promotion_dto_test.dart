import 'package:ezrxmobile/infrastructure/order/dtos/apl_promotions_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test AplPromotionDto ', () {
    setUp(() async {
      data = {'discountValue': -5, 'discountTypeValue': '%'};
    });
    test('Test toDomain', () {
      final aplPromotions = AplPromotionsDto.fromJson(
        data,
      ).toDomain;
      expect(aplPromotions.discountTypeValue.getOrCrash(), '%');
    });
  });
}
