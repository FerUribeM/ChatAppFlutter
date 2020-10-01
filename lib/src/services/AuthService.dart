import 'package:chat_app/src/models/LoginResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:chat_app/src/global/environment.dart';

class AuthServices with ChangeNotifier {
  Usuario usuario;

  bool _progressLogin = false;

  bool get progressLogin => this._progressLogin;

  set progressLogin(bool value) {
    this._progressLogin = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {

    this._progressLogin = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post('${Environment.BASE_URL}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final response = userFromJson(resp.body);
      usuario = response.usuario;
      this._progressLogin = false;
      print(response);
      return true;
    }else{
      return false;
    }
  }
}
