
import 'package:flutter/services.dart';

const platform = MethodChannel('com.shamma.sample/app');

Future<String> encrypt(String data, String key, String iv) async {
  return await platform.invokeMethod('encrypt', {
    'input': data,
    'key': key,
    'iv': iv,
  });
}

Future<String> decrypt(String data, String key, String iv) async {
  return await platform.invokeMethod('decrypt', {
    'input': data,
    'key': key,
    'iv': iv,
  });
}
