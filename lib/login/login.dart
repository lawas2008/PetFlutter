import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet/home.dart';
import 'package:pet/login/register.dart';
import 'package:pet/model/user.dart';
import 'package:pet/utils/api.dart';
import 'package:pet/utils/dialog.dart';
import 'package:pet/utils/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

//登录页
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名输入框变化
    _userNameController.addListener(() {
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    //logo区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      //设置为圆形
      child: ClipOval(
        child: Image.asset(
          "images/icon_login_pet.png",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "账号",
                  hintText: "请输入手机号",
                  prefixIcon: Icon(Icons.person),
                  //在尾部添加清除按钮
                  suffixIcon: (_isShowClear)
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            //清空输入框内容
                            _userNameController.clear();
                          },
                        )
                      : null),
              //验证用户名
              validator: validateUserName,
              onSaved: (String value) {
                _username = value;
              },
            ),
            new TextFormField(
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  //是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )),
              obscureText: !_isShowPwd,
              //密码验证
              validator: validatePassWord,
              //保存数据
              onSaved: (String value) {
                _password = value;
              },
            )
          ],
        ),
      ),
    );

    //登录按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 45,
      child: new RaisedButton(
        color: Colors.green[300],
        child: Text(
          "登录",
          style: new TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          if (_formKey.currentState.validate()) {
            //只有通过输入验证，才会执行这里
            _formKey.currentState.save();
            //登录操作
            _loginHttp(_username, _password);
          }
        },
      ),
    );

    //第三方登录区域
    Widget thirdLoginArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 80,
                height: 1,
                color: Colors.grey,
              ),
              Text("第三方登录"),
              Container(
                width: 80,
                height: 1,
                color: Colors.grey,
              )
            ],
          ),
          new SizedBox(
            height: 18,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                color: Colors.green[300],
                //第三方库icon图标
                icon: Icon(FontAwesomeIcons.qq),
                iconSize: 40,
                onPressed: () {
                  //qq登录事件
                },
              ),
            ],
          )
        ],
      ),
    );

    //忘记密码，立即注册事件
    Widget bottomArea = new Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "忘记密码?",
              style: TextStyle(color: Colors.green[300], fontSize: 16),
            ),
            onPressed: () {
              //忘记密码事件
            },
          ),
          FlatButton(
            child: Text(
              "立即注册",
              style: TextStyle(color: Colors.green[300], fontSize: 16),
            ),
            onPressed: () {
              //立即注册事件
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Register()));
            },
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      //外层增加一个是手势，用于点击空白部分回收键盘
      body: new GestureDetector(
        onTap: () {
          //点击空白区域回收键盘
          _focusNodeUserName.unfocus();
          _focusNodePassWord.unfocus();
        },
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            logoImageArea,
            new SizedBox(
              height: ScreenUtil().setHeight(70),
            ),
            inputTextArea,
            new SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            loginButtonArea,
            new SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            thirdLoginArea,
            new SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            bottomArea,
          ],
        ),
      ),
    );
  }

  ///监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
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

  ///登录请求
  void _loginHttp(String account, String pwd) async {
    Map<String, String> map = new Map();
    map["phone"] = account;
    map["password"] = pwd;
    HttpController.post(
        Api.API_LOGIN,
        (data) {
          if (data != null) {
            Map<String, dynamic> map = json.decode(data)['data'];
            if (map != null) {
              User user = User.fromJson(map);
              if (user != null) {
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => new Home()), (Route<dynamic> rout) => false);
                //本地保存用户值
                saveUser(data);
              }
            } else {
              DialogUtils.showToast("账号或密码错误", context, duration: Toast.LENGTH_LONG);
            }
          }
        },
        params: map,
        errorCallback: (errorBack) {
          DialogUtils.showToast("服务器异常", context);
        });
  }

  //本地保存用户值
  void saveUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user);
  }
}
