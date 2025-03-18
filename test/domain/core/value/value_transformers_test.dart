import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // group('stringTitleCase', () {
  //   test(
  //     'should return an String with title case',
  //     () async {
  //       const input = 'APPLE CARE';
  //       final result = stringTitleCase(input);
  //       expect(result, 'Apple Care');
  //     },
  //   );

  //   test(
  //     'should return an String with title case',
  //     () async {
  //       const input = 'orange juice';
  //       final result = stringTitleCase(input);
  //       expect(result, 'Orange Juice');
  //     },
  //   );

  //   test(
  //     'should return an String with title case',
  //     () async {
  //       const input = 'Zuellig Pharma';
  //       final result = stringTitleCase(input);
  //       expect(result, 'Zuellig Pharma');
  //     },
  //   );
  // });

  group('removeLeadingZero', () {
    test(
      'should return an String without zero',
      () async {
        const input = '000123';
        final result = removeLeadingZero(input);
        expect(result, '123');
      },
    );

    test(
      'should return an String without zero',
      () async {
        const input = '0234';
        final result = removeLeadingZero(input);
        expect(result, '234');
      },
    );

    test(
      'should return an String without zero',
      () async {
        const input = '45456';
        final result = removeLeadingZero(input);
        expect(result, '45456');
      },
    );
  });

  group('naIfEmpty', () {
    test(
      'should return an NA if is empty String',
      () async {
        const input = '';
        final result = naIfEmpty(input);
        expect(result, 'NA');
      },
    );

    test(
      'should return an String if not empty String',
      () async {
        const input = '0234';
        final result = naIfEmpty(input);
        expect(result, '0234');
      },
    );

    test(
      'should return an String if not empty String',
      () async {
        const input = 'ccc213fa';
        final result = naIfEmpty(input);
        expect(result, 'ccc213fa');
      },
    );
  });

  group('isMinTenCharacter', () {
    test(
      'should return boolean true when input String is minimum n character long',
      () async {
        const input = 'APPLE CARE';
        final result = isMinCharacter(input: input, minLength: 6);
        expect(result, true);
      },
    );

    test(
      'should return boolean true when input String is minimum n character long containing a new line',
      () async {
        const input = 'APPLE\nCARE';
        final result = isMinCharacter(input: input, minLength: 10);
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isMinCharacter(input: input, minLength: 6);
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String is less than minimum length',
      () async {
        const input = 'Zuellig Pharma';
        final result = isMinCharacter(input: input, minLength: 16);
        expect(result, false);
      },
    );
  });

  group('isAtleastOneLowerCharacter', () {
    test(
      'should return boolean true when input String is atleast one lower case character',
      () async {
        const input = 'ApPLE CARE';
        final result = isAtLeastOneLowerCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtLeastOneLowerCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any lower case character',
      () async {
        const input = 'APPLE';
        final result = isAtLeastOneLowerCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneUpperCharacter', () {
    test(
      'should return boolean true when input String is atleast one upper case character',
      () async {
        const input = 'Apple';
        final result = isAtLeastOneUpperCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtLeastOneUpperCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any upper case character',
      () async {
        const input = 'apple';
        final result = isAtLeastOneUpperCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneNumericCharacter', () {
    test(
      'should return boolean true when input String is atleast one numeric case character',
      () async {
        const input = 'Apple1';
        final result = isAtLeastOneNumericCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtLeastOneNumericCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any numeric character',
      () async {
        const input = 'apple';
        final result = isAtLeastOneNumericCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneSpecialCharacter', () {
    test(
      'should return boolean true when input String is atleast one special character',
      () async {
        const input = 'Apple@1';
        final result = isAtLeastOneSpecialCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtLeastOneSpecialCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any special character',
      () async {
        const input = 'apple';
        final result = isAtLeastOneSpecialCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isMustNotContainUserNameOrName', () {
    // test(
    //   'should return boolean true when input String must not contain username Or name',
    //   () async {
    //     const input = 'Apple@1';
    //     final user = User(
    //       id: '1',
    //       username: Username('choo'),
    //       email: EmailAddress('abc@gmail.com'),
    //       accessRight: AccessRight.empty(),
    //       fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
    //       role: Role(
    //         id: '2',
    //         description: 'Developer',
    //         name: 'abc',
    //         type: RoleType('Developer'),
    //       ),
    //       customerCode: CustomerCode('2606'),
    //       userSalesOrganisations: [],
    //       settings: Settings.empty(),
    //       acceptPrivacyPolicy: false,
    //       enableOrderType: false,
    //       hasBonusOverride: false,
    //       disableCreateOrder: false,
    //       disableReturns: false,
    //       hasPriceOverride: false,
    //       preferredLanguage: const Locale(ApiLanguageCode.english),
    //       mobileNumber: MobileNumber(''),
    //       supportedLanguages: <Language>[],
    //     );
    //     final result = isMustNotContainUserNameOrName(input: input, user: user);
    //     expect(result, true);
    //   },
    // );

    // test(
    //   'should return failure when input contains name (first name)',
    //   () async {
    //     const input = 'Appledipankar@2022';
    //     final user = User(
    //       id: '1',
    //       username: Username('choo'),
    //       email: EmailAddress('abc@gmail.com'),
    //       accessRight: AccessRight.empty(),
    //       fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
    //       role: Role(
    //         id: '2',
    //         description: 'Developer',
    //         name: 'abc',
    //         type: RoleType('Developer'),
    //       ),
    //       customerCode: CustomerCode('2606'),
    //       userSalesOrganisations: [],
    //       settings: Settings.empty(),
    //       acceptPrivacyPolicy: false,
    //       enableOrderType: false,
    //       hasBonusOverride: false,
    //       disableCreateOrder: false,
    //       disableReturns: false,
    //       hasPriceOverride: false,
    //       preferredLanguage: const Locale(ApiLanguageCode.english),
    //       mobileNumber: MobileNumber(''),
    //       supportedLanguages: <Language>[],
    //     );
    //     final result = isMustNotContainUserNameOrName(input: input, user: user);
    //     expect(result, false);
    //   },
    // );

    // test(
    //   'should return failure when input contains name (last name)',
    //   () async {
    //     const input = 'Appledas@2022';
    //     final user = User(
    //       id: '1',
    //       username: Username('choo'),
    //       email: EmailAddress('abc@gmail.com'),
    //       accessRight: AccessRight.empty(),
    //       fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
    //       role: Role(
    //         id: '2',
    //         description: 'Developer',
    //         name: 'abc',
    //         type: RoleType('Developer'),
    //       ),
    //       customerCode: CustomerCode('2606'),
    //       userSalesOrganisations: [],
    //       settings: Settings.empty(),
    //       acceptPrivacyPolicy: false,
    //       enableOrderType: false,
    //       hasBonusOverride: false,
    //       disableCreateOrder: false,
    //       disableReturns: false,
    //       hasPriceOverride: false,
    //       preferredLanguage: const Locale(ApiLanguageCode.english),
    //       mobileNumber: MobileNumber(''),
    //       supportedLanguages: <Language>[],
    //     );
    //     final result = isMustNotContainUserNameOrName(input: input, user: user);
    //     expect(result, false);
    //   },
    // );

    // test(
    //   'should return failure when input contains name (username)',
    //   () async {
    //     const input = 'Applechoo@2022';
    //     final user = User(
    //       id: '1',
    //       username: Username('choo'),
    //       email: EmailAddress('abc@gmail.com'),
    //       accessRight: AccessRight.empty(),
    //       fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
    //       role: Role(
    //         id: '2',
    //         description: 'Developer',
    //         name: 'abc',
    //         type: RoleType('Developer'),
    //       ),
    //       customerCode: CustomerCode('2606'),
    //       userSalesOrganisations: [],
    //       settings: Settings.empty(),
    //       acceptPrivacyPolicy: false,
    //       enableOrderType: false,
    //       hasBonusOverride: false,
    //       disableCreateOrder: false,
    //       disableReturns: false,
    //       hasPriceOverride: false,
    //       preferredLanguage: const Locale(ApiLanguageCode.english),
    //       mobileNumber: MobileNumber(''),
    //       supportedLanguages: <Language>[],
    //     );
    //     final result = isMustNotContainUserNameOrName(input: input, user: user);
    //     expect(result, false);
    //   },
    // );
  });

  test(
    'should return boolean false when input String is empty',
    () async {
      const input = 0.0;
      final result = emptyIfZero(
        input,
      );
      expect(result, '');
    },
  );

  test(
    'should return dash  when input String is empty',
    () async {
      const input = '';
      final result = dashIfEmpty(
        input,
      );
      expect(result, '-');
    },
  );

  test(
    'should return true if input is successful or Processed',
    () async {
      const inputForSuccessful = 'Successful';
      final resultForSuccessful = isSuccessfulOrProcessed(
        inputForSuccessful,
      );
      const inputForProcessed = 'Processed';
      final resultForProcessed = isSuccessfulOrProcessed(
        inputForProcessed,
      );
      expect(
        resultForProcessed,
        true,
      );
      expect(resultForSuccessful, true);

      const inputForInProgress = 'In Progress';
      final resultForInProgress = isSuccessfulOrProcessed(
        inputForInProgress,
      );
      expect(resultForInProgress, false);
    },
  );

  test('Should get text Failed when status is FAILED', () {
    const apiStatus = 'FAILED';
    final statusText = getStatusText(apiStatus);
    expect(statusText, 'Failed');
  });
}
