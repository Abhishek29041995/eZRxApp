class ContactUsQueryMutation {
  String submitQuery() {
    return '''
      mutation contactUs(\$input: contactUsInput!) {
        contactUs(input: \$input) {
          success
        }
      }
    ''';
  }
}
