import 'package:flutter/material.dart';
import '../utils/utils.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './user_info.dart';
class climatica extends StatefulWidget {
  @override
  _climaticaState createState() => _climaticaState();
}

class _climaticaState extends State<climatica> {
  final TextEditingController _user_controller= new TextEditingController();
  final TextEditingController _password_controller= new TextEditingController();
  TextStyle app_style() {
    return new TextStyle(
      color: Colors.white70,
      fontSize: 22.0,
      fontStyle: FontStyle.italic
    );
  }

  void showData() async {
    Map data =await get_userInfo(_user_controller.text,_password_controller.text);
    print(data.toString());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => User_details(username:data.toString()),
      ),
    );

  }

  Future<Map> get_userInfo(String username,String password) async{
    var req =
    {"app_uname": "${username}","app_pass" :"${password}"
    };
    String jsonString = jsonEncode(req);
    String formBody = "reqData" + '=' +jsonString;
    print(formBody);
    http.Response  response1 = await http.post(Uri.encodeFull("http://13.127.224.255:8080/ebiz-web/app/m/login"),
        headers: util.header,
        body:formBody

    );
    return json.decode(response1.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("WhiteCoats Login",style: TextStyle(color: Colors.white70),),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
              icon:Icon(Icons.list),
              onPressed: showData
          )
        ],
      ),
      body:  new Container(
        height: 200.0,
        width: 400.0,
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _user_controller,
              decoration: new InputDecoration(
                  hintText: "username",
                  icon: new Icon(Icons.person)
              ),
            ),
            new TextField(
              controller: _password_controller,
              decoration: new InputDecoration(
                  hintText: "password",
                  icon: new Icon(Icons.lock)
              ),
              obscureText: true,
            ),
            new Padding(padding: new EdgeInsets.all(10.5)),
            new Center(
              child: new Row(
                children: <Widget>[
                  new Container(
                     margin: const EdgeInsets.all(10.0),
                     child: new RaisedButton(onPressed:showData,
                         color: Colors.pinkAccent,
                        child: new Text("Login",style: new TextStyle(color: Colors.white))),
                  )

                ],
              ),

            )
          ],

        ),

      )
    );
  }
}
