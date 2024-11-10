import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/projectgallery_service.dart';
import 'package:member_humic/presentation/admin_pages/bloc/addmember/addmember_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/announcement/announcement_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/projectgallery/projectgallery_bloc.dart';
import 'package:provider/provider.dart';
import 'package:member_humic/data/datasources/auth_remote_datasource.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
import 'package:member_humic/presentation/admin_pages/bloc/member/member_bloc.dart';
import 'package:member_humic/presentation/auth/bloc/login/login_bloc.dart';
import 'package:member_humic/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:member_humic/presentation/landing_pages/dashboard.dart';
import 'package:member_humic/data/datasources/announcement_service.dart'; // Import AnnouncementService

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
          create: (_) => UserRemoteDatasource(),
        ),
        Provider<AuthRemoteDatasource>(
          create: (_) => AuthRemoteDatasource(),
        ),
        Provider<AnnouncementService>(
          create: (_) => AnnouncementService(),
        ),
        Provider<ProjectGalleryService>(
          create: (_) => ProjectGalleryService(),
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
          BlocProvider<AddmemberBloc>(
            create: (context) => AddmemberBloc(context.read<UserRemoteDatasource>()),
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => AnnouncementBloc(
              announcementService: context.read<AnnouncementService>(),
            ),
          ),
          BlocProvider<ProjectgalleryBloc>(
            create: (context) => ProjectgalleryBloc(context.read<ProjectGalleryService>()),
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