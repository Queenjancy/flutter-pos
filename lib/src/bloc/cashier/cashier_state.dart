import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pos/src/models/product.dart';

@immutable
abstract class CashierState extends Equatable {
  CashierState([List props = const []]) : super(props);
}

class CashierIdle extends CashierState {
  final List<Product> products;
  final int totalPrice;

  CashierIdle({
    this.products = const <Product>[],
    this.totalPrice = 0,
  })  : assert(products != null),
        assert(totalPrice != null),
        super([products, totalPrice]);

  @override
  String toString() => 'CashierIdle';
}

class CashierLoading extends CashierState {
  @override
  String toString() => 'CashierLoading';
}
