import 'package:flutter/material.dart';

class PostponeButton extends StatelessWidget {
  final Function onPressed;

  PostponeButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      child: Text(
        'Tunda',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
