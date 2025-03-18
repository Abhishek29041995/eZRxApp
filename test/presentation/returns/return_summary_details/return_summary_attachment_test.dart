import 'package:ezrxmobile/config.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

void main() {
  late PoAttachmentBloc poAttachmentBlocMock;
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
  });
}
