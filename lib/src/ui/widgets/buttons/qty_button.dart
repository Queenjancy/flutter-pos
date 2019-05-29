import 'package:flutter/material.dart';

class QtyButton extends StatefulWidget {
  final int qty;
  final Function onIncrement;
  final Function onDecrement;
  final Function onChanged;

  QtyButton({
    @required this.qty,
    this.onIncrement,
    this.onDecrement,
    this.onChanged,
  });

  @override
  _QtyButtonState createState() => _QtyButtonState();
}

class _QtyButtonState extends State<QtyButton> {
  TextEditingController _qtyController = TextEditingController();
  FocusNode _qtyFocus = FocusNode();

  @override
  void initState() {
    _qtyFocus.addListener(() {
      if (_qtyFocus.hasFocus) {
        selectAll();
      }
    });
    super.initState();
  }

  void selectAll() {
    _qtyController.selection =
        TextSelection(baseOffset: 0, extentOffset: _qtyController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    _qtyController.text = widget.qty.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildDecrementButton(),
        SizedBox(
          width: 55.0,
          child: TextField(
            onChanged: widget.onChanged,
            controller: _qtyController,
            focusNode: _qtyFocus,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: widget.qty.toString(),
              border: InputBorder.none,
            ),
          ),
        ),
        _buildIncrementButton(),
      ],
    );
  }

  Widget _buildDecrementButton() {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        color: Theme.of(context).primaryColor,
        child: Icon(
          Icons.remove,
          color: Colors.white,
        ),
        onPressed: widget.onDecrement,
      ),
    );
  }

  Widget _buildIncrementButton() {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: FlatButton(
        onPressed: widget.onIncrement,
        padding: EdgeInsets.all(0.0),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
