import 'package:flash_chat/Screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/chat_screen.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black54))),
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) =>
            Welcome(), //use static cont instead of String , avoid crash by typos
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        Chat.id: (context) => Chat()
      },
    );
  }
}
