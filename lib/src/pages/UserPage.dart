import 'package:chat_app/src/models/Users.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(false, 'fernand1@gmail.com', 'Fernando 1', '1'),
    User(true, 'fernand2@gmail.com', 'Fernando 2', '2'),
    User(false, 'fernand3@gmail.com', 'Fernando 3', '3'),
    User(false, 'fernand4@gmail.com', 'Fernando 4', '4'),
    User(false, 'fernand5@gmail.com', 'Fernando 5', '5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuarios',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {}),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            //child: Icon(Icons.check_circle, color: Colors.blue,),
            child: Icon(
              Icons.offline_bolt,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onLoadUsers,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
              color: Colors.blue[400],
            ),
            waterDropColor: Colors.blue[400],
          ),
          child: _listViewUsers(users)),
    );
  }

  Widget _listViewUsers(List<User> users) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (_, index) => Divider(),
      itemBuilder: (_, index) => _userListTitle(users[index]),
    );
  }

  Widget _userListTitle(User user) {
    return ListTile(
      title: Text(user.nombre),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(user.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[150],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }


  void _onLoadUsers() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

}

