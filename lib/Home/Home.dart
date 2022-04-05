import 'package:flutter/material.dart';
import 'package:untitled4/authentication/auth.dart';
class Home extends StatefulWidget {
  static String id="Home";

  @override
  _HomeState createState() => _HomeState();
}
final AuthService _auth = AuthService();
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: ()async{
          await _auth.Signout();

        },
        child: Text("Logout", style: TextStyle(color: Colors.white),),
      ),),
    );
  }
}
