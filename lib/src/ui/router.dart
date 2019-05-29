import 'package:flutter/material.dart';
import 'package:pos/src/ui/screens/cashier.dart';
import 'package:pos/src/ui/screens/login.dart';
import 'package:pos/src/ui/screens/search_product.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CashierScreen());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/search_product':
        return MaterialPageRoute(builder: (_) => SearchProductScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => CashierScreen());
    }
  }
}
