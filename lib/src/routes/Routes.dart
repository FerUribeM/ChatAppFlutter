import 'package:chat_app/src/pages/ChatPage.dart';
import 'package:chat_app/src/pages/LoadingPage.dart';
import 'package:chat_app/src/pages/LoginPage.dart';
import 'package:chat_app/src/pages/RegisterPage.dart';
import 'package:chat_app/src/pages/UserPage.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UserPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
