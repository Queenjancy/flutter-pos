import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/src/bloc/cashier/cashier_bloc.dart';
import 'package:pos/src/ui/router.dart';
import 'package:pos/src/ui/themes/default_theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Bloc
  CashierBloc _cashierBloc;

  @override
  void initState() {
    _cashierBloc = CashierBloc();
    super.initState();
  }

  @override
  void dispose() {
    _cashierBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<CashierBloc>(bloc: _cashierBloc),
      ],
      child: MaterialApp(
        initialRoute: '/',
        theme: defaultTheme(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
