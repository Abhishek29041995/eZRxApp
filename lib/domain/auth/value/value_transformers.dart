import 'dart:convert';

Map<String, dynamic> getJWTPayload(String token) {
  final splitToken = token.split('.'); // Split the token by '.'
  if (splitToken.length != 3) {
    throw const FormatException('Invalid token');
  }
  try {
    final payloadBase64 = splitToken[1]; // Payload is always the index 1
    // Base64 should be multiple of 4. Normalize the payload before decode it
    final normalizedPayload = base64.normalize(payloadBase64);
    // Decode payload, the result is a String
    final payloadString = utf8.decode(base64.decode(normalizedPayload));
    // Parse the String to a Map<String, dynamic>

    return jsonDecode(payloadString);
  } catch (error) {
    throw const FormatException('Invalid payload');
  }
}

/// Returns token expiration date
DateTime getJWTExpirationDate(String token) {
  if (token.isEmpty) return DateTime.now();
  final decodedToken = getJWTPayload(token);

  return DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['exp'].toInt()),
  );
}

/// Returns token issuing date (iat)
Duration getJWTTime(String token) {
  if (token.isEmpty) return const Duration();
  final decodedToken = getJWTPayload(token);
  final issuedAtDate = DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['iat']),
  );

  return DateTime.now().difference(issuedAtDate);
}

/// Returns remaining time until expiry date.
Duration getJWTRemainingTime(String token) {
  if (token.isEmpty) return const Duration();
  final expirationDate = getJWTExpirationDate(token);

  return expirationDate.difference(DateTime.now());
}

String getJwtUserId(String token) {
  if (token.isEmpty) return '';
  final decodedToken = getJWTPayload(token);

  return decodedToken['id'].toString();
}

/// Tells whether a token is expired.
bool isJWTExpired(String token) {
  if (token.isEmpty) return true;
  final expirationDate = getJWTExpirationDate(token);

  return DateTime.now().isAfter(expirationDate);
}

List<String> getJWTSalesOrg(String token) {
  if (token.isEmpty) return <String>[];
  final payload = getJWTPayload(token);
  final salesOrgs = List<String>.from(payload['salesOrgs']);

  if (salesOrgs.every((element) => element.trim().isEmpty)) {
    return <String>[];
  }

  return salesOrgs;
}

String maskEmail(String email) {
  final parts = email.split('@');
  if (parts.length != 2) return email;
  final username = parts.first;
  final maskedUsername =
      username[0] + '*' * (username.length - 2) + username[username.length - 1];

  return '$maskedUsername@${parts[1]}';
}
