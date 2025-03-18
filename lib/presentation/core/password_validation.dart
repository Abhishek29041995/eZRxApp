import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordValidation extends StatelessWidget {
  final User user;
  const PasswordValidation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword ||
          previous.showErrorMessages != current.showErrorMessages,
      builder: (BuildContext context, ResetPasswordState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: padding24, bottom: padding12),
              child: Text(
                context.tr('Your new password should have :'),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchMinCharacter,
              msgText: 'Minimum length of 10 characters',
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneUpperCharacter,
              msgText: 'At least 1 Upper case character (A to Z)',
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneLowerCharacter,
              msgText: 'At least 1 Lower case character (a to z)',
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneNumericCharacter,
              msgText: 'At least a numeric character (0 to 9)',
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneSpecialCharacter,
              msgText:
                  'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
            ),
            _ConditionText(
              enableGreenTick: state
                  .newPasswordMustNotContainTwoConsecutiveCharsOfUserNameOrName(
                user: user,
              ),
              msgText:
                  'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
            ),
          ],
        );
      },
    );
  }
}

class _ConditionText extends StatelessWidget {
  final bool enableGreenTick;
  final String msgText;

  const _ConditionText({
    required this.msgText,
    required this.enableGreenTick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: padding6, right: padding12),
            child: enableGreenTick
                ? const Icon(
                    Icons.check,
                    color: ZPColors.green,
                    size: 15,
                  )
                : Icon(
                    Icons.circle,
                    color: context
                                .read<ResetPasswordBloc>()
                                .state
                                .showErrorMessages &&
                            !enableGreenTick
                        ? ZPColors.red
                        : ZPColors.passwordValidationsColor,
                    size: 5,
                  ),
          ),
          Expanded(
            child: Text(
              context.tr(msgText),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: context
                                .read<ResetPasswordBloc>()
                                .state
                                .showErrorMessages &&
                            !enableGreenTick
                        ? ZPColors.red
                        : ZPColors.passwordValidationsColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
