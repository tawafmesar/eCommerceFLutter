import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/utilities/routes.dart';
import 'package:untitled1/views/pages/bottom_bavbar.dart';
import 'package:untitled1/views/pages/checkout/checkout_page.dart';
import 'package:untitled1/views/pages/landing_page.dart';
import 'package:untitled1/views/pages/login_page.dart';
import 'package:untitled1/views/pages/product_detalis.dart';

import '../controllers/database_controller.dart';
import '../models/product.dart';

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

    case AppRoutes.checkoutPageRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database, 
            child: const CheckoutPage()),
        settings: settings,
      );

    case AppRoutes.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(product: product),
        ),
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
