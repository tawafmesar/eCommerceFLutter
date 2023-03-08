import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/services/auth.dart';

import 'package:untitled1/utilities/router.dart';
import 'package:untitled1/utilities/routes.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFE5E5E5),
          primaryColor: Colors.redAccent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 2,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
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
            errorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                    color: Colors.red
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                    color: Colors.red
                )
            ),
          ),
        ),
        onGenerateRoute: onGenerate ,
        initialRoute: AppRoutes.landingPageRoute,
        // home:SplashScrean()
      ),
    );
  }
}
