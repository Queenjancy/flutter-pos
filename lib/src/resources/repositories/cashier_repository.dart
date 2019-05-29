import 'package:meta/meta.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/resources/provider/api_provider.dart';

class CashierRepository {
  final ApiProvider apiProvider;

  CashierRepository({@required this.apiProvider});

  Future<List<Product>> loadProducts() async {
    return await apiProvider.fetchProducts();
  }
}
