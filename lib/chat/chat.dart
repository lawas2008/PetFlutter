import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('宠物圈子'),
      ),
      body: new Center(
        child: Icon(Icons.business,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}
