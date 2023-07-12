import 'package:auth_project/Cubit/gdsc_cubit/gdsc_cubit.dart';
import 'package:auth_project/Cubit/gdsc_cubit/gdsc_state.dart';
import 'package:auth_project/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GdscCubit(),
      child: BlocConsumer<GdscCubit, GdscStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GdscCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        logOut(context);
                      },
                      child: const Text('Logout')),
                  TextButton(
                      onPressed: () {
                        cubit.deleteAccount(context);
                      },
                      child: const Text('Delete Account')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
