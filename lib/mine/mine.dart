import 'package:flutter/material.dart';
import 'package:pet/mine/myPet.dart';

///我的主界面
class Mine extends StatefulWidget {
  @override
  _MineState createState() => new _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    //顶部头像区域
    Widget userArea = new Container(
        height: 160,
        color: Colors.grey[100],
        child: new Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            ClipOval(
              child: Image.asset(
                "images/icon_login_pet.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "张三",
              style: new TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ));

    //我的宠物
    Widget petArea = new GestureDetector(
      //自己处理事件，弥补空白处点击事件无效
      behavior: HitTestBehavior.opaque,
      onTap:(){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new MyPet()));
      },
      child: new Container(
        height: 50,
        width: double.infinity,
        child: new Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    ),
                    Icon(
                      Icons.pets,
                      size: 20,
                      color: Colors.green[300],
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    Text(
                      "我的宠物",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "0只",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );

    //定时任务
    Widget alarmArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.alarm,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "定时任务",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0个",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //我的发布
    Widget publishArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.public,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "我的发布",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0个",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //收货地址
    Widget addressArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.location_city,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "收货地址",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0个",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //我的收藏
    Widget favorArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "我的收藏",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "0个",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //我的app生涯
    Widget historyArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.library_books,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "我的轨迹",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //我的成就
    Widget levelArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.archive,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "我的成就",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    //系统设置
    Widget settingArea = new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  ),
                  Icon(
                    Icons.settings,
                    size: 20,
                    color: Colors.green[300],
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  ),
                  Text(
                    "系统设置",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          userArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(0,0, 0, 0),
            height: 0.5,
          ),
          petArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(15,0, 0, 0),
            height: 0.5,
          ),
          alarmArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(15,0, 0, 0),
            height: 0.5,
          ),
          publishArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(15,0, 0, 0),
            height: 0.5,
          ),
          favorArea,
          new Container(
            color: Colors.grey[100],
            margin: EdgeInsets.fromLTRB(0,0, 0, 0),
            height: 15,
          ),
          addressArea,
          new Container(
            color: Colors.grey[100],
            margin: EdgeInsets.fromLTRB(0,0, 0, 0),
            height: 15,
          ),
          historyArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(15,0, 0, 0),
            height: 0.5,
          ),
          levelArea,
          new Container(
            color: Colors.grey[300],
            margin: EdgeInsets.fromLTRB(15,0, 0, 0),
            height: 0.5,
          ),
          settingArea,
        ],
      ),
    );
  }
}
