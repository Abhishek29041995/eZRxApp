import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MaterialFrameWrapper extends StatelessWidget {
  final Widget child;
  final bool usingLocalization;
  final bool useMediaQuery;

  const MaterialFrameWrapper({
    super.key,
    required this.child,
    this.usingLocalization = false,
    this.useMediaQuery = true,
  });

  @override
  Widget build(BuildContext context) {
    return usingLocalization
        ? EasyLocalization(
            supportedLocales: const [Locale('en')],
            path: 'assets/langs/langs.csv',
            startLocale: const Locale('en'),
            useFallbackTranslations: true,
            fallbackLocale: const Locale('en'),
            saveLocale: true,
            useOnlyLangCode: true,
            assetLoader: _CustomCsvAssetLoader(),
            child: Sizer(
              builder: (context, orientation, deviceType) => MaterialApp(
                theme: appThemeData[AppTheme.light],
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: useMediaQuery ? _buildHome() : child,
              ),
            ),
          )
        : Sizer(
            builder: (context, orientation, deviceType) => MaterialApp(
              theme: appThemeData[AppTheme.light],
              home: useMediaQuery ? _buildHome() : child,
            ),
          );
  }

  Widget _buildHome() {
    EasyLocalization.logger.enableBuildModes = [];
    return MediaQuery(
      data: const MediaQueryData(size: Size(480, 900)),
      child: child,
    );
  }
}

class _CustomCsvAssetLoader extends AssetLoader {
  _CustomCsvAssetLoader? csvParser;

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    return {};
  }
}
