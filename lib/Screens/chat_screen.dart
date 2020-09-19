import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat extends StatefulWidget {
  static const String id = "Chat";
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _auth = FirebaseAuth.instance;
  var user;
  void getCurrentUser() {
    try {
      user = _auth.currentUser.email;

      print("**************");
      print("User $user");
    } catch (e) {
      print("Exception $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text("user $user"),
      ),
    );
  }
}
