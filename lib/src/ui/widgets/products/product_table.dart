import 'package:flutter/material.dart';
import 'package:pos/src/ui/builder/table_builder.dart';
import 'package:pos/src/ui/widgets/buttons/qty_button.dart';

class ProductTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FractionColumnWidth(.20),
        1: FractionColumnWidth(.20),
        2: FractionColumnWidth(.20),
        3: FractionColumnWidth(.40),
      },
      children: <TableRow>[
        TableBuilder.createHeader(['Unit', 'Harga', 'Stock', '']),
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('PCS'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('5000'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('-5'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: QtyButton(qty: 0),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('PCS'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('5000'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('-5'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: QtyButton(qty: 0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
