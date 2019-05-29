import 'package:flutter/foundation.dart';

class ProductUnits {
  static const pcs = 'PCS';
  static const ctn = 'CTN';
}

class Product {
  final int id;
  final String name;
  final int price;
  final int qty;
  final String unit;
  // final String skuId;
  // final String barcode;
  // final String stock;

  int get total => qty * price;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    this.qty = 1,
    this.unit = ProductUnits.pcs,
  });

  String toString() {
    return '<Product> $name, qty:$qty';
  }

  Product copyWith({
    int id,
    String name,
    int price,
    int qty,
    String unit,
    int total,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      unit: unit ?? this.unit,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      qty: json['qty'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
      'unit': unit,
    };
  }
}
