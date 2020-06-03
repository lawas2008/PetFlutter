import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "账号注册",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: new Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: new Form(
          key: _formKey,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "手机号",
                ),
                validator: validateUserName,
              ),
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "验证码",
                      ),
                    ),
                  ),
                  new RaisedButton(
                      color: Colors.transparent,
                      child: Text(
                        "获取验证码",
                        style: new TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {}),
                ],
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "密码",
                ),
                obscureText: true,
              ),
              new SizedBox(
                height: 40,
              ),
              new SizedBox(
                width: double.infinity,
                height: 45,
                child: new RaisedButton(
                    color: Colors.green[300],
                    child: Text(
                      "注册",
                      style: new TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///验证用户名
  String validateUserName(String value) {
    //手机号正则
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return "用户名不能为空";
    } else if (!exp.hasMatch(value)) {
      return "请输入正确的手机号";
    }
    return null;
  }

  ///验证密码
  String validatePassWord(String value) {
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.trim().length < 6 || value.trim().length > 10) {
      return "密码长度不正确";
    }
    return null;
  }
}
