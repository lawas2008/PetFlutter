import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet/home.dart';
import 'package:pet/login/login.dart';
import 'package:pet/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

//启动闪屏页
class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {
  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              child: new Image.asset("images/img_start.jpg", fit: BoxFit.fill),
            ),
            new Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.fromLTRB(0, 45, 10, 0),
              child: OutlineButton(
                child: new Text(
                  "跳过",
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.white),
                ),
                shape: new StadiumBorder(),
                onPressed: () {
                  goHomePage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  //倒计时3秒后跳转到主页
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, goHomePage);
  }

  //跳转到主页
  void goHomePage() {
    if (!isStartHomePage) {
      getUser().then((value) {
        if (!value) {
          //本地存储有用户值则直接跳转到首页
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => new Home()), (Route<dynamic> rout) => false);
        } else {
          //本地没有存储用户则跳转到登陆界面
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => new Login()), (Route<dynamic> rout) => false);
        }
      });
      isStartHomePage = true;
    }
  }

  //获取本地用户免登陆操作
  Future<bool> getUser() async {
    User user;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userStr = prefs.getString("user");
    if (userStr!=null && userStr.isNotEmpty) {
      Map<String, dynamic> map = json.decode(userStr)['data'];
      user = User.fromJson(map);
    }
    return user == null;
  }
}
