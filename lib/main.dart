import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/wrapper.dart';
import 'package:untitled4/uiauth/Register.dart';
import 'package:untitled4/authentication/auth.dart';
import 'package:untitled4/uiauth/login.dart';


import 'Home/Home.dart';
import 'authentication/uid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Auth App',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Wrapper.id,
        routes: {
          Wrapper.id:(context)=>Wrapper(),
          Home.id:(context)=>Home(),
          Login.id: (context)=>Login(),
          Register.id: (context)=>Register(),
        },
      ),
    );
  }
}
