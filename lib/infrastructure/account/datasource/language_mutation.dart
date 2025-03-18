class LanguageMutation {
  String changeLanguage() {
    return '''
     mutation updateLanguageAndHoliday(\$input: LangAndHoliday!) {
      updateLanguageAndHoliday(input: \$input) {
        success
        message
      }
    }
    ''';
  }
}
