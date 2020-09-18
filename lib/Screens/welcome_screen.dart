import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

import 'package:flash_chat/components/rounded_button.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome extends StatefulWidget {
  static const String id = "Welcome";
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // kept the Material to check the perf!
      home: SafeArea(
        child: Scaffold(
          backgroundColor: animation.value,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "logo",
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60,
                      ),
                    ),
                    TypewriterAnimatedTextKit(
                      speed: Duration(seconds: 1),
                      text: ['Flash Chat'],
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart,
                      textStyle:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                color: Colors.lightBlue,
                title: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, Login.id);
                },
              ),
              RoundedButton(
                color: Colors.blue,
                title: "Register",
                onPressed: () {
                  Navigator.pushNamed(context, Registration.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
