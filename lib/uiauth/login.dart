import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled4/Home/Load.dart';
import 'package:untitled4/uiauth/Register.dart';
import 'package:untitled4/authentication/auth.dart';

class Login extends StatefulWidget {
  static String id = "Login";
  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

bool loading = false;
AuthService _auth = new AuthService();
String email = "";
String password = "";
String error = "";

final _formkey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return loading
        ? Load()
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 750,
                  width: 900,
                  child: SafeArea(
                    child: Container(
                      height: 900,
                      width: 900,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 0.4,
                            heightFactor: 0.3,
                            child: Container(
                              height: 400,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Please sign in to continue",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                              key: _formkey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 900,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Input(
                                        obscure: false,
                                        text: "Email",
                                        keyboard: TextInputType.emailAddress,
                                        icon: Icon(Icons.email),
                                        value: (val) {
                                          setState(() {
                                            email = val;
                                          });
                                        },
                                        valid: (val) {
                                          if (val.isEmpty) {
                                            return "Please an Email";
                                          } else {
                                            bool emailValid = RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val);
                                            if (emailValid == true) {
                                              return null;
                                            } else {
                                              return "Enter a correct email";
                                            }
                                          }
                                        },
                                      ),
                                      Input(
                                        obscure: true,
                                        text: "Password",
                                        keyboard: TextInputType.visiblePassword,
                                        icon: Icon(Icons.lock),
                                        value: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        valid: (val) {
                                          if (val.isEmpty) {
                                            return "Please Enter your Password";
                                          } else if (val.length < 8) {
                                            return "Password must be atleast 8 characters long";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 100.0, right: 100),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formkey.currentState.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth
                                            .signinwithEmailandPasword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "Invalid username or password";
                                            loading = false;
                                          });
                                        }

                                        loading = false;
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Login"),
                                        Icon(Icons.arrow_forward)
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            )),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't  have an account? "),
                                  TextButton(
                                      onPressed: () {
                                        widget.toggleView();
                                      },
                                      child: Text("Sign up"))
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
