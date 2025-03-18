import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:datadog_tracking_http_client/datadog_tracking_http_client.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';

class DatadogService {
  final PackageInfoService packageInfoService;
  final Config config;
  final DeviceStorage deviceStorage;

  DatadogService({
    required this.packageInfoService,
    required this.config,
    required this.deviceStorage,
  });

  late DatadogConfiguration configuration;
  final navigationObserver = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance,
  );

  final logConfiguration = DatadogLoggerConfiguration(
    customConsoleLogFunction: null,
  );

  Future<void> init() async {
    final version = await packageInfoService.getVersion();
    final buildNumber = await packageInfoService.getBuildNumber();
    final appVersion = '$version($buildNumber)';
    final apiUrlWithoutHttps = config
        .baseUrl(
          marketDomain: AppMarket(deviceStorage.currentMarket()).marketDomain,
        )
        .replaceFirst('https://', '');
    configuration = DatadogConfiguration(
      clientToken: config.datadogClientToken,
      env: config.appFlavor.name,
      site: config.datadogSite,
      nativeCrashReportEnabled: true,
      loggingConfiguration: DatadogLoggingConfiguration(),
      rumConfiguration: DatadogRumConfiguration(
        applicationId: config.datadogRumConfiguration,
        traceSampleRate: 100,
      ),
      version: appVersion,
      flavor: config.appFlavor.name,
      firstPartyHostsWithTracingHeaders: {
        apiUrlWithoutHttps: {TracingHeaderType.tracecontext},
        apiUrlWithoutHttps: {TracingHeaderType.datadog},
      },
      service: config.datadogServiceName,
    );
    configuration.enableHttpTracking();
  }

  void setUserInfo(User user) {
    DatadogSdk.instance.setUserInfo(
      id: user.id,
      name: user.username.getOrDefaultValue(''),
      email: user.email.getOrDefaultValue(''),
    );
  }

  void addRumAttribute({required String key, required String value}) {
    DatadogSdk.instance.rum?.addAttribute(key, value);
  }

  DatadogLogger? get logs =>
      DatadogSdk.instance.logs?.createLogger(logConfiguration);
}
