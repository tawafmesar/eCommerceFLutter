import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/utilities/routes.dart';
import 'package:untitled1/views/pages/bottom_bavbar.dart';
import 'package:untitled1/views/pages/landing_page.dart';
import 'package:untitled1/views/pages/login_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );

    case AppRoutes.bottomNavRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavBar(),
        settings: settings,
      );

    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
