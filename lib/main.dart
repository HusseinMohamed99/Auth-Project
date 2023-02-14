import 'package:auth_project/OnBoarding/on_boarding_screen.dart';
import 'package:auth_project/SignIn/sign_in_screen.dart';
import 'package:auth_project/SignUp/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor:  const Color.fromARGB(255, 47, 84, 205),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SignInScreen.routeName : (context)=>  SignInScreen(),
        SignUpScreen.routeName : (context)=> const SignUpScreen(),
        OnBoardScreen.routeName : (context)=> const OnBoardScreen(),
      },
      initialRoute: OnBoardScreen.routeName,
    );
  }
}