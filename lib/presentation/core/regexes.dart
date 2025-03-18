class ZPRegexes {
  static RegExp get onlyDecimal => RegExp(r'^\d+\.?\d{0,10}');
  static RegExp get onlyDigits => RegExp('[0-9]');
  static RegExp get leadingZero => RegExp(r'^0+');
  static RegExp get specialCharacters =>
      RegExp(r'[!@#\$%^&*()_+{}\[\]<>?\/\\|=~-]');
  static RegExp get hyperlinkRegExp => RegExp(r'https?://[^\s/$.?#].[^\s]*');
  static RegExp get twoDecimalOnly => RegExp(r'^\d+\.?\d{0,2}');
}
