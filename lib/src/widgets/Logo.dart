import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo({this.title = 'Messenger'});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 170,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/tag-logo.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(this.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
