import 'package:flutter/material.dart';

/// 蓝色背景按钮(常用于：登录按钮)
/// 方法2:以继承 StatefulWidget 的方式实现
class BlueButton extends StatefulWidget {
  final String text;
  final bool enable;
  final VoidCallback enableOnPressed;

  BlueButton({
    Key key,
    this.text,
    this.enable,
    this.enableOnPressed,
  }) :super(key:key);

  @override
  _ButtonButtonState createState() => _ButtonButtonState();
}

class _ButtonButtonState extends State<BlueButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(widget.text),
        splashColor: Colors.transparent,
        color: Color(0xff01adfe),
        textColor: Colors.white,
        highlightColor: Color(0xff1393d7),
        disabledColor: Color(0xffd3d3d5),
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        onPressed: widget.enable ?  widget.enableOnPressed : null,
      ),
    );
  }
}