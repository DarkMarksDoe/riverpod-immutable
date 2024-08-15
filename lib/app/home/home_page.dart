import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_inmutable/app/detail/detail_controller.dart';
import 'package:riverpod_inmutable/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => context.replaceNamed(
                  AppRoutes.detail,
                  extra: DetailEntity(1, 'My First Class', [
                    DetailTab(id: 1, name: 'First Tab'),
                    DetailTab(id: 2, name: 'Second Tab'),
                  ]),
                ),
                child: const Text('Go to Detail Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
