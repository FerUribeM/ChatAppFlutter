import 'dart:io';

import 'package:chat_app/src/widgets/ChatMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textCtrl = new TextEditingController();
  final _focusNode = new FocusNode();

  bool isRead = false;

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            title: Column(
              children: [
                CircleAvatar(
                  maxRadius: 14,
                  child: Text(
                    'ME',
                    style: TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.blue[100],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Melissa Flores',
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                )
              ],
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) => _messages[index],
                    reverse: true,
                  ),
                ),
                Divider(),
                Container(
                  color: Colors.white,
                  child: _inputChat(),
                )
              ],
            ),
          )),
    );
  }

  Widget _inputChat() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textCtrl,
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            onSubmitted: _handleSubmit,
            onChanged: (String text) {
              setState(() {
                if (text.trim().length > 0) {
                  isRead = true;
                } else {
                  isRead = false;
                }
              });
            },
            focusNode: _focusNode,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text('Enviar'),
                    onPressed: isRead
                        ? () => _handleSubmit(_textCtrl.text.trim())
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[300]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: isRead
                            ? () => _handleSubmit(_textCtrl.text.trim())
                            : null,
                        icon: Icon(Icons.send),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  _handleSubmit(String text) {
    if (text.length == 0) return;

    _textCtrl.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text,
      uid: '122',
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);

    newMessage.animationController.forward();

    setState(() {
      isRead = false;
    });
  }

  @override
  void dispose() {
    //OFF SOCKET
    _messages.forEach((element) {
      element.animationController.dispose();
    });
    super.dispose();
  }
}
