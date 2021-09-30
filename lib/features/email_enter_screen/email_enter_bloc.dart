import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/features/registration/registration_screen.dart';
import 'package:flutter_projects/resources/firebase_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EmailEnterBloc {

  Services services = Services();
  BuildContext context;

  EmailEnterBloc(this.context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  textFieldCheck()async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    if(email.text.isNotEmpty && password.text.isNotEmpty){
      services.loginUser(context, email.text, password.text);
      pref.setString("email", email.text);


    }
    else{
      services.errorBox(context, "Field must not empty !");


    }


    email.clear();
    password.clear();




  }





  goToRegistration() {
    var screen = const RegistrationScreen();
    var route = CupertinoPageRoute(builder: (context) => screen);
    Navigator.of(context).push(route);
  }
}
