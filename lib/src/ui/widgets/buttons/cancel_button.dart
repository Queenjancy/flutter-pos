import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final Function onPressed;

  CancelButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      child: Text(
        'Batalkan',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
