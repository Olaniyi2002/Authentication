import 'package:flutter/material.dart';
import 'package:untitled4/uiauth/Register.dart';

import 'login.dart';
class Switchin extends StatefulWidget {
  const Switchin({Key key}) : super(key: key);

  @override
  _SwitchinState createState() => _SwitchinState();
}

class _SwitchinState extends State<Switchin> {
  bool isLogin=true;
  void toggle(){
    setState(() {
      isLogin=!isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return Login(toggleView:toggle);
    }else{
      return Register(toggleView:toggle);
    }
  }
}
