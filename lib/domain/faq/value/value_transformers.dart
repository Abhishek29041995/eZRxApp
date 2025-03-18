import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

bool isCategoryAll(String displayName) =>
    isEqualsIgnoreCase(displayName, 'All');
