/*
Reference
Firebase authentication : https://firebase.flutter.dev/docs/auth/usage/#registration

 */
import 'package:flash_chat/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  static const String id = "Registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  static const String id = "Registration";
  String userEmail;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: true,
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
                    enableSuggestions: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      userEmail = value;
                    },
                    decoration:
                        kInputDecor.copyWith(hintText: 'Enter your email'),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    enableSuggestions: false,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kInputDecor.copyWith(hintText: 'Enter your password'),
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  color: Colors.blue,
                  title: "Register",
                  onPressed: () async {
                    //print(this.password);
                    //print(this.userEmail);
                    try {
                      final validUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: userEmail.trim(), password: password);
                      if (validUser != null) {
                        Navigator.pushNamed(context, Chat.id);
                      }
                    } catch (e) {
                      print("Exception ----->$e");
                    }
                  },
                ),
              ]),
        ));
  }
}
