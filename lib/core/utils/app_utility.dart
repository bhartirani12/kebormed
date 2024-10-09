import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class AppUtility {
  String generateRandomKey(int length) {
    final Random random = Random.secure();
    final List<int> values =
        List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  String generateHMACToken(String secret, String data) {
    var key = utf8.encode(secret);
    var bytes = utf8.encode(data);

    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);

    return base64Url.encode(digest.bytes);
  }
}
