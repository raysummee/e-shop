import 'package:eshop/core/observer/custom_bloc_observer.dart';
import 'package:eshop/core/routes/routes.dart';
import 'package:eshop/core/themes/default_theme.dart';
import 'package:eshop/features/authentication/data/repository/authentication_repository.dart';
import 'package:eshop/features/authentication/domain/repository/authentication_repository.dart';
import 'package:eshop/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepositoryImpl(),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(context.read<AuthenticationRepositoryImpl>()),
        child: MaterialApp(
          title: 'E-Shop',
          theme: DefaultTheme.buildTheme(Brightness.light),//added bightness params for future dark mode
          onGenerateRoute: Routes.onGenerateRoute,
        ),
      ),
    );
  }
}