import 'package:pos/src/models/product.dart';

abstract class ApiProvider {
  Future<List<Product>> fetchProducts();
}