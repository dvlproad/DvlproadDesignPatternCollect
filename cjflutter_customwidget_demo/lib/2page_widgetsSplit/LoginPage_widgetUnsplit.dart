import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class MyLoginBasePage2 extends StatefulWidget {
  MyLoginBasePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginBasePage2> {
  bool userNameValid = false;
  bool passwordValid = false;
  bool loginValid = false;
  bool passwordClearValid = false;
  bool shouldAutofocusUserNameTextField = false;
  String userName = "";
  String password = "";

  //定义一个controller
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FocusNode usernameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode currentFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Login Page initState");

  }

  /// 登录按钮的点击事件
  _login() async {

  }

  /// 忘记密码的点击事件
  _goForgetPasswordViewController() {

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    //print("screenHeight = " + screenHeight.toString());
    double loginIconTop = screenHeight <= 667 ? 80 : 106;
    double loginIconBottom = screenHeight <= 667 ? 50 : 71;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: loginIconTop),
                      child: Image(
                          image:
                              AssetImage("assets/images/login/login_icon.png"),
                          width: 113.0,
                          height: 113.0),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: loginIconBottom, left: 25, right: 25),
                  child: TextField(
                      autofocus: shouldAutofocusUserNameTextField,
                      style: TextStyle(color: Colors.black, fontSize: 17.0),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        //labelText: "用户名",
                        hintText: "用户名",
                        //prefixIcon: Icon(Icons.person),
                        prefixIcon: new Image.asset(
                          userNameValid
                              ? 'lib/Resources/login/login_username_blue.png'
                              : 'lib/Resources/login/login_username_gray.png',
                          width: 14.0,
                          height: 15.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color(0xffd2d2d2), width: 0.6),
                            borderRadius: new BorderRadius.circular(6.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color(0xffd2d2d2), width: 0.6),
                            borderRadius: new BorderRadius.circular(6.0)),
                      ),
                      keyboardType: TextInputType.text,
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      focusNode: usernameFocusNode,
                      //usernameFocusNode
                      onSubmitted: (text) {
                        print("current userName:" + text);
                        if (null == currentFocusNode) {
                          currentFocusNode = FocusScope.of(context);
                        }
                        currentFocusNode.requestFocus(passwordFocusNode);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: TextField(
                      controller: _passwordController,
                      //监听文本变化方式②设置controller并实现监听
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        //labelText: "密码",
                        hintText: "密码",
                        //prefixIcon: Icon(Icons.lock),
                        prefixIcon: new Image.asset(
                          passwordValid
                              ? 'lib/Resources/login/login_password_blue.png'
                              : 'lib/Resources/login/login_password_gray.png',
                          width: 14.0,
                          height: 15.0,
                        ),
                        suffixIcon: !passwordClearValid
                            ? null
                            : IconButton(
                                icon: new Icon(Icons.clear,
                                    color: Colors.black45),
                                onPressed: _passwordController.clear),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color(0xffd2d2d2), width: 0.6),
                            borderRadius: new BorderRadius.circular(6.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color(0xffd2d2d2), width: 0.6),
                            borderRadius: new BorderRadius.circular(6.0)),
                      ),
                      obscureText: true,
                      //是否隐藏正在编辑的文本
                      textInputAction: TextInputAction.done,
                      focusNode: passwordFocusNode,
                      onSubmitted: (text) {
                        print("current password:" + text);
                        passwordFocusNode.unfocus();
                        if (loginValid) {
                          _login();
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 25),
                      child: FlatButton(
                        child: Text("忘记密码?"),
                        textColor: Color(0xfff5b63c),
                        onPressed: () {
                          _goForgetPasswordViewController();
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          child: Text("登录"),
                          splashColor: Colors.transparent,
                          color: Color(0xff01adfe),
                          textColor: Colors.white,
                          highlightColor: Color(0xff1393d7),
                          disabledColor: Color(0xffd3d3d5),
                          disabledTextColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          //onPressed: enable ? enableOnPressed : null,
                          onPressed: loginValid
                              ? () {
                                  _login();
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
