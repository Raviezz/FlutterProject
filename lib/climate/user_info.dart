import 'package:flutter/material.dart';

class User_details extends StatelessWidget {
  final String username;
  User_details({
    Key key,
    @required this.username
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("Welcome")
        ),
        body: new Container(
          child: new Text(this.username),
        ),
      ),
    );
  }
}
