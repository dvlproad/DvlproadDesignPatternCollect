import 'package:flutter/material.dart';

/// 文本框(常用于：登录用户名、密码文本框)
/// 方法1:以函数的方法实现
TextField loginTextField(String placeholder, String prefixIconImageName, ValueChanged<String> onSubmitted) {
  return TextField(
    //autofocus: shouldAutofocusUserNameTextField,
    style: TextStyle(color: Colors.black, fontSize: 17.0),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0.0),
      //labelText: "用户名",
      hintText: placeholder,
      //prefixIcon: Icon(Icons.person),
      prefixIcon: new Image.asset(
        prefixIconImageName,
        width: 14.0,
        height: 15.0,
      ),
      //suffixIcon: !showClear ? null : clearButtonWithOnPressed(controller.clear),
      enabledBorder: loginTextFieldDecorationBorder(),
      focusedBorder: loginTextFieldDecorationBorder(),
      ),
      // keyboardType: TextInputType.text,
      // controller: _usernameController,
      // textInputAction: TextInputAction.next,
      // focusNode: usernameFocusNode,
      // onSubmitted: (text) {
      //   print("current userName:" + text);
      //   if (null == currentFocusNode) {
      //     currentFocusNode = FocusScope.of(context);
      //   }
      //   currentFocusNode.requestFocus(passwordFocusNode);
      // }
      onSubmitted: onSubmitted,
  );
}

/// 文本框border
InputBorder loginTextFieldDecorationBorder() {
  return new OutlineInputBorder(
      borderSide: new BorderSide(color: Color(0xffd2d2d2), width: 0.6),
      borderRadius: new BorderRadius.circular(6.0)
  );
}

/// 文本框文本清除按钮
IconButton clearButtonWithOnPressed(VoidCallback onPressed) {
  return new IconButton(
      icon: new Icon(Icons.clear, color: Colors.black45),
      onPressed: onPressed
  );
}
