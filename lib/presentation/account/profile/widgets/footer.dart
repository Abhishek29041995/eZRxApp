part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: ZPColors.boxShadowGray,
            ),
          ],
          color: ZPColors.white,
        ),
        padding: const EdgeInsets.all(padding12),
        child: BlocConsumer<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user.preferredLanguage != current.user.preferredLanguage,
          listener: (context, state) => CustomSnackBar(
            messageText: context.tr('Language changed successfully'),
          ).show(context),
          buildWhen: (previous, current) =>
              previous.user.preferredLanguage !=
                  current.user.preferredLanguage ||
              previous.activeLanguage != current.activeLanguage,
          builder: (context, userState) {
            return Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: WidgetKeys.profileClearButton,
                    onPressed: userState.user.preferredLanguage !=
                            userState.activeLanguage
                        ? () => context.read<UserBloc>().add(
                              UserEvent.selectLanguage(
                                context
                                    .read<UserBloc>()
                                    .state
                                    .user
                                    .preferredLanguage,
                              ),
                            )
                        : null,
                    child: Text('Clear changes'.tr()),
                  ),
                ),
                const SizedBox(width: padding12),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.profileSaveButton,
                    onPressed: userState.user.preferredLanguage !=
                            userState.activeLanguage
                        ? () => context.read<UserBloc>().add(
                              UserEvent.updateLanguage(
                                userState.activeLanguage,
                              ),
                            )
                        : null,
                    child: Text('Save'.tr()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
