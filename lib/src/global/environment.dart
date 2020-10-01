import 'dart:io';

class Environment{
  static String BASE_URL = Platform.isAndroid ? "http://192.168.100.3:3003/api" : "http://localhost:3003/api";
  static String BASE_URL_SOCKET = Platform.isAndroid ? "http://192.168.100.3:3003" : "http://localhost:3003";
}