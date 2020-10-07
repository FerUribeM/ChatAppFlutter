import 'package:chat_app/src/models/LoginResponse.dart';
import 'package:chat_app/src/models/ResponseError.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:chat_app/src/global/environment.dart';

class AuthServices with ChangeNotifier {
  Usuario usuario;

  bool _progressLogin = false;

  bool get progressLogin => this._progressLogin;

  final _storage = new FlutterSecureStorage();

  set progressLogin(bool value) {
    this._progressLogin = value;
    notifyListeners();
  }

  Future<String> registerUser(
      String name, String email, String password) async {
    try {
      this._progressLogin = true;

      final data = {'name': name, 'email': email, 'password': password};

      final resp = await http.post('${Environment.BASE_URL}/login/new',
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final response = userFromJson(resp.body);
        usuario = response.usuario;
        await _saveToken(response.token);
        return "200";
      } else {
        final response = responseErrorFromJson(resp.body);
        return response.msg;
      }
    } catch (error) {
      this._progressLogin = false;
      return error;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final token = await getToken();

      final resp =
          await http.get('${Environment.BASE_URL}/login/renew', headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      });

      if (resp.statusCode == 200) {
        final response = userFromJson(resp.body);
        usuario = response.usuario;
        await _saveToken(response.token);
        return true;
      } else {
        await deleteToken();
        return false;
      }
    } catch (error) {
      await deleteToken();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      this._progressLogin = true;

      final data = {'email': email, 'password': password};

      final resp = await http.post('${Environment.BASE_URL}/login',
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final response = userFromJson(resp.body);
        usuario = response.usuario;
        await _saveToken(response.token);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Error al conectar al servidor!');
      return false;
    }
  }

  //GET static token
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }
}
