import 'package:flutter/material.dart';

class ProductAddButton extends StatelessWidget {
  final Function onPressed;

  ProductAddButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
