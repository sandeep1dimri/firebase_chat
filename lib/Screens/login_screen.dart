import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

class Login extends StatefulWidget {
  static const String id = "Login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    onChanged: (value) {},
                    decoration:
                        kInputDecor.copyWith(hintText: "Enter your email"),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    onChanged: (value) {},
                    decoration:
                        kInputDecor.copyWith(hintText: "Enter your password"),
                  ),
                ),
                SizedBox(height: 20),
                RoundedButton(
                  color: Colors.blue,
                  title: "Login",
                  onPressed: () {},
                ),
              ]),
        ));
  }
}
