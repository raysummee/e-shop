import 'dart:ui';

import 'package:eshop/features/home/data/repository/product_repository.dart';
import 'package:eshop/features/home/domain/repository/product_repository.dart';
import 'package:eshop/features/home/presentation/bloc/product/product_cubit.dart';
import 'package:eshop/features/home/presentation/components/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepositoryImpl(),
      child: BlocProvider(
        create: (context) => ProductCubit(context.read<ProductRepositoryImpl>())
          ..getAllProducts(),
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text(
          "e-Shop",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is! ProductLoaded){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          return GridView.builder(
            itemCount: state.products.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 22
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 13,
              childAspectRatio: 0.7
            ), 
            itemBuilder: (context, index) {
              return HomeItem(product: state.products[index],);
            },
          );
        },
      ),
    );
  }
}