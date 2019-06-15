import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/src/bloc/cashier/cashier.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/ui/builder/space_builder.dart';
import 'package:pos/src/ui/widgets/buttons/qty_button.dart';
import 'package:pos/src/utils/formatter/currency.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final int index;

  ProductItem(this.product, this.index);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  CashierBloc _cashierBloc;

  @override
  Widget build(BuildContext context) {
    _cashierBloc ??= BlocProvider.of<CashierBloc>(context);

    return Dismissible(
      key: Key('__PRODUCT_ITEM_${widget.product.id}__'),
      direction: DismissDirection.horizontal,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.red,
        child: Icon(
          Icons.remove_circle,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 20.0,
                    child: Text((widget.index + 1).toString()),
                  ),
                  SpaceBuilder.horizontalSpaceSmall(),
                  Expanded(
                      flex: 6,
                      child: Text(
                        widget.product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                  SpaceBuilder.horizontalSpaceSmall(),
                  Expanded(
                      flex: 2,
                      child: Text(
                        toRupiah(widget.product.price, withRp: false),
                        textAlign: TextAlign.end,
                      )),
                  SpaceBuilder.horizontalSpaceSmall(),
                  QtyButton(
                    qty: widget.product.qty,
                    onIncrement: () {
                      _cashierBloc
                          .dispatch(IncrementQty(product: widget.product));
                    },
                    onDecrement: () {
                      _cashierBloc
                          .dispatch(DecrementQty(product: widget.product));
                    },
                    onChanged: (String value) {
                      _cashierBloc.dispatch(
                        UpdateQty(
                          product: widget.product,
                          newQty: int.tryParse(value),
                        ),
                      );
                    },
                  ),
                  SpaceBuilder.horizontalSpaceSmall(),
                  Expanded(
                      flex: 1,
                      child: Text(
                        widget.product.unit,
                        textAlign: TextAlign.center,
                      )),
                  SpaceBuilder.horizontalSpaceSmall(),
                  Expanded(
                      flex: 2,
                      child: Text(
                        toRupiah(widget.product.total, withRp: false),
                        textAlign: TextAlign.end,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
