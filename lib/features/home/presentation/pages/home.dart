import 'dart:ui';

import 'package:eshop/features/home/presentation/components/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
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
      body: GridView.builder(
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
          return const HomeItem();
        },
      ),
    );
  }
}