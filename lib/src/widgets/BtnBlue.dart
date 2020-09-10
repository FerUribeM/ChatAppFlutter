import 'package:flutter/material.dart';

class BtnBlue extends StatelessWidget {

  final Function onPress;
  final String text;

  const BtnBlue({
    @required this.onPress,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: StadiumBorder(),
        onPressed: onPress,
        child: Container(
            width: double.infinity,
            height: 55,
            child: Center(
                child: Text(
              this.text,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ))));
  }
}
