import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/auth_remote_datasource.dart';
import 'package:member_humic/presentation/auth/bloc/login/login_bloc.dart';
import 'package:member_humic/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:member_humic/presentation/landing_pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
      ],
      child: const MaterialApp(
        title: 'Member Humic',
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      ),
    );
  }
}
