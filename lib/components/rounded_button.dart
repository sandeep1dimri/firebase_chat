import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.title, @required this.onPressed});
  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: color,
        splashColor: color,
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
