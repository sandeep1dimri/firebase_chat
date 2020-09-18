import 'package:flutter/material.dart';

const kInputDecor = InputDecoration(
    hintText: "Enter the value",
    hintStyle: TextStyle(color: Colors.blueGrey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(32))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(32))));
