import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/features/registration/registration_bloc.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationBloc registrationBloc;

  @override
  void initState() {
    registrationBloc = RegistrationBloc(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: body());
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.cyan),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: registrationBloc.email,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextField(
              obscureText: true,
              controller: registrationBloc.password,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        CupertinoButton(
            color: Colors.cyan,
            child: Text("Sign Up"),
            onPressed: () {
              registrationBloc.textFieldCheck();
            }),
          TextButton(
              onPressed: () {
                registrationBloc.goToLoginScreen();
              },
              child: const Text("I have an account !"))
        ],
      ),
    );
  }
}
