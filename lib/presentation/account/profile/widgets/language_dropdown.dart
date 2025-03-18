part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _LanguageDropDown extends StatelessWidget {
  const _LanguageDropDown();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '${'Language'.tr()}:',
            key: WidgetKeys.profilePageLanguageDropdownLabel,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
        ),
        Expanded(
          flex: 7,
          child: BlocConsumer<UserBloc, UserState>(
            listenWhen: (previous, current) =>
                previous.user.preferredLanguage !=
                current.user.preferredLanguage,
            listener: (context, state) {
              context.setLocale(state.user.preferredLanguage.locale);
            },
            buildWhen: (previous, current) =>
                current.activeLanguage != previous.activeLanguage,
            builder: (context, state) {
              return DropdownButtonFormField2<Language>(
                key: WidgetKeys.profilePageLanguageDropdown,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.fromLTRB(0, padding6, padding6, padding6),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ZPColors.black,
                  ),
                ),
                items: state.user.supportedLanguages
                    .map(
                      (e) => DropdownMenuItem<Language>(
                        key: WidgetKeys.genericKey(
                          key: 'language_${e.languageString}',
                        ),
                        value: e,
                        child: Text(e.languageString),
                      ),
                    )
                    .toList(),
                value: state.activeLanguage,
                onChanged: state.user.supportMultipleLanguage
                    ? (selectedLanguage) => context.read<UserBloc>().add(
                          UserEvent.selectLanguage(
                            selectedLanguage ?? Language.english(),
                          ),
                        )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
