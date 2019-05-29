import 'package:get_it/get_it.dart';
import 'package:pos/src/resources/provider/api/mock_api.dart';
import 'package:pos/src/resources/repositories/cashier_repository.dart';
import 'package:pos/src/services/cashier_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Repository
  locator.registerLazySingleton(() => CashierRepository(apiProvider: MockApiProvider()));
  
  // Service
  locator.registerLazySingleton(() => CashierService());
}