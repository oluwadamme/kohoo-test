import 'package:flutter/material.dart';
import 'package:kooho_test/utils/routers.dart';
import 'package:kooho_test/utils/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kooho',
      theme: ThemeConfig.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
