import 'package:flutter/material.dart';

import 'email_enter_screen/email_enter_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailEnterScreen(),
    );
  }
}
