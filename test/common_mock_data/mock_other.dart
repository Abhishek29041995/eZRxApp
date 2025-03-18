import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';

class MixpanelServiceMock extends Mock implements MixpanelService {}

class ClevertapServiceMock extends Mock implements ClevertapService {}

class AutoRouteMock extends Mock implements AppRouter {}

class UniversalLinkServiceMock extends Mock implements DeepLinkingService {}

class ChatBotServiceMock extends Mock implements ChatBotService {}

class ConfigMock extends Mock implements Config {}

class FileMock extends Mock implements File {}

class DeviceStorageMock extends Mock implements DeviceStorage {}

class MaterialPageXMock extends Mock implements AutoRoutePage {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class HTTPServiceMock extends Mock implements HttpService {}
