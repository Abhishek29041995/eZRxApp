import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validateStringNotEmpty', () {
    test(
      'should return the original input String when represents a valid input',
      () async {
        const input = 'APPLE';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'test@zuelligpharma.com';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return the original input line enter when represents a line enter input',
      () async {
        const input = '\n';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty',
      () async {
        const input = '';
        final result = validateStringNotEmpty(input);
        expect(result, const Left(ValueFailure.empty(failedValue: input)));
      },
    );
  });

  group('validateEmailAddress', () {
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'test@zuelligpharma.com';
        final result = validateEmailAddress(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'abc@cc.xyz';
        final result = validateEmailAddress(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string not match the email pattern',
      () async {
        const input = 'zzzcccc.com';
        final result = validateEmailAddress(input);
        expect(
          result,
          const Left(ValueFailure.invalidEmail(failedValue: input)),
        );
      },
    );

    test(
      'should return failure when the string not match the email pattern',
      () async {
        const input = 'asdhjjahwd@ccc';
        final result = validateEmailAddress(input);
        expect(
          result,
          const Left(ValueFailure.invalidEmail(failedValue: input)),
        );
      },
    );
  });

  group('validatePassword', () {
    test(
      'should return the original input password when represents a valid password format',
      () async {
        const input = '121@ddXX_123';
        final result = validatePassword(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input password when represents a valid password format',
      () async {
        const input = 'Password@1235678';
        final result = validatePassword(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the input password not match the password pattern',
      () async {
        const input = 'zzxxxadasd123%%';
        final result = validatePassword(input);
        expect(
          result,
          const Left(
            ValueFailure.passwordNotMatchRequirements(failedValue: input),
          ),
        );
      },
    );

    test(
      'should return failure when the input password not match the password pattern',
      () async {
        const input = '2a2v2v';
        final result = validatePassword(input);
        expect(
          result,
          const Left(
            ValueFailure.passwordNotMatchRequirements(failedValue: input),
          ),
        );
      },
    );
  });

  group('validateMinStringLength', () {
    test(
      'should return the original input String when input length atleast n characters',
      () async {
        const input = 'APPLE_MAC_';
        final result = validateMinStringLength(input, 10);
        expect(result, const Right(input));
      },
    );

    test(
      'should return the original input String when String length minimum containing a new line',
      () async {
        const input = 'APE\nPIE';
        final result = validateMinStringLength(input, 6);
        expect(
          result,
          const Right(input),
        );
      },
    );

    test(
      'should return failure when the string is subceed the minimum length',
      () async {
        const input = 'APPLE';
        final result = validateMinStringLength(input, 6);
        expect(
          result,
          const Left(ValueFailure.subceedLength(failedValue: input, min: 6)),
        );
      },
    );

    test(
      'should return failure when the string is empty but expecting minimum length',
      () async {
        const input = '';
        final result = validateMinStringLength(input, 6);
        expect(
          result,
          const Left(ValueFailure.subceedLength(failedValue: input, min: 6)),
        );
      },
    );
  });

  group('atleastOneLowerCharacter', () {
    test(
      'should return the original input String when input contains atleast one lower case',
      () async {
        const input = 'APPLe';
        final result = atLeastOneLowerCharacter(
          input,
        );
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty expecting one lower case character',
      () async {
        const input = '';
        final result = atLeastOneLowerCharacter(
          input,
        );
        expect(
          result,
          const Left(
            ValueFailure.mustOneLowerCaseCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );

    test(
      'should return failure when the string does not contain atleast one lower case character',
      () async {
        const input = 'APPLE2';
        final result = atLeastOneLowerCharacter(input);
        expect(
          result,
          const Left(
            ValueFailure.mustOneLowerCaseCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );
  });

  group('atleastOneUpperCharacter', () {
    test(
      'should return the original input String when input contains atleast one upper case',
      () async {
        const input = 'Apple';
        final result = atLeastOneUpperCharacter(
          input,
        );
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty expecting one upper case character',
      () async {
        const input = '';
        final result = atLeastOneUpperCharacter(
          input,
        );
        expect(
          result,
          const Left(
            ValueFailure.mustOneUpperCaseCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );

    test(
      'should return failure when the string does not contain atleast one upper case character',
      () async {
        const input = 'apple';
        final result = atLeastOneUpperCharacter(input);
        expect(
          result,
          const Left(
            ValueFailure.mustOneUpperCaseCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );
  });

  group('atleastOneNumericCharacter', () {
    test(
      'should return the original input String when input contains atleast one numeric character',
      () async {
        const input = 'Apple@2022';
        final result = atLeastOneNumericCharacter(
          input,
        );
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty expecting one numeric character',
      () async {
        const input = '';
        final result = atLeastOneNumericCharacter(
          input,
        );
        expect(
          result,
          const Left(
            ValueFailure.mustOneNumericCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );

    test(
      'should return failure when the string does not contain atleast one numeric character',
      () async {
        const input = 'Apple@';
        final result = atLeastOneNumericCharacter(input);
        expect(
          result,
          const Left(
            ValueFailure.mustOneNumericCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );
  });

  group('atleastOneSpecialCharacter', () {
    test(
      'should return the original input String when input contains atleast one special character',
      () async {
        const input = 'Apple@2022';
        final result = atLeastOneSpecialCharacter(
          input,
        );
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty expecting one special character',
      () async {
        const input = '';
        final result = atLeastOneSpecialCharacter(
          input,
        );
        expect(
          result,
          const Left(
            ValueFailure.mustOneSpecialCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );

    test(
      'should return failure when the string does not contain atleast one special character',
      () async {
        const input = 'Apple2';
        final result = atLeastOneSpecialCharacter(input);
        expect(
          result,
          const Left(
            ValueFailure.mustOneSpecialCharacter(
              failedValue: input,
            ),
          ),
        );
      },
    );
  });

  group('validateContainUserNameOrName', () {
    // test(
    //   'should return the original input String when input must not contains userName or name',
    //   () async {
    //     const input = 'Apple@2022';
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
    //     final result = validateContainUserNameOrName(input, user);
    //     expect(result, const Right(input));
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
    //     final result = validateContainUserNameOrName(input, user);
    //     expect(
    //       result,
    //       const Left(
    //         ValueFailure.mustNotContainUserName(failedValue: input),
    //       ),
    //     );
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
    //     final result = validateContainUserNameOrName(input, user);
    //     expect(
    //       result,
    //       const Left(
    //         ValueFailure.mustNotContainUserName(failedValue: input),
    //       ),
    //     );
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
    //     final result = validateContainUserNameOrName(input, user);
    //     expect(
    //       result,
    //       const Left(
    //         ValueFailure.mustNotContainUserName(failedValue: input),
    //       ),
    //     );
    //   },
    // );
  });

  group('validateIntegerValue', () {
    test(
      'should return the integer when input is an integer string',
      () async {
        const input = '8';
        final result = validateIntegerValue(
          input,
        );
        expect(result, const Right(8));
      },
    );
    test(
      'should return the integer when input is a double string',
      () async {
        const input = '8.342';
        final result = validateIntegerValue(
          input,
        );
        expect(result, const Right(8));
      },
    );

    test(
      'should return failure when the string is not a number',
      () async {
        const input = 'any-string-not-number';
        final result = validateIntegerValue(input);
        expect(
          result,
          const Left(
            ValueFailure.invalidIntegerValue(
              failedValue: 0,
            ),
          ),
        );
      },
    );
  });
}
