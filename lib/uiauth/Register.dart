import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/Home/Load.dart';
import 'package:untitled4/uiauth/login.dart';

import '../authentication/auth.dart';

class Register extends StatefulWidget {
  static String id = "Register";
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

String email = "";
String password = "";
String confirmPass = "";
String error = "";
bool loading = false;

final _formkey = GlobalKey<FormState>();
AuthService _auth = new AuthService();

class _RegisterState extends State<Register> {
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
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                widthFactor: 0.4,
                                heightFactor: 0.3,
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    widget.toggleView();
                                  }),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Create Account",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Please Signup to continue",
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
                                  height: 380,
                                  width: 900,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Input(
                                          obscure: false,
                                          text: "Name",
                                          keyboard: TextInputType.name,
                                          icon: Icon(Icons.person),
                                          value: (val) {},
                                          valid: (val) {
                                            if (val.isEmpty) {
                                              return "Please Enter your name";
                                            } else
                                              return null;
                                          }),
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
                                          confirmPass = val;
                                          if (val.isEmpty) {
                                            return "Please Enter New Password";
                                          } else if (val.length < 8) {
                                            return "Password must be atleast 8 characters long";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      Input(
                                        obscure: true,
                                        text: " Confirm Password",
                                        keyboard: TextInputType.visiblePassword,
                                        icon: Icon(Icons.lock),
                                        value: (val) {},
                                        valid: (val) {
                                          if (val.isEmpty) {
                                            return "Please Re-Enter New Password";
                                          } else if (val.length < 8) {
                                            return "Password must be atleast 8 characters long";
                                          } else if (val != confirmPass) {
                                            return "Password do not match";
                                          } else {
                                            return null;
                                          }
                                        },
                                      )
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
                                            .registerwithEmailandPasword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "Please supply a valid email";
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
                                        Text("Sign up"),
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
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't  have an account? "),
                                  TextButton(
                                      onPressed: () {
                                        widget.toggleView();
                                      },
                                      child: Text("Sign in"))
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

class Input extends StatelessWidget {
  @required
  final bool obscure;
  final String text;
  final Function value;
  final icon, keyboard;
  final Function valid;

  Input(
      {this.obscure,
      this.text,
      this.value,
      this.icon,
      this.valid,
      this.keyboard});

  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      onChanged: value,
      obscureText: obscure,
      keyboardType: keyboard,
      decoration: InputDecoration(
          labelText: text, prefixIcon: icon, border: OutlineInputBorder()),
    );
  }
}
