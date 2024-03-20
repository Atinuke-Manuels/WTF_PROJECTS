import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fusions/features/login/pages/login_page.dart';
import 'package:fusions/features/reset_password/page/forgot_password_page.dart';
import 'package:fusions/features/signup/pages/signup_page.dart';

import 'features/home/pages/home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/fusions.png'), // Adjust the path accordingly
        duration: 3000,
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.cyan,
        nextScreen: LoginPage(),
      ),
      routes: {
        '/LoginPage' : (context) => const LoginPage(),
        '/ForgotPasswordPage' : (context) => const ForgotPasswordPage(),
        '/SignUpPage' : (context) => const SignUpPage(),
        '/MyHomePage': (context) => const MyHomePage(),
      },
    );
  }
}

