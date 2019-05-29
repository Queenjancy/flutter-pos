import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pos/locator.dart';
import 'package:pos/src/app.dart';
import 'package:pos/src/bloc/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupLocator();
  runApp(App());
}
