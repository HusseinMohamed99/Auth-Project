import 'dart:async';
import 'package:auth_project/SignIn/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static const String routeName = 'onboard';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const Expanded(
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('asset/images/Onboarding.png'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 84, 205),
            ),
            child: MaterialButton(
              elevation: 6,
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'get started'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
