part of 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';

class _SaveClearChangesSection extends StatelessWidget {
  const _SaveClearChangesSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showNewPasswordPatternMismatchError !=
              current.showNewPasswordPatternMismatchError,
      builder: ((context, state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: ZPColors.lightGray2,
                indent: 0,
                endIndent: 0,
                height: 1,
              ),
              if (state.showNewPasswordPatternMismatchError)
                const ValidationsFailedWarning(),
              Padding(
                padding: const EdgeInsets.all(padding12),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        key: WidgetKeys.cancelButton,
                        onPressed: () {
                          _formKey.currentState?.reset();
                          context
                              .read<ResetPasswordBloc>()
                              .add(const ResetPasswordEvent.clear());
                        },
                        child: Text(
                          context.tr('Clear Changes'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: padding12,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        key: WidgetKeys.changePasswordButton,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<ResetPasswordBloc>().add(
                                const ResetPasswordEvent.changePassword(),
                              );
                        },
                        child: LoadingShimmer.withChild(
                          enabled: state.isSubmitting,
                          child: Text(context.tr('Save')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
