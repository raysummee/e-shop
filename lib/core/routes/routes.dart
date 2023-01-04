import 'package:eshop/features/authentication/presentation/pages/login.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
    }
    return null;
  }
}