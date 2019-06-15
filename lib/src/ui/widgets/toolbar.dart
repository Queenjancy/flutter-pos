import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/src/bloc/cashier/cashier.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/ui/builder/button_builder.dart';
import 'package:pos/src/ui/builder/space_builder.dart';
import 'package:pos/src/ui/widgets/buttons/cancel_button.dart';
import 'package:pos/src/ui/widgets/buttons/postpone_button.dart';
import 'package:pos/src/ui/widgets/buttons/print_button.dart';
import 'package:pos/src/ui/widgets/cashier/checkout_widget.dart';
import 'package:pos/src/ui/widgets/products/product_add_button.dart';
import 'package:pos/src/ui/widgets/products/product_table.dart';
import 'package:pos/src/ui/widgets/retailer/retailer_dropdown.dart';
import 'package:pos/src/utils/formatter/currency.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ToolbarTopSection(),
          Expanded(flex: 1, child: ToolbarBottom()),
        ],
      ),
    );
  }
}

class ToolbarTopSection extends StatefulWidget {
  @override
  _ToolbarTopSectionState createState() => _ToolbarTopSectionState();
}

class _ToolbarTopSectionState extends State<ToolbarTopSection> {
  CashierBloc _cashierBloc;
  // OverlayState _overlayState;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _cashierBloc ??= BlocProvider.of<CashierBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
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
                SpaceBuilder.horizontalSpaceSmall(),
                PrintButton(onPressed: () {}),
                SpaceBuilder.horizontalSpaceSmall(),
                PostponeButton(onPressed: () {}),
                SpaceBuilder.horizontalSpaceSmall(),
                CancelButton(onPressed: () {}),
              ],
            ),
          ),
          SpaceBuilder.verticalSpaceMedium(),
          RetailerDropdown(),
          SpaceBuilder.verticalSpaceMedium(),
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
          SpaceBuilder.verticalSpaceSmall(),
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
                return ButtonBuilder(context).checkoutButton(
                  total: toRupiah(state.totalPrice),
                  onPressed: () {
                    _overlayEntry =
                        _createCheckoutOverlayEntry(state.totalPrice);
                    Overlay.of(context).insert(_overlayEntry);
                  },
                );
              }
              return ButtonBuilder(context).checkoutButton(total: toRupiah(0));
            },
          )
        ],
      ),
    );
  }

  OverlayEntry _createCheckoutOverlayEntry(int totalPrice) {
    // RenderBox renderBox = context.findRenderObject();
    // Size size = renderBox.size;
    // Offset offset = renderBox.localToGlobal(Offset.zero);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return OverlayEntry(
      opaque: false,
      builder: (context) => Positioned(
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            top: screenHeight * 0.1,
            bottom: screenHeight * 0.1,
            child: CheckoutWidget(
              totalPrice,
              onCancelPressed: () {
                _overlayEntry?.remove();
              },
            ),
          ),
    );
  }
}

class ToolbarBottom extends StatelessWidget {
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
          SpaceBuilder.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Name')),
              Expanded(flex: 3, child: Text('Chitato 68G')),
            ],
          ),
          SpaceBuilder.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Kategori')),
              Expanded(flex: 3, child: Text('Snack')),
            ],
          ),
          SpaceBuilder.verticalSpaceMedium(),
          ProductTable(),
        ],
      ),
    );
  }
}
