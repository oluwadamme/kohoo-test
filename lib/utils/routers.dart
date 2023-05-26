import 'package:go_router/go_router.dart';
import 'package:kooho_test/screens/dashboard.dart';
import 'package:kooho_test/screens/notification.dart';
import 'package:kooho_test/screens/register.dart';
import 'package:kooho_test/screens/splash_screen.dart';

final router = GoRouter(
  initialLocation: AppRoutes.spalsh,
  routes: [
    GoRoute(
      path: AppRoutes.spalsh,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: AppRoutes.register,
      builder: (context, state) => const Register(),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      name: AppRoutes.dashboard,
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: AppRoutes.notification,
      name: AppRoutes.notification,
      builder: (context, state) => const Notification(),
    )
  ],
);

class AppRoutes {
  static String spalsh = "/";
  static String register = "/register";
  static String dashboard = "/dashboard";
  static String notification = "/notification";
}
