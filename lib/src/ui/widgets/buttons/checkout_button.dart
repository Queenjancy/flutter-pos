import 'package:flutter/material.dart';
import 'package:pos/src/utils/formatter/currency.dart';

class CheckoutButton extends StatelessWidget {
  final int total;
  final Function onPressed;

  CheckoutButton({
    @required this.total,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 15.0),
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
            toRupiah(total),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[50],
            ),
          ),
        ],
      ),
    );
  }
}
