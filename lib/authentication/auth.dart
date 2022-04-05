import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'uid.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFirebaseUser);
  }

  Future registerwithEmailandPasword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future signinwithEmailandPasword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future siginanon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future Signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
