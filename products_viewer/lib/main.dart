import 'package:flutter/material.dart';
import 'package:products_viewer/config/routes/router.dart';
import 'package:products_viewer/config/theme/app_themes.dart';
import 'package:products_viewer/injection_container.dart';

void main() async {
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme(),
      routerConfig: AppRouter.goRouter,
    );
  }
}
