import 'package:pos/src/models/product.dart';
import 'package:pos/src/resources/provider/api_provider.dart';

class MockApiProvider implements ApiProvider {
  final Duration delay;
  static const endpoint = '';

  MockApiProvider({this.delay: const Duration(milliseconds: 1500)});

  @override
  Future<List<Product>> fetchProducts() {
    return Future.delayed(
      delay,
      () => [
            Product(
                id: 1,
                name: 'Indomie Goreng',
                price: 1000,
                unit: ProductUnits.pcs),
            Product(
                id: 2,
                name: 'Indomie Goreng',
                price: 3000,
                unit: ProductUnits.ctn),
            Product(
                id: 3,
                name: 'ABC Kopi Susu',
                price: 4500,
                unit: ProductUnits.pcs),
            Product(
                id: 4, name: 'Chitato', price: 4500, unit: ProductUnits.pcs),
            Product(id: 5, name: 'Lays', price: 4500, unit: ProductUnits.pcs),
            Product(
                id: 6,
                name: 'Product dengan nama yang sangat panjang',
                price: 3000,
                unit: ProductUnits.ctn),
          ],
    );
  }
}
