import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('EZPoint Token', () {
    final eZPointToken = EZPointToken.empty().copyWith(
      ezPointToken: 'fake-token',
    );

    expect(eZPointToken.ezPointToken, 'fake-token');
    expect(eZPointToken.isNotEmpty, true);
  });
}
