import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Claim Item', () {
    const fakePrincipalCode = 100;
    const fakePrincipalName = 'fake-principal-name';
    final claimItem = ClaimItem.empty().copyWith(
      principalCode: fakePrincipalCode,
      principalName: fakePrincipalName,
    );

    expect(
      claimItem.principalDisplay,
      '$fakePrincipalCode|$fakePrincipalName',
    );
  });
}
