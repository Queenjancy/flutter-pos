import 'package:flutter/material.dart';

final Color blue1 = Color(0xFF157CFD);
final Color blue2 = Color(0xFF3583FD);
final Color green = Color(0xFF4AB853);
final Color greenAccent = Color(0xFFE4F4E4);
final Color grey = Color(0xFFA0A7BD);
final Color darkBlue = Color(0xFF364051);
final Color backgroundLight = Color(0xFFFAFBFC);
final Color backgroundDark = Color(0xFF2D2D3C);

ThemeData defaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: blue1,
    primaryColor: green,
    buttonColor: green,
    scaffoldBackgroundColor: backgroundLight,
    errorColor: Colors.redAccent,
    iconTheme: _customIconTheme(base.iconTheme),
    textTheme: _customTextTheme(base.textTheme),
    // TODO: Decorate the inputs (103)
  );
}

TextTheme _customTextTheme(TextTheme base) {
  return base.copyWith(
    headline:
        TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: darkBlue),
    title:
        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: darkBlue),
    // subhead:
    //     TextStyle(fontSize: 18.0, color: darkBlue),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: grey);
}
