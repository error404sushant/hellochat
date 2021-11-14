import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/features/chat/chat_screen.dart';
import 'package:flutter_projects/features/map/map_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  final auth = FirebaseAuth.instance;

  //for signup user
  void createUser(context, email, password) async {
    try {
      //when user create the account then redirect to the chat screen
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MapScreen()))});
    } catch (exception) {
      errorBox(context, exception);
    }
  }

  //for login user

  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const MapScreen()))});
    } catch (exception) {
      errorBox(context, exception);
    }
  }

  //for sign out

  void signOut(context) async {
    auth.signOut().then((value) => {Navigator.pop(context)});

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("email");
  }

  void errorBox(context, exception) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Error"),
              content: Text(exception.toString()),
            ));
  }
}
