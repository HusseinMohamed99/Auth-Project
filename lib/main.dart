import 'package:auth_project/OnBoarding/on_boarding_screen.dart';
import 'package:auth_project/SignIn/sign_in_screen.dart';
import 'package:auth_project/SignUp/sign_up_screen.dart';
import 'package:auth_project/bloc_observer.dart';
import 'package:auth_project/firebase_options.dart';
import 'package:auth_project/home_screen/home_screen.dart';
import 'package:auth_project/shared/cache_helper.dart';
import 'package:auth_project/shared/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  if (uId == null) {
    const OnBoardScreen();
  }
  const HomeScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 47, 84, 205),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        OnBoardScreen.routeName: (context) => const OnBoardScreen(),
      },
      initialRoute: OnBoardScreen.routeName,
    );
  }
}
