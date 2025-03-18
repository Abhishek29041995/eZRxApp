import 'package:get_it/get_it.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';

Uri getUri(String url) => Uri.parse(url);

bool validUrl(String url) => ZPRegexes.hyperlinkRegExp.hasMatch(url);

bool internalUri(String url) => url.contains(GetIt.instance<Config>().domain);


String linkType(bool type) => type ? 'internal' : 'external_web';
