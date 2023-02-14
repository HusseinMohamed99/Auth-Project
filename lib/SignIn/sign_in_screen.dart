import 'package:auth_project/SignUp/sign_up_screen.dart';
import 'package:auth_project/commponents/commponents.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'login';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    width: 200,
                    image: AssetImage(
                      'asset/images/loginImage.jpg',
                    ),
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Log in to your existant account',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                    ),
                    hint: 'UserName',
                    controller: emailController,
                    validate: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    hint: 'Password',
                    controller: passwordController,
                    validate: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 47, 84, 205),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      elevation: 6,
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) {
                          return;
                        }
                        print('Done');
                      },
                      child: Text(
                        'login'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Container(
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             color: const Color.fromARGB(255, 47, 84, 205),
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           child: MaterialButton(
                  //             elevation: 6,
                  //             onPressed: () {},
                  //             child: Text(
                  //               'FaceBook'.toUpperCase(),
                  //               style: const TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 20,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 30,
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             color: Colors.red,
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           child: MaterialButton(
                  //             elevation: 6,
                  //             onPressed: () {},
                  //             child: Text(
                  //               'Google'.toUpperCase(),
                  //               style: const TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 20,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
