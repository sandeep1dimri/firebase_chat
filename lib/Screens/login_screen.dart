import 'package:flash_chat/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  static const String id = "Login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        kInputDecor.copyWith(hintText: "Enter your email"),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kInputDecor.copyWith(hintText: "Enter your password"),
                  ),
                ),
                SizedBox(height: 20),
                RoundedButton(
                  color: Colors.blue,
                  title: "Login",
                  onPressed: () async {
                    try {
                      print("user_email $email password $password");
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found')
                        print("User not found");
                      else if (e.code == 'wrong-password')
                        print("wrong-password");
                      else
                        print("Exception: ---> " + e.toString());
                    } catch (e) {
                      print("Exception: final--->::" + e);
                    }
                    Navigator.pushNamed(context, Chat.id);
                  },
                ),
              ]),
        ));
  }
}
