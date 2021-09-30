import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatBloc {

  TextEditingController msg = TextEditingController();

//  BuildContext context;


 // ChatBloc(this.context);

  Service service = Service();
  var loginUser = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  final storeMsg = FirebaseFirestore.instance;

  currentuser() {
    final user = auth.currentUser;
    if (user != null) {
      loginUser = user;
    }
  }

  sendButton() {
    if (msg.text.isNotEmpty) {
      storeMsg
          .collection("Messages")
          .doc()
          .set({
          "msg": msg.text.trim(), ""
          "user": loginUser!.email.toString(),
          "time":DateTime.now()
          });


      msg.clear();
    }
  }



























}



