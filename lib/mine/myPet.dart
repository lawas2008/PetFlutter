import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///我的宠物界面
class MyPet extends StatefulWidget {
  @override
  _MyPetState createState() => new _MyPetState();
}

class _MyPetState extends State<MyPet> {
  @override
  Widget build(BuildContext context) {
    //顶部标题
    AppBar appBar = AppBar(
      backgroundColor: Colors.green,
      title: Text(
        "我的宠物",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.add_circle, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );

    //宠物区域
    Widget petArea = new Container(
      height: 120,
      color: Colors.transparent,
    );

    //宠物基本信息区域
    Widget petInfoArea = new Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "基本信息",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: FlatButton(
                    child: Text(
                      "编辑",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    textColor: Colors.green,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "姓名",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "初一",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "性别",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "帅哥",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "年龄",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "6个月",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "描述",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[100], width: 0.5),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "描述asdasdasdaasdasdasdsaaaaaaaaaaa",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ))
        ],
      ),
    );

    //设备基本信息区域
    Widget deviceInfoArea = new Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "设备信息",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: FlatButton(
                    child: Text(
                      "解绑",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    textColor: Colors.green,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "设备名",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "定位器01",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "设备号",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "A12345678912",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "使用时长",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "20个小时",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 45,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "功能描述",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[100], width: 0.5),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "描述asdasdasdaasdasdasdsaaaaaaaaaaa",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ))
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: ListView(
        children: <Widget>[
          petArea,
          petInfoArea,
          deviceInfoArea,
        ],
      ),
    );
  }
}
