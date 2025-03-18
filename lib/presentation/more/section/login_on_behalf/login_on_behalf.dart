part of 'package:ezrxmobile/presentation/more/more_tab.dart';

class LoginOnBehalf extends StatelessWidget {
  const LoginOnBehalf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return state.userCanLoginOnBehalf
            ? Material(
                color: ZPColors.white,
                child: ListTile(
                  key: WidgetKeys.loginOnBehalfButtonKey,
                  visualDensity: VisualDensity.compact,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: padding12),
                  minVerticalPadding: 0,
                  dense: true,
                  leading: const Icon(
                    Icons.login_outlined,
                    color: ZPColors.gradient,
                  ),
                  onTap: () {
                    context
                        .read<ProxyLoginFormBloc>()
                        .add(const ProxyLoginFormEvent.initialized());
                    showModalBottomSheet(
                      isDismissible: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) {
                        return const LoginOnBehalfSheet();
                      },
                    );
                  },
                  title: Text(
                    context.tr(
                      'Log in on behalf',
                    ),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.gradient,
                        ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
