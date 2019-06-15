import 'package:flutter/material.dart';

class TableBuilder {
  static TableRow createHeader(List<String> titles) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      children: titles
          .map((title) => TableBuilder.createCell(
                  child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )))
          .toList(),
    );
  }

  static TableCell createCell({
    @required Widget child,
    EdgeInsetsGeometry padding: const EdgeInsets.all(10.0),
  }) {
    return TableCell(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
