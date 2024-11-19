import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/datasources/home/about_service.dart';
import 'package:member_humic/data/datasources/home/projectg_service.dart';
import 'package:member_humic/data/datasources/home/static_service.dart';
import 'package:member_humic/data/datasources/memberhistory_service.dart';
import 'package:member_humic/data/datasources/profile_service.dart';
import 'package:member_humic/data/datasources/projectgallery_service.dart';
import 'package:member_humic/data/datasources/projectgallerymember_service.dart';
import 'package:member_humic/presentation/admin_pages/bloc/ChangeStatusMember/change_status_member_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/addmember/addmember_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/announcement/announcement_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/memberhistory/memberhistory_bloc.dart';
import 'package:member_humic/presentation/admin_pages/bloc/projectgallery/projectgallery_bloc.dart';
import 'package:member_humic/presentation/landing_pages/bloc/ProjectG/project_g_bloc.dart';
import 'package:member_humic/presentation/landing_pages/bloc/statistic/statistic_bloc.dart';
import 'package:member_humic/presentation/landing_pages/bloc/MemberLanding/member_bloc.dart';
import 'package:member_humic/presentation/member_pages/bloc/ProjectGalleryS/project_gallery_s_bloc.dart';
import 'package:member_humic/presentation/member_pages/bloc/profile/profile_bloc.dart';
import 'package:provider/provider.dart';
import 'package:member_humic/data/datasources/auth_remote_datasource.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
import 'package:member_humic/presentation/admin_pages/bloc/member/member_bloc.dart';
import 'package:member_humic/presentation/auth/bloc/login/login_bloc.dart';
import 'package:member_humic/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:member_humic/presentation/landing_pages/dashboard.dart';
import 'package:member_humic/data/datasources/announcement_service.dart'; 
import 'package:http/http.dart' as http;

import 'data/datasources/changestatusmember_service.dart';

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
        Provider<AuthLocalDatasource>(
          create: (_) => AuthLocalDatasource(),
        ),
        Provider<MemberHistoryService>(
          create: (context) => MemberHistoryService(
            Variables.baseUrl,
            context.read<AuthLocalDatasource>(),
          ),
        ),
        Provider<ProfileService>(
          create: (_) => ProfileService(),
        ),
        Provider<ProjectGalleryMemberService>(
          create: (_) => ProjectGalleryMemberService(),
        ),
        Provider<StatisticsService>( 
          create: (_) => StatisticsService(),
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
          BlocProvider<MemberhistoryBloc>(
            create: (context) => MemberhistoryBloc(
              memberHistoryService: context.read<MemberHistoryService>(),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(context.read<ProfileService>()),
          ),
          BlocProvider<ProjectGallerySBloc>(
            create: (context) => ProjectGallerySBloc(
              service: context.read<ProjectGalleryMemberService>(),
            ),
          ),
          BlocProvider<ProjectGBloc>(
            create: (context) => ProjectGBloc(ProjectGService())..add(ProjectGEvent.fetchApprovedProjects()),
          ),
          BlocProvider<StatisticBloc>(
            create: (context) => StatisticBloc(context.read<StatisticsService>()),
          ),
          BlocProvider(
            create: (context) => ChangeStatusMemberBloc(ChangeStatusMemberService()),
          ),
          BlocProvider<MemberLandingBloc>(
            create: (context) => MemberLandingBloc(MemberService()),
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
