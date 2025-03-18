import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_frame_wrapper.dart';
import 'multi_bloc_provider_frame_wrapper.dart';

class WidgetUtils {
  static RouteDataScope getScopedWidget({
    required AppRouter autoRouterMock,
    required Widget child,
    final bool useMediaQuery = true,
    final bool usingLocalization = false,
    List<BlocProvider> providers = const <BlocProvider>[],
    String? routeName,
    String path = '',
  }) {
    EasyLocalization.logger.enableLevels = [];
    EasyLocalization.logger.enableBuildModes = [];

    return RouteDataScope(
      routeData: RouteData(
        stackKey: const Key(''),
        type: const RouteType.adaptive(),
        router: autoRouterMock,
        route: RouteMatch(
          segments: const [''],
          config: AutoRoute(
            page: PageInfo(routeName ?? 'MaterialRootRoute'),
            path: path,
          ),
          stringMatch: '',
          key: ValueKey(routeName ?? 'MaterialRootRoute'),
        ),
        pendingChildren: [],
      ),
      child: RouterScope(
        controller: autoRouterMock,
        inheritableObserversBuilder: () => [],
        navigatorObservers: const [],
        stateHash: 0,
        child: StackRouterScope(
          controller: autoRouterMock,
          stateHash: 0,
          child: providers.isNotEmpty
              ? MultiBlocProviderFrameWrapper(
                  useMediaQuery: useMediaQuery,
                  usingLocalization: usingLocalization,
                  providers: providers,
                  child: child,
                )
              : MaterialFrameWrapper(
                  useMediaQuery: useMediaQuery,
                  usingLocalization: usingLocalization,
                  child: child,
                ),
        ),
      ),
    );
  }
}
