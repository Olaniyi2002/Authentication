import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/Home.dart';
import 'package:untitled4/authentication/uid.dart';
import 'package:untitled4/uiauth/Register.dart';
import 'package:untitled4/uiauth/login.dart';
import 'package:untitled4/uiauth/switch.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);
  static String id="wrapper";
  @override
  _WrapperState createState() => _WrapperState();
}


class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<User>(context);
    if (result == null) {
     return Switchin();
    } else {
      return Home();
    }
  }
}
