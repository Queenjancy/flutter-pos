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
    super.initState();
    _qtyFocus.addListener(() {
      if (_qtyFocus.hasFocus) {
        selectAll();
      }
    });
  }

  @override
  void didUpdateWidget(QtyButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _qtyController.text = widget.qty.toString();
    _qtyController.selection = TextSelection(
      baseOffset: widget.qty.toString().length,
      extentOffset: _qtyController.text.length,
    );
  }

  void selectAll() {
    _qtyController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: widget.qty.toString().length,
    );
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _qtyFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildDecrementButton(),
        SizedBox(
          width: 55.0,
          child: TextField(
            // onTap: selectAll,
            focusNode: _qtyFocus,
            controller: _qtyController,
            onChanged: widget.onChanged,
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
        onPressed: (widget.qty <= 1) ? null : () {
          widget.onDecrement();
          _qtyFocus.unfocus();
        },
        padding: EdgeInsets.all(0.0),
        color: Theme.of(context).primaryColor,
        disabledColor: Colors.grey[300],
        child: Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIncrementButton() {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: FlatButton(
        onPressed: () {
          widget.onIncrement();
          _qtyController.clear();
          _qtyFocus.unfocus();
        },
        padding: EdgeInsets.all(0.0),
        color: Theme.of(context).primaryColor,
        disabledColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
