import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/resources/firebase_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationBloc {

  Services services = Services();


  BuildContext context;

  RegistrationBloc(this.context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  textFieldCheck()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      services.createUser(context, email.text, password.text);
      pref.setString("email", email.text);

    }
    else{
      services.errorBox(context, "Field must not empty !");


    }

    email.clear();
    password.clear();

  }

  goToLoginScreen() {
    Navigator.pop(context);
  }

}
