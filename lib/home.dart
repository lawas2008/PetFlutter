import 'package:flutter/material.dart';
import 'package:pet/chat/chat.dart';
import 'package:pet/location/location.dart';
import 'package:pet/mine/mine.dart';
import 'package:pet/publish/publish.dart';
import 'package:pet/shop/shop.dart';

///主页面 包含五个子页面
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new HomeStateful(),
    );
  }
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeStateful> {
  int _currentIndex = 0;
  List<Widget> pages = new List();

  @override
  void initState() {
    pages
      ..add(Location())
      ..add(Chat())
      ..add(Publish())
      ..add(Shop())
      ..add(Mine());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green[300],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
              ),
              title: Text(
                "定位",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              title: Text(
                "宠圈",
              )),
          BottomNavigationBarItem(
              title: Text("发布"),
              icon: Icon(
                Icons.add_box,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text(
                "商城",
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              title: Text(
                "我的",
              )),
        ],
      ),
    );
  }
}
