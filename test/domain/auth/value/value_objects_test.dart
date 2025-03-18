import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Username value object', () {
    test(
      'should return true when username is Valid',
      () async {
        const input = 'APPLE';
        final username = Username(input);
        final result = username.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid',
      () async {
        const input = 'Orange';
        final username = Username(input);
        final result = username.getOrCrash();
        expect(result, input);
      },
    );

    test(
      'should return error message when the username is empty',
      () async {
        const errorMessage = 'Username cannot be empty.';
        const input = '';
        final username = Username(input);
        final result = username.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'Banana';
        final username = Username(input);
        const input2 = 'Banana';
        final username2 = Username(input2);
        final result = username == username2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'Orange';
        final username = Username(input);
        const input2 = 'Banana';
        final username2 = Username(input2);
        final result = username == username2;
        expect(result, false);
      },
    );
  });

  group('EmailAddress value object', () {
    test(
      'should return true when email is Valid',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        final result = email.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid',
      () async {
        const input = 'support@google.com';
        final email = EmailAddress(input);
        final result = email.getOrCrash();
        expect(result, input);
      },
    );

    test(
      'should return error message when the email is empty',
      () async {
        const errorMessage = 'Email cannot be empty';
        const input = '';
        final email = EmailAddress(input);
        final result = email.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the email is invalid',
      () async {
        const errorMessage = 'Email is invalid';
        const input = 'ccxx.com';
        final email = EmailAddress(input);
        final result = email.value.fold(
          (f) => f.maybeMap(
            invalidEmail: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        const input2 = 'test@zuelligpharma.com';
        final email2 = EmailAddress(input2);
        final result = email == email2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        const input2 = 'support@google.com';
        final email2 = EmailAddress(input2);
        final result = email == email2;
        expect(result, false);
      },
    );
  });

  group('Password for login value object', () {
    test(
      'should return true when password is valid format',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid format',
      () async {
        const input = '456';
        final password = Password.login(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the password is empty',
      () async {
        const errorMessage = 'Password cannot be empty.';
        const input = '';
        final password = Password.login(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        const input2 = 'abc1234';
        final password2 = Password.login(input2);
        final result = password == password2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        const input2 = '456';
        final password2 = Password.login(input2);
        final result = password == password2;
        expect(result, false);
      },
    );
  });

  group('Password for reset value object', () {
    test(
      'should return true when password is valid format',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid format',
      () async {
        const input = 'zz#134Dzzzaa';
        final password = Password.reset(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the password is empty',
      () async {
        const errorMessage = 'Password cannot be empty.';
        const input = '';
        final password = Password.reset(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the password is invalid',
      () async {
        const errorMessage = 'Password not match requirements';
        const input = 'abc1234';
        final password = Password.reset(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            passwordNotMatchRequirements: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        const input2 = 'abc1234@cCc';
        final password2 = Password.reset(input2);
        final result = password == password2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        const input2 = 'zz#134Dzzzaa';
        final password2 = Password.reset(input2);
        final result = password == password2;
        expect(result, false);
      },
    );
  });

  group('JWT value object', () {
    test(
      'should return true when JWT is valid',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpIdkpOMTRnNjZxaXh0X2UwRHNMZnN1anR1MUx6aEV5bUFsQWkyN0Z6T0kub2Fya2Nyb2V6YkhlQk1nNWUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1NzAxMTI4OCwiZXhwIjoxNjU3MDE0ODg4LCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTcwMTEyODd9.Efp_o6rfc1QnfvDuGPiS6htiWmpKO_y5_o2dYhgcJ1VJ5ok26qR6fHQwkwB0LdwO0dWmHZu81HWtJBhJ29WUHBZdx8_QnzbMxGuy3ur0UzECco7hCUu8VBSZdL4vPc_FZGDYVLZlyi7w9HgKKXxf5ZdMuxDUL2sw2RTF8hRSJHuuDKqbxGTZhnFTlLRNK6ysZ0t_Ws0ZzqrDe073zMulTvu5578m6JU6zZ2kJvlbJS3_IDG3DH81Y4M_HDIPaB1n6wr2P_7KzRFKndVTsabRfjVGKMEr23JCag2z6NFhjbS7HfKWZIKOTUV3-eJFe638raEsmJjVndYUl5gtPymhBA';
        final jwt = JWT(input);
        final result = jwt.isValid();
        expect(result, true);
      },
    );

    test(
      'should return true when JWT is valid',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnBlVkNUOGhpd0xOTTN0S1E0QkJ3dGFwNGZfWDlXLUVtVHpKQkhVa1lyY2sub2Fya2NvcmN2eEZWVGFwbGUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1Njk5OTcxMCwiZXhwIjoxNjU3MDAzMzEwLCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTY5OTk3MDh9.f-R84B8AX7KaX98rjcw4ZlfJjdz5ZcpP_BlPlsOGGMdmfEnffyKw_Hlw6PqVBrF0tsI6wocypjHMu1LjFMlbvInHcQXzOrnGiMa-OYtHKurPDWlz95RwogvJIyqAe5G1qAvcd-cx9P8j9Tydn7mLSIHYdkNdc6DYD9LLoVIcJ7oSiTAHMFte-QWg07lMCucUSwgVGPgaeW7xPrEpyJmJC1A5PAaDmapjn_Q8o9y7cTCfW3TUtTOit8WTY4bEu_rZS4TP7v8xtj_WN9m96q8vMF8d2FGf9zSp7yqX2v3rpoMpKm2v4DId2AoSjHtgCwhIUJvelDtTDHWDxjwygTgY4Q';
        final jwt = JWT(input);
        final result = jwt.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the jwt is invalid',
      () async {
        const errorMessage = 'JWT token invalid';
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3';
        final jwt = JWT(input);
        final result = jwt.value.fold(
          (f) => f.maybeMap(
            invalidJWT: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true if the DateTime from expiretionDate is correct',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpIdkpOMTRnNjZxaXh0X2UwRHNMZnN1anR1MUx6aEV5bUFsQWkyN0Z6T0kub2Fya2Nyb2V6YkhlQk1nNWUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1NzAxMTI4OCwiZXhwIjoxNjU3MDE0ODg4LCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTcwMTEyODd9.Efp_o6rfc1QnfvDuGPiS6htiWmpKO_y5_o2dYhgcJ1VJ5ok26qR6fHQwkwB0LdwO0dWmHZu81HWtJBhJ29WUHBZdx8_QnzbMxGuy3ur0UzECco7hCUu8VBSZdL4vPc_FZGDYVLZlyi7w9HgKKXxf5ZdMuxDUL2sw2RTF8hRSJHuuDKqbxGTZhnFTlLRNK6ysZ0t_Ws0ZzqrDe073zMulTvu5578m6JU6zZ2kJvlbJS3_IDG3DH81Y4M_HDIPaB1n6wr2P_7KzRFKndVTsabRfjVGKMEr23JCag2z6NFhjbS7HfKWZIKOTUV3-eJFe638raEsmJjVndYUl5gtPymhBA';
        final jwt = JWT(input);
        final result = jwt.expirationDate;
        expect(result, DateTime.fromMillisecondsSinceEpoch(1657014888000));
      },
    );

    test(
      'should return true if the token already expired',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpIdkpOMTRnNjZxaXh0X2UwRHNMZnN1anR1MUx6aEV5bUFsQWkyN0Z6T0kub2Fya2Nyb2V6YkhlQk1nNWUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1NzAxMTI4OCwiZXhwIjoxNjU3MDE0ODg4LCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTcwMTEyODd9.Efp_o6rfc1QnfvDuGPiS6htiWmpKO_y5_o2dYhgcJ1VJ5ok26qR6fHQwkwB0LdwO0dWmHZu81HWtJBhJ29WUHBZdx8_QnzbMxGuy3ur0UzECco7hCUu8VBSZdL4vPc_FZGDYVLZlyi7w9HgKKXxf5ZdMuxDUL2sw2RTF8hRSJHuuDKqbxGTZhnFTlLRNK6ysZ0t_Ws0ZzqrDe073zMulTvu5578m6JU6zZ2kJvlbJS3_IDG3DH81Y4M_HDIPaB1n6wr2P_7KzRFKndVTsabRfjVGKMEr23JCag2z6NFhjbS7HfKWZIKOTUV3-eJFe638raEsmJjVndYUl5gtPymhBA';
        final jwt = JWT(input);
        final result = jwt.isExpired;
        expect(result, true);
      },
    );

    test(
      'should be negative on remaining time duration because the token already expired',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpIdkpOMTRnNjZxaXh0X2UwRHNMZnN1anR1MUx6aEV5bUFsQWkyN0Z6T0kub2Fya2Nyb2V6YkhlQk1nNWUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1NzAxMTI4OCwiZXhwIjoxNjU3MDE0ODg4LCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTcwMTEyODd9.Efp_o6rfc1QnfvDuGPiS6htiWmpKO_y5_o2dYhgcJ1VJ5ok26qR6fHQwkwB0LdwO0dWmHZu81HWtJBhJ29WUHBZdx8_QnzbMxGuy3ur0UzECco7hCUu8VBSZdL4vPc_FZGDYVLZlyi7w9HgKKXxf5ZdMuxDUL2sw2RTF8hRSJHuuDKqbxGTZhnFTlLRNK6ysZ0t_Ws0ZzqrDe073zMulTvu5578m6JU6zZ2kJvlbJS3_IDG3DH81Y4M_HDIPaB1n6wr2P_7KzRFKndVTsabRfjVGKMEr23JCag2z6NFhjbS7HfKWZIKOTUV3-eJFe638raEsmJjVndYUl5gtPymhBA';
        final jwt = JWT(input);
        final result = jwt.remainingTime;
        expect(result.isNegative, true);
      },
    );

    test(
      'should return false, because the issue time duration should be always positive',
      () async {
        const input =
            'eyJraWQiOiJ1ZUlHakNWSExJMkl5WXdIRXRia1VMbFdaVEI1OG5zMjFubFd4akIxM3gwIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULnpIdkpOMTRnNjZxaXh0X2UwRHNMZnN1anR1MUx6aEV5bUFsQWkyN0Z6T0kub2Fya2Nyb2V6YkhlQk1nNWUxZDYiLCJpc3MiOiJodHRwczovL3p1ZWxsaWcub2t0YXByZXZpZXcuY29tIiwiYXVkIjoiaHR0cHM6Ly96dWVsbGlnLm9rdGFwcmV2aWV3LmNvbSIsInN1YiI6IkpIQ2hvb0B6dWVsbGlncGhhcm1hLmNvbSIsImlhdCI6MTY1NzAxMTI4OCwiZXhwIjoxNjU3MDE0ODg4LCJjaWQiOiIwb2E0MDJleDUyREZLcDc0eTFkNyIsInVpZCI6IjAwdTN4dzNicDhPMGp0czkyMWQ3Iiwic2NwIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhdXRoX3RpbWUiOjE2NTcwMTEyODd9.Efp_o6rfc1QnfvDuGPiS6htiWmpKO_y5_o2dYhgcJ1VJ5ok26qR6fHQwkwB0LdwO0dWmHZu81HWtJBhJ29WUHBZdx8_QnzbMxGuy3ur0UzECco7hCUu8VBSZdL4vPc_FZGDYVLZlyi7w9HgKKXxf5ZdMuxDUL2sw2RTF8hRSJHuuDKqbxGTZhnFTlLRNK6ysZ0t_Ws0ZzqrDe073zMulTvu5578m6JU6zZ2kJvlbJS3_IDG3DH81Y4M_HDIPaB1n6wr2P_7KzRFKndVTsabRfjVGKMEr23JCag2z6NFhjbS7HfKWZIKOTUV3-eJFe638raEsmJjVndYUl5gtPymhBA';
        final jwt = JWT(input);
        final result = jwt.issueTime;
        expect(result.isNegative, false);
      },
    );

    test(
      'should return list if the token is valid for sales org',
      () async {
        const input =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY3MjEyNzk0NywiaWF0IjoxNjcyMDQxNTQ3LCJpZCI6NDc4NTgsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjAwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19LHsiY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyODAwIiwic2hpcFRvQ29kZSI6WyJhbGwiXX0seyJjdXN0b21lckNvZGUiOiJhbGwiLCJzYWxlc09yZyI6IjMwNzAiLCJzaGlwVG9Db2RlIjpbImFsbCJdfSx7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjkwMiIsInNoaXBUb0NvZGUiOlsiYWxsIl19LHsiY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyNjAxIiwic2hpcFRvQ29kZSI6WyJhbGwiXX0seyJjdXN0b21lckNvZGUiOiJhbGwiLCJzYWxlc09yZyI6IjIyMDAiLCJzaGlwVG9Db2RlIjpbImFsbCJdfSx7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjIwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19LHsiY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyMjAzIiwic2hpcFRvQ29kZSI6WyJhbGwiXX0seyJjdXN0b21lckNvZGUiOiJhbGwiLCJzYWxlc09yZyI6IjIyNTAiLCJzaGlwVG9Db2RlIjpbImFsbCJdfSx7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMzA1MCIsInNoaXBUb0NvZGUiOlsiYWxsIl19LHsiY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyNTAwIiwic2hpcFRvQ29kZSI6WyJhbGwiXX1dfV0sInJvbGUiOiJST09UIEFkbWluIiwic2FsZXNPcmdzIjpbIjIwMDEiLCIyODAwIiwiMzA3MCIsIjI5MDIiLCIyNjAxIiwiMjIwMCIsIjIyMDEiLCIyMjAzIiwiMjI1MCIsIjMwNTAiLCIyNTAwIl0sInVzZXJuYW1lIjoiaWFsYW0ifQ.fQ595rCWz7jrJN6Nn_gzW5ajsBA5GYLl6KuCfZfgx5M';
        final jwt = JWT(input);
        final payloadBase64 = input.split('.')[1];
        final normalizedPayload = base64.normalize(payloadBase64);
        final payloadString = utf8.decode(base64.decode(normalizedPayload));
        final decodedPayload = jsonDecode(payloadString);
        final result = jwt.salesOrgs;
        expect(result, decodedPayload['salesOrgs']);
      },
    );
  });

  group('Password for resetv2 value object', () {
    test(
      'should return an same input if the value satisfy all valid format',
      () async {
        const newPassword = 'Auron@2022!';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'fake-user';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   accessRight: AccessRight.empty(),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password = Password.resetV2(
          newPassword,
          oldPassword,
          fakeUserName,
        );
        final result = password.isValid();
        expect(result, true);
      },
    );

    // test(
    //   'should return error message when the new password is empty',
    //   () async {
    //     const errorMessage = 'Enter New Password.';
    //     const newPassword = '';
    //     const oldPassword = 'Auron@2022';
    //     final user = User(
    //       id: '1',
    //       username: Username('choo'),
    //       accessRight: AccessRight.empty(),
    //       email: EmailAddress('abc@gmail.com'),
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
    //     final password = Password.resetV2(newPassword, oldPassword);
    //     final result = password.value.fold(
    //       (f) => f.maybeMap(
    //         empty: (_) => errorMessage,
    //         orElse: () => null,
    //       ),
    //       (_) => null,
    //     );
    //     expect(result, errorMessage);
    //   },
    // );

    test(
      'should return error message when the new password contain atleast 10 characters',
      () async {
        const errorMessage = 'Minimum length of 10 characters';
        const newPassword = 'Auron@222';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'fake-user';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   accessRight: AccessRight.empty(),
        //   email: EmailAddress('abc@gmail.com'),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password = Password.resetV2(
          newPassword,
          oldPassword,
          fakeUserName,
        );
        final result = password.value.fold(
          (f) => f.maybeMap(
            subceedLength: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the new password contain atleast 1 upper case characters',
      () async {
        const errorMessage = 'Contain at least 1 Upper case character (A to Z)';
        const newPassword = 'auron@2022!';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'Auron@2022';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   accessRight: AccessRight.empty(),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password =
            Password.resetV2(newPassword, oldPassword, fakeUserName);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustOneUpperCaseCharacter: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the new password contain atleast 1 lower case characters',
      () async {
        const errorMessage = 'Contain at least 1 Lower case character (a to z)';
        const newPassword = 'AURON@2022!';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'Auron@2022';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   accessRight: AccessRight.empty(),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password =
            Password.resetV2(newPassword, oldPassword, fakeUserName);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustOneLowerCaseCharacter: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the new password contain atleast a numeric character',
      () async {
        const errorMessage = 'Contain at least a numeric character (0 to 9)';
        const newPassword = 'Auron@developer';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'Auron@2022';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   accessRight: AccessRight.empty(),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password =
            Password.resetV2(newPassword, oldPassword, fakeUserName);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustOneNumericCharacter: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the new password contain at least one special character ',
      () async {
        const errorMessage =
            'Contain at least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )';
        const newPassword = 'Auron20222';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'Auron@2022';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   accessRight: AccessRight.empty(),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password =
            Password.resetV2(newPassword, oldPassword, fakeUserName);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustOneSpecialCharacter: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    // test(
    //   'should return error message when the new password must not contain any part of your username and/or name',
    //   () async {
    //     const errorMessage =
    //         'Must not contain any part of your username and/or name';
    //     const newPassword = 'Dipankar@2022';
    //     const oldPassword = 'Auron@2022';
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
    //     final password = Password.resetV2(newPassword, oldPassword);
    //     final result = password.value.fold(
    //       (f) => f.maybeMap(
    //         mustNotContainUserName: (_) => errorMessage,
    //         orElse: () => null,
    //       ),
    //       (_) => null,
    //     );
    //     expect(result, errorMessage);
    //   },
    // );

    test(
      'should return error message when the new password cannot be same as old one',
      () async {
        const errorMessage = 'New password cannot be same as old one';
        const newPassword = 'Auron@2022';
        const oldPassword = 'Auron@2022';
        const fakeUserName = 'fake-user';
        // final user = User(
        //   id: '1',
        //   username: Username('choo'),
        //   email: EmailAddress('abc@gmail.com'),
        //   accessRight: AccessRight.empty(),
        //   fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        //   role: Role(
        //     id: '2',
        //     description: 'Developer',
        //     name: 'abc',
        //     type: RoleType('Developer'),
        //   ),
        //   customerCode: CustomerCode('2606'),
        //   userSalesOrganisations: [],
        //   settings: Settings.empty(),
        //   acceptPrivacyPolicy: false,
        //   enableOrderType: false,
        //   hasBonusOverride: false,
        //   disableCreateOrder: false,
        //   disableReturns: false,
        //   hasPriceOverride: false,
        //   mobileNumber: MobileNumber(''),
        //   supportedLanguages: <Language>[],
        // );
        final password =
            Password.resetV2(newPassword, oldPassword, fakeUserName);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustNotMatchOldPassword: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );
  });

  group('Password for confirm value object', () {
    test(
      'should return true when confirm password satisfy all valid format',
      () async {
        const newPassword = 'Auron@2022';
        const confirmPassword = 'Auron@2022';
        final password = Password.confirm(confirmPassword, newPassword);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the confrim password cannot be empty',
      () async {
        const errorMessage = 'Enter Confirm Password.';
        const newPassword = 'Auron@2022';
        const confirmPassword = '';
        final password = Password.confirm(confirmPassword, newPassword);
        final result = password.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the confrim password should same as new password',
      () async {
        const errorMessage = 'Please make sure your passwords match';
        const newPassword = 'Auron@2022';
        const confirmPassword = 'Auron@2022!';
        final password = Password.confirm(confirmPassword, newPassword);
        final result = password.value.fold(
          (f) => f.maybeMap(
            mustMatchNewPassword: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );
  });

  group('App Market value object', () {
    test(
      'SaleOrg for MY market',
      () {
        const input = '2001';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('my');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for MM market',
      () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('mm');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for PH market',
      () {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('ph');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for SG market',
      () {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('sg');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for TW market',
      () {
        const input = '2800';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('tw');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for TH market',
      () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('th');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for VN market',
      () {
        const input = '3000';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('vn');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for KR market',
      () {
        const input = '3101';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('kr');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for KH market',
      () {
        const input = '1500';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('kh');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for ID market',
      () {
        const input = '1900';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('id');
        expect(result.salesOrg, salesOrg);
      },
    );

    test(
      'SaleOrg for HK market',
      () {
        const input = '1700';
        final salesOrg = SalesOrg(input);
        final result = AppMarket('hk');
        expect(result.salesOrg, salesOrg);
      },
    );
  });
}
