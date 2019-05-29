import 'package:pos/src/models/product.dart';

class CashierService {
  int calculateTotalTransaction(List<Product> products) {
    return products.fold(0, (curr, next) => curr + next.total);
  }
}
