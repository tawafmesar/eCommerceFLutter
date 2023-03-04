import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/services/auth.dart';
import 'package:untitled1/views/pages/bottom_bavbar.dart';
import '../../controllers/auth_controller.dart';

import 'home_page.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthBase>(context, listen: false);
    final auth = Provider.of<AuthBase>(context);

    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const LoginPage());

            }

            return ChangeNotifierProvider<AuthController>(
              create: (_) => AuthController(auth: auth),
              child: const BottomNavBar(),
            );

          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
