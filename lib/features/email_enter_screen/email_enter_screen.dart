import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'email_enter_bloc.dart';

class EmailEnterScreen extends StatefulWidget {
  const EmailEnterScreen({Key? key}) : super(key: key);

  @override
  _EmailEnterScreenState createState() => _EmailEnterScreenState();
}

class _EmailEnterScreenState extends State<EmailEnterScreen> {
  late EmailEnterBloc emailEnterBloc;

  @override
  void initState() {
    emailEnterBloc = EmailEnterBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.greenAccent),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: emailEnterBloc.email,
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
              controller: emailEnterBloc.password,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          CupertinoButton(
            color: Colors.greenAccent,
              child: Text("Login"),
              onPressed: () {
                emailEnterBloc.textFieldCheck();
              }),
          TextButton(
              onPressed: () {
                emailEnterBloc.goToRegistration();
              },
              child: const Text("I don't have any account ?"))
        ],
      ),
    );
  }
}
