import 'package:auth_project/Cubit/gdsc_cubit/gdsc_state.dart';
import 'package:auth_project/OnBoarding/on_boarding_screen.dart';
import 'package:auth_project/components/navigator.dart';
import 'package:auth_project/shared/cache_helper.dart';
import 'package:auth_project/shared/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GdscCubit extends Cubit<GdscStates> {
  GdscCubit() : super(GdscInitialState());

  static GdscCubit get(context) => BlocProvider.of(context);

  void deleteAccount(context) async {
    await FirebaseAuth.instance.currentUser!.delete().then((value) async {
      await FirebaseFirestore.instance.collection('users').doc(uId).delete();
      CacheHelper.removeData(key: 'uId').then((value) {
        if (value) {
          navigateAndFinish(context, const OnBoardScreen());
        }
      });
    });
  }
}
