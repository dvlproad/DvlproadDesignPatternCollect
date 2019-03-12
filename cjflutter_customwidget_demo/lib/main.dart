import 'package:flutter/material.dart';

/// 2page_widgetsSplit
import '2page_widgetsSplit/LoginPage_widgetUnsplit.dart';
import '2page_widgetsSplit/LoginPage_widgetSplit.dart';

///// 3page_logicDecouple
//import '3page_logicDecouple/LoginPage_logicCouple.dart'
//import '3page_logicDecouple/LoginPage_logicDecouple.dart'


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter NativeFlutter LoginDemo',
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//      ),
      home: MyLoginBasePage(title: 'Flutter NativeFlutter LoginDemo'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        routes: {
          "LoginBasePage": (context) => MyLoginBasePage(title: 'Flutter NativeFlutter LoginDemo'),
        }

    );
  }
}