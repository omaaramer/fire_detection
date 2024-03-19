import 'package:chat_app/business_logic/fire_state_cubit/fire_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constants.dart';
import 'home_page_in_fire_state.dart';
import 'home_page_in_safe_state.dart';
import 'widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _safeState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey,
        title: CustomAppBar(
          onPressed: () {
            BlocProvider.of<FireCubit>(context)
                .updateFireState(state: _safeState ? ksafestate : kfirestate);
            setState(() {
              _safeState = !_safeState;
            });
            BlocProvider.of<FireCubit>(context).getFireState();
          },
        ),
      ),
      body: Container(
          color: kGrey,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<FireCubit, FireState>(
            builder: (context, state) {
              if (state is FireWarning) {
                return const HomePageInFireState();
              } else {
                return const HomePageInSafeState();
              }
            },
          )),
    );
  }
}
