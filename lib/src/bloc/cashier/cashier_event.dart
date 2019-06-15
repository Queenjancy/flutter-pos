import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pos/src/models/product.dart';

abstract class CashierEvent extends Equatable {
  CashierEvent([List props = const []]) : super(props);
}

class LoadProducts extends CashierEvent {
  @override
  String toString() {
    return "LoadProducts";
  }
}

class AddProduct extends CashierEvent {
  final Product product;

  AddProduct({@required this.product})
      : assert(product != null),
        super([product]);

  @override
  String toString() {
    return "AddProduct";
  }
}

class IncrementQty extends CashierEvent {
  final Product product;

  IncrementQty({@required this.product});

  @override
  String toString() {
    return "IncrementQty";
  }
}

class DecrementQty extends CashierEvent {
  final Product product;

  DecrementQty({@required this.product});

  @override
  String toString() {
    return "DecrementQty";
  }
}

class UpdateQty extends CashierEvent {
  final Product product;
  final int newQty;

  UpdateQty({@required this.product, @required this.newQty});

  @override
  String toString() {
    return "UpdateQty";
  }
}

class Checkout extends CashierEvent {
  @override
  String toString() {
    return "Checkout";
  }
}

class PrintReceipt extends CashierEvent {
  @override
  String toString() {
    return "PrintReceipt";
  }
}

class PostponeTransaction extends CashierEvent {
  @override
  String toString() {
    return "PostponeTransaction";
  }
}

class CancelTransaction extends CashierEvent {
  @override
  String toString() {
    return "CancelTransaction";
  }
}


