import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:member_humic/data/datasources/auth_remote_datasource.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
import 'package:member_humic/presentation/admin_pages/bloc/member/member_bloc.dart';
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
    return MultiProvider(
      providers: [
        Provider<UserRemoteDatasource>(
          create: (context) => UserRemoteDatasource(),
        ),
        Provider<AuthRemoteDatasource>(
          create: (context) => AuthRemoteDatasource(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<AuthRemoteDatasource>()),
          ),
          BlocProvider<LogoutBloc>(
            create: (context) => LogoutBloc(context.read<AuthRemoteDatasource>()),
          ),
          BlocProvider<MemberBloc>(
            create: (context) => MemberBloc(context.read<UserRemoteDatasource>()),
          ),
        ],
        child: const MaterialApp(
          title: 'Member Humic',
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
        ),
      ),
    );
  }
}
