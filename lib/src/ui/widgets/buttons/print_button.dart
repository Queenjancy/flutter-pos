import 'package:flutter/material.dart';

class PrintButton extends StatelessWidget {
  final Function onPressed;

  PrintButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      child: Icon(Icons.print, color: Colors.white),
    );
  }
}
