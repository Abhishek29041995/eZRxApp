import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class EZPointWebviewPage extends StatefulWidget {
  const EZPointWebviewPage({super.key});

  @override
  State<EZPointWebviewPage> createState() => _EZPointWebviewPageState();
}

class _EZPointWebviewPageState extends State<EZPointWebviewPage> {
  late PullToRefreshController pullToRefreshController;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: ZPColors.primary),
      onRefresh: () {
        pullToRefreshController.endRefreshing();
        context.read<EZPointBloc>().add(
              EZPointEvent.fetch(
                customerCodeInfo:
                    context.read<EligibilityBloc>().state.customerCodeInfo,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('eZPoint')),
        centerTitle: false,
      ),
      body: SafeArea(
        child: BlocConsumer<EZPointBloc, EZPointState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          listenWhen: (previous, current) =>
              previous.eZPointTokenFailureOrSuccessOption !=
              current.eZPointTokenFailureOrSuccessOption,
          listener: (context, state) {
            state.eZPointTokenFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          builder: (context, state) {
            if (state.isFetching) {
              return LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              );
            }

            if (state.ezPointToken.isNotEmpty) {
              return Stack(
                key: WidgetKeys.ezPointWebviewPage,
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri(
                        '${locator<Config>().getEZPointIframe}?token=${state.ezPointToken.ezPointToken}',
                      ),
                    ),
                    pullToRefreshController: pullToRefreshController,
                    onLoadStart: (controller, url) {
                      if (mounted) {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                    onLoadStop: (controller, url) {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                  if (isLoading)
                    LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    ),
                ],
              );
            }

            return RefreshIndicator(
              color: ZPColors.primary,
              onRefresh: () async => context.read<EZPointBloc>().add(
                    EZPointEvent.fetch(
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                    ),
                  ),
              child: SingleChildScrollView(
                key: WidgetKeys.ezPointErrorPage,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
