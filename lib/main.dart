import 'package:chat/screens/onboarding_screen.dart';
import 'package:chat/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/sign_up_screen.dart';
import 'package:chat/screens/forgot_password_screen.dart';
//import 'package:chat/screens/onboarding_screen.dart;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 10));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: OnboardingScreen(),
    );
  }
}


