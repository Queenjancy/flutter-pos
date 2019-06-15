import 'package:flutter/material.dart';
import 'package:pos/src/ui/builder/space_builder.dart';
import 'package:pos/src/utils/formatter/currency.dart';

class CheckoutWidget extends StatefulWidget {
  final int totalPrice;
  final Function onCancelPressed;

  CheckoutWidget(this.totalPrice, {this.onCancelPressed});

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  FocusScopeNode _focusScopeNode = FocusScopeNode();
  TextEditingController _totalPriceController = TextEditingController();

  @override
  void initState() {
    _totalPriceController.text = toRupiah(widget.totalPrice, withRp: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).setFirstFocus(_focusScopeNode);

    return Material(
      elevation: 5.0,
      color: Colors.transparent,
      child: FocusScope(
        node: _focusScopeNode,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.5),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Dibayar Sejumlah',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
              SpaceBuilder.verticalSpaceSmall(),
              _buildTotalTextField(),
              SpaceBuilder.verticalSpaceMedium(),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: _buildDiscountSection()),
                    Expanded(child: _buildSubAndTotalText()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: widget.onCancelPressed,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.5)),
                    child: Text(
                      'Batalkan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SpaceBuilder.horizontalSpaceMedium(),
                  FlatButton(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.5)),
                    child: Text(
                      'Selesaikan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubAndTotalText() {
    return Container(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Text(
                  'Subtotal (Sebelum diskon)',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  toRupiah(41750, withRp: false),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
          SpaceBuilder.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Text(
                  'Total Diskon Produk',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  toRupiah(0, withRp: false),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Text(
                  'Total',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  toRupiah(widget.totalPrice, withRp: false),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountSection() {
    return Center(
      child: Text('Diskon Section!'),
    );
  }

  TextField _buildTotalTextField() {
    return TextField(
      controller: _totalPriceController,
      onChanged: (String value) {
        print(value);
      },
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 52.0, fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
        ),
      ),
    );
  }
}
