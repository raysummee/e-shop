import 'package:eshop/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:eshop/features/authentication/presentation/pages/login.dart';
import 'package:eshop/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationSuccess) {
                return const HomePage();
              } else if(state is AuthenticationFailed){
                return const LoginPage();
              } else{
                return const SizedBox();
              }
            },
          )
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
    return null;
  }
}