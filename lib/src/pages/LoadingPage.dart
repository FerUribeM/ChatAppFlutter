import 'package:chat_app/src/pages/LoginPage.dart';
import 'package:chat_app/src/pages/UserPage.dart';
import 'package:chat_app/src/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, shap) {
          return Center(
            child: Text('Autenticando...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthServices>(context, listen: false);
    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => UserPage()));
    } else {
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => LoginPage()));
    }
  }
}
