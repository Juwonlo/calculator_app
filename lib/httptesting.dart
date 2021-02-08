import 'package:flutter/material.dart';
import 'package:calculator_app/common.dart';

class HttpTesting extends StatefulWidget {
  @override
  _HttpTestingState createState() => _HttpTestingState();
}

class _HttpTestingState extends State<HttpTesting> {
  List<Widget> _usersWidgetList = [];
  bool _isUsersWidgetListLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUsers();
  }

  getUsers() async {
    var users =
        await fetch(context, 'https://jsonplaceholder.typicode.com/users');

    if (users != false) {
      setState(() {
        _usersWidgetList = renderUsers(users);
        _isUsersWidgetListLoaded = true;
      });
    }
  }

  List<Widget> renderUsers(List<dynamic> users) {
    List<Widget> widgetList = [];
    users.forEach((user) {
      widgetList.add(Container(
          width: MediaQuery.of(context).copyWith().size.width,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
          child: Text("${user['name']} - ${user['email']}")));
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Column(
          children: _isUsersWidgetListLoaded == true
              ? _usersWidgetList
              : [Center(child: Text('Loading Users...'))]),
    );
  }
}
