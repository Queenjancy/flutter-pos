import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/src/bloc/cashier/cashier.dart';
import 'package:pos/src/ui/widgets/drawer.dart';
import 'package:pos/src/ui/widgets/products/product_list.dart';
import 'package:pos/src/ui/widgets/search_bar.dart';
import 'package:pos/src/ui/widgets/toolbar.dart';

class CashierScreen extends StatefulWidget {
  @override
  _CashierScreenState createState() => _CashierScreenState();
}

class _CashierScreenState extends State<CashierScreen> {
  CashierBloc _cashierBloc;

  @override
  void initState() {
    _cashierBloc ??= BlocProvider.of<CashierBloc>(context);
    _cashierBloc.dispatch(LoadProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 75.0;

    return Scaffold(
      appBar: AppBar(
        title: ProductSearchBar(),
      ),
      // resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: screenHeight,
          child: Row(
            children: <Widget>[
              Expanded(flex: 6, child: _buildProductList()),
              Expanded(
                flex: 4,
                child: Toolbar(),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder(
      bloc: _cashierBloc,
      builder: (BuildContext context, CashierState state) {
        if (state is CashierLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is CashierIdle) {
          if (state.products.length == 0) {
            return Center(child: Text('Ayo belanja'));
          } else {
            return ProductList(products: state.products);
          }
        }

        return Container();
      },
    );
  }
}
