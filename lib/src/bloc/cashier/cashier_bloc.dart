import 'package:bloc/bloc.dart';
import 'package:pos/locator.dart';
import 'package:pos/src/bloc/cashier/cashier_event.dart';
import 'package:pos/src/bloc/cashier/cashier_state.dart';
import 'package:pos/src/models/product.dart';
import 'package:pos/src/resources/repositories/cashier_repository.dart';
import 'package:pos/src/services/cashier_service.dart';

class CashierBloc extends Bloc<CashierEvent, CashierState> {
  final CashierRepository _cashierRepository = locator<CashierRepository>();
  final CashierService _cashierService = locator<CashierService>();

  @override
  CashierState get initialState => CashierIdle();

  @override
  Stream<CashierState> mapEventToState(CashierEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState(event);
    } else if (event is AddProduct) {
      yield* _mapAddProductToState(event);
    } else if (event is IncrementQty) {
      yield* _mapIncrementQtyToState(event);
    } else if (event is DecrementQty) {
      yield* _mapDecrementQtyToState(event);
    } else if (event is UpdateQty) {
      yield* _mapUpdateQtyToState(event);
    }
  }

  Stream<CashierState> _mapLoadProductsToState(LoadProducts event) async* {
    yield CashierLoading();

    List<Product> products = await _cashierRepository.loadProducts();
    yield CashierIdle(
      products: products,
      totalPrice: _cashierService.calculateTotalTransaction(products),
    );
  }

  Stream<CashierState> _mapAddProductToState(AddProduct event) async* {
    if (currentState is CashierIdle) {
      List<Product> products = List.from((currentState as CashierIdle).products)
        ..add(event.product);
      yield CashierIdle(
        products: products,
        totalPrice: _cashierService.calculateTotalTransaction(products),
      );
    }
  }

  Stream<CashierState> _mapIncrementQtyToState(IncrementQty event) async* {
    if (currentState is CashierIdle) {
      List<Product> products = (currentState as CashierIdle)
          .products
          .map((product) => (product.id == event.product.id)
              ? product.copyWith(qty: product.qty + 1)
              : product)
          .toList();

      yield CashierIdle(
        products: products,
        totalPrice: _cashierService.calculateTotalTransaction(products),
      );
    }
  }

  Stream<CashierState> _mapDecrementQtyToState(DecrementQty event) async* {
    if (currentState is CashierIdle) {
      List<Product> products = (currentState as CashierIdle)
          .products
          .map((product) => (product.id == event.product.id)
              ? product.copyWith(
                  qty: (product.qty > 1) ? product.qty - 1 : product.qty,
                )
              : product)
          .toList();

      yield CashierIdle(
        products: products,
        totalPrice: _cashierService.calculateTotalTransaction(products),
      );
    }
  }

  Stream<CashierState> _mapUpdateQtyToState(UpdateQty event) async* {
    if (currentState is CashierIdle) {
      List<Product> products = (currentState as CashierIdle)
          .products
          .map((product) => (product.id == event.product.id)
              ? product.copyWith(
                  qty: (event.newQty > 0) ? event.newQty : 1,
                )
              : product)
          .toList();

      yield CashierIdle(
        products: products,
        totalPrice: _cashierService.calculateTotalTransaction(products),
      );
    }
  }
}
