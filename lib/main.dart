import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users_task/presentation/view_models/cubits/get_users_cubit/get_users_cubit.dart';

import 'presentation/views/user_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUsersCubit()..getUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UsersListView(),
      ),
    );
  }
}
