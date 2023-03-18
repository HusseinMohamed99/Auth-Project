import 'package:auth_project/Cubit/sign_in_cubit/sign_in_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShowPassword());
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SignInSuccessState(value.user!.uid));
      print('Done');
    }).catchError((error) {
      emit(SignInErrorState(error.toString()));
    });
  }
}
