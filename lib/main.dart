import 'package:eshop/core/routes/routes.dart';
import 'package:eshop/core/themes/default_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Shop',
      theme: DefaultTheme.buildTheme(Brightness.light),//added bightness params for future dark mode
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}