import 'package:flutter/material.dart';

class MyButtons {
  static MaterialButton flat({
    @required Widget child,
    Color color,
    Function onPressed,
  }) =>
      FlatButton(
        onPressed: onPressed,
        color: color ?? Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
        child: child,
      );

  static MaterialButton raised({
    @required Widget child,
    Color color,
    Function onPressed,
  }) =>
      RaisedButton(
        onPressed: onPressed,
        color: color ?? Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: child,
      );
}

class ButtonBuilder {
  BuildContext context;

  ButtonBuilder(this.context);

  MaterialButton cancelButton({
    Function onPressed,
  }) =>
      MyButtons.flat(
        onPressed: onPressed,
        color: Colors.red,
        child: Text(
          'Batalkan',
          style: TextStyle(color: Colors.white),
        ),
      );

  MaterialButton checkoutButton({
    @required String total,
    Function onPressed,
  }) =>
      MyButtons.raised(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Selesaikan',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[50],
              ),
            ),
            Text(
              total,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[50],
              ),
            ),
          ],
        ),
      );

  MaterialButton postponeButton({
    Function onPressed,
  }) =>
      MyButtons.flat(
        onPressed: onPressed,
        color: Colors.orange,
        child: Text(
          'Tunda',
          style: TextStyle(color: Colors.white),
        ),
      );
}
