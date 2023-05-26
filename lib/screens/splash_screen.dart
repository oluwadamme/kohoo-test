import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kooho_test/utils/assets.dart';
import 'package:kooho_test/utils/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.replaceNamed(AppRoutes.register);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.logo),
      ),
    );
  }
}
