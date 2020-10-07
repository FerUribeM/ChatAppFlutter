import 'package:chat_app/src/helpers/utils_alerts.dart';
import 'package:chat_app/src/services/AuthService.dart';
import 'package:chat_app/src/widgets/BtnBlue.dart';
import 'package:chat_app/src/widgets/CustomTextField.dart';
import 'package:chat_app/src/widgets/Labels.dart';
import 'package:chat_app/src/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(title: 'Messenger',),
                  _Form(),
                  Labels(route: 'register',title: '¿No tienes cuenta?',message: 'Crea una ahora!'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Terminos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(
            icon: Icon(Icons.mail_outline),
            hintText: 'Email',
            textType: TextInputType.emailAddress,
            controller: userCtrl,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            icon: Icon(Icons.lock_outline),
            hintText: 'Password',
            isPassword: true,
            controller: passCtrl,
          ),
          SizedBox(
            height: 20,
          ),
          BtnBlue(
            text: 'Ingresar',
            onPress: !authService.progressLogin ? () async {

              FocusScope.of(context).unfocus();

              final loginResult = await authService.login(userCtrl.text.trim(), passCtrl.text.trim());

              if(loginResult){
                authService.progressLogin = false;
                Navigator.pushReplacementNamed(context, 'users');
              }else{
                showAlert(context, "Login incorrecto", "Usuario o contraseña incorrecta");
                authService.progressLogin = false;
              }
            } : null,
          )
        ],
      ),
    );
  }
}
