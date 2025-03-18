class EZPointMutation {
  String getTokenQuery() {
    return '''
      query (\$request: EzPointTokenRequest!) {
        getEzPointToken(request: \$request) {
          ezPointToken
        }
      }
    ''';
  }
}
