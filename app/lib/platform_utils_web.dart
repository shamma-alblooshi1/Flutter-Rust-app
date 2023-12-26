import 'dart:js' as js;

Future<String> encrypt(String data, String key, String iv) async {
  return js.context.callMethod('encrypt', [data, key, iv]) as String;
}

Future<String> decrypt(String data, String key, String iv) async {
  return js.context.callMethod('decrypt', [data, key, iv]) as String;
}
