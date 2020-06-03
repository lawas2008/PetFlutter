
import 'package:flutter/material.dart';

class Publish extends StatefulWidget{
  @override
  _PublishState createState()=>new _PublishState();
}

class _PublishState extends State<Publish>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发布'),
      ),
      body: new Center(
        child: Icon(Icons.business,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}