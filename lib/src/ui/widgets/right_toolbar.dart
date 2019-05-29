import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/src/bloc/cashier/cashier.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/ui/shared/ui_helper.dart';
import 'package:pos/src/ui/widgets/buttons/cancel_button.dart';
import 'package:pos/src/ui/widgets/buttons/checkout_button.dart';
import 'package:pos/src/ui/widgets/buttons/postpone_button.dart';
import 'package:pos/src/ui/widgets/buttons/print_button.dart';
import 'package:pos/src/ui/widgets/products/product_add_button.dart';
import 'package:pos/src/ui/widgets/products/product_table.dart';
import 'package:pos/src/ui/widgets/retailer/retailer_dropdown.dart';
import 'package:pos/src/utils/formatter/currency.dart';

class RightToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Top(),
          Expanded(flex: 1, child: Bottom()),
        ],
      ),
    );
  }
}

class Top extends StatefulWidget {
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  CashierBloc _cashierBloc;

  @override
  void initState() {
    _cashierBloc ??= BlocProvider.of<CashierBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProductAddButton(
                  onPressed: () {
                    _cashierBloc.dispatch(
                      AddProduct(
                        product: Product(
                          id: Random().nextInt(999),
                          name: 'New product',
                          price: 1000,
                        ),
                      ),
                    );
                  },
                ),
                UIHelper.horizontalSpaceSmall(),
                PrintButton(onPressed: () {}),
                UIHelper.horizontalSpaceSmall(),
                PostponeButton(onPressed: () {}),
                UIHelper.horizontalSpaceSmall(),
                CancelButton(onPressed: () {}),
              ],
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          RetailerDropdown(),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Subtotal (Sebelum Diskon)'),
              BlocBuilder(
                bloc: _cashierBloc,
                builder: (BuildContext context, CashierState state) {
                  if (state is CashierIdle) {
                    return Text(toRupiah(state.totalPrice, withRp: false));
                  }

                  return Text('0');
                },
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Total Diskon Product'),
              Text(toRupiah(0, withRp: false)),
            ],
          ),
          Divider(),
          BlocBuilder(
            bloc: _cashierBloc,
            builder: (BuildContext context, CashierState state) {
              if (state is CashierIdle) {
                return CheckoutButton(
                  total: state.totalPrice,
                  onPressed: () {},
                );
              }
              return CheckoutButton(total: 0);
            },
          )
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('SKU')),
              Expanded(flex: 3, child: Text('089512345')),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Name')),
              Expanded(flex: 3, child: Text('Chitato 68G')),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Kategori')),
              Expanded(flex: 3, child: Text('Snack')),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          ProductTable(),
        ],
      ),
    );
  }
}
