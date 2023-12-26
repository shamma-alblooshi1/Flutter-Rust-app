import 'platform_utils_non_web.dart'
if (dart.library.html) 'platform_utils_web.dart';

Future<String> platformencryptString(String data, String key, String iv) async {
  return encrypt(data, key, iv);
}

Future<String> platformdecryptString(String data, String key, String iv) async {
  return decrypt(data, key, iv);
}
