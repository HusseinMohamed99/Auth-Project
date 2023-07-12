import 'package:auth_project/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:auth_project/Cubit/sign_up_cubit/sign_up_state.dart';
import 'package:auth_project/components/components.dart';
import 'package:auth_project/components/navigator.dart';
import 'package:auth_project/home_screen/home_screen.dart';
import 'package:auth_project/shared/cache_helper.dart';
import 'package:auth_project/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is UserCreateSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uid);
            uId = state.uid;
            navigateAndFinish(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Let's Get Started!",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Create an account',
                        style: TextStyle(
                            fontSize: 20,
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
                        controller: nameController,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your user Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        hint: 'Email',
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
                          Icons.phone,
                        ),
                        hint: 'Phone',
                        controller: phoneController,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
                        isPassword: SignUpCubit.get(context).isPassword,
                        suffixPressed: () {
                          SignUpCubit.get(context).showPassword();
                        },
                        suffix: SignUpCubit.get(context).suffix,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        hint: 'Password',
                        controller: passwordController,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your Password';
                          } else if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            return "your Password doesn't same";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormField(
                        isPassword: SignUpCubit.get(context).isPassword,
                        suffixPressed: () {
                          SignUpCubit.get(context).showPassword();
                        },
                        suffix: SignUpCubit.get(context).suffix,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        hint: 'Confirm Password',
                        controller: confirmPasswordController,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your Confirm Password';
                          }
                          if (value.trim().length < 6) {
                            return 'No';
                          } else if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            return "your confirm Password doesn't same";
                          }

                          return null;
                        },
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
                            if (formKey.currentState!.validate()) {
                              SignUpCubit.get(context).userSignUp(
                                password: passwordController.text,
                                email: emailController.text,
                                userName: nameController.text,
                                phone: phoneController.text,
                              );
                            }
                            return;
                          },
                          child: Text(
                            'create'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login Here',
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
          );
        },
      ),
    );
  }
}
