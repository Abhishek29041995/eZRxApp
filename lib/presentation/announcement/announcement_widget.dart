import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnnouncementBanner extends StatelessWidget {
  final Widget child;
  final String currentPath;
  const AnnouncementBanner({
    super.key,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnnouncementWidget(
          currentPath: currentPath,
        ),
        Expanded(child: child),
      ],
    );
  }
}

class AnnouncementWidget extends StatelessWidget {
  final String currentPath;

  const AnnouncementWidget({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (_, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (_, authState) {
            final displayTime = state.announcement.loginType;
            final isValidTime = authState.map<bool>(
              authenticated: (value) =>
                  displayTime.isPost || displayTime.isPreAndPost,
              initial: (value) => false,
              unauthenticated: (value) =>
                  displayTime.isPre || displayTime.isPreAndPost,
              biometricDenied: (value) => false,
              visitedAppSettings: (value) => false,
            );
            final isValidModule = state.announcement.isValidModuleToDisplay(
              currentPath: currentPath,
            );
            if (!state.announcement.hasValidAnnouncement ||
                state.isClosed ||
                !isValidTime ||
                !isValidModule) {
              return const SizedBox();
            }

            return ListTile(
              tileColor: ZPColors.announcementColor,
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 3),
              horizontalTitleGap: 8,
              subtitle: BlocConsumer<SalesOrgBloc, SalesOrgState>(
                listenWhen: (previous, current) =>
                    previous.salesOrg != current.salesOrg,
                listener: (context, salesOrgState) {
                  context.read<AnnouncementBloc>().add(
                        const AnnouncementEvent.changePreferLanguage(
                          preferSalesOrgLanguage: true,
                        ),
                      );
                },
                buildWhen: (previous, current) =>
                    previous.salesOrg != current.salesOrg,
                builder: (context, salesOrgState) {
                  final announcement = state.announcement.descriptionDisplay(
                    languageCode: state.preferSalesOrgLanguage
                        ? salesOrgState.salesOrg.languageCode
                        : context.locale.languageCode,
                  );

                  return Text(
                    announcement,
                    key: const Key(
                      'announcementDescription',
                    ),
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.white,
                        ),
                  );
                },
              ),
              leading: state.isLoading
                  ? Container(
                      width: 48,
                      alignment: Alignment.center,
                      child: const SizedBox(
                        key: Key(
                          'announcementLoadingIndicator',
                        ),
                        width: 24,
                        height: 10,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                          colors: [ZPColors.white],
                        ),
                      ),
                    )
                  : IconButton(
                      key: const Key('announcementReloadIcon'),
                      onPressed: () {
                        context.read<AnnouncementBloc>().add(
                              const AnnouncementEvent.getAnnouncement(),
                            );
                      },
                      icon: const Icon(
                        Icons.replay_outlined,
                        color: ZPColors.white,
                      ),
                    ),
              trailing: state.announcement.isCrossButton
                  ? IconButton(
                      key: const Key('announcementCloseIcon'),
                      onPressed: () {
                        context
                            .read<AnnouncementBloc>()
                            .add(const AnnouncementEvent.close());
                      },
                      icon: const Icon(
                        Icons.close,
                        color: ZPColors.white,
                      ),
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
