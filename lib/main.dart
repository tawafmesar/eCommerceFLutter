import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/auth_controller.dart';
import 'package:untitled1/login_page.dart';

import 'package:untitled1/signup_page.dart';
import 'package:untitled1/splash_screen.dart';
import 'package:untitled1/utilities/router.dart';
import 'package:untitled1/utilities/routes.dart';
import 'package:untitled1/welcome_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
        primaryColor: Colors.redAccent,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.titleSmall,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(
              color: Colors.grey
            )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(
                  color: Colors.grey
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius:  BorderRadius.circular(2.0),
              borderSide: const BorderSide(
                  color: Colors.grey
              )
          ),

        ),
      ),

      onGenerateRoute: onGenerate ,
      initialRoute: AppRoutes.loginPageRoute,
      // home:SplashScrean()
    );
  }
}
