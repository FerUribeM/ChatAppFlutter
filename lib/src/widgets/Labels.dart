import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String title;
  final String message;

  const Labels(
      {@required this.route, @required this.title, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, route);
              },
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
