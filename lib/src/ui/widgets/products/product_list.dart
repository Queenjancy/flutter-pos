import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/ui/shared/ui_helper.dart';
import 'package:pos/src/ui/widgets/products/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductListHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItem(products[index], index);
            },
          ),
        )
      ],
    );
  }
}

class ProductListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// NOTE: You have to change this width depends on the ProductItem.
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 20.0,
            child: Text(('No').toString(),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
              flex: 6,
              child: Text(
                'Nama',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
              flex: 2,
              child: Text(
                'Harga',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          UIHelper.horizontalSpaceSmall(),
          Container(
            width: 105,
            child: Text(
              'Jumlah',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
              flex: 1,
              child: Text(
                'Unit',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
              flex: 2,
              child: Text(
                'Total',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
