
import 'package:flutter/material.dart';

class Shop extends StatefulWidget{
  @override
  _ShopState createState()=>new _ShopState();
}

class _ShopState extends State<Shop>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商城'),
      ),
      body: new Center(
        child: Icon(Icons.business,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}