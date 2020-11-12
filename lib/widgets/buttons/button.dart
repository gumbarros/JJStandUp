import 'package:flutter/material.dart';

class StandUpButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  StandUpButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Theme.of(context).primaryColor)),
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      elevation: 5,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
