import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/features/chat/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/app.dart';


//initialize firebase
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString("email");
  print(email);
  runApp(
     const App());

}