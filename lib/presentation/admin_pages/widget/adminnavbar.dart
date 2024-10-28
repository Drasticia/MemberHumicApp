import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/presentation/admin_pages/addmemberpage.dart';
import 'package:member_humic/presentation/admin_pages/announcmentpage.dart';
import 'package:member_humic/presentation/admin_pages/dashboardpage.dart';
import 'package:member_humic/presentation/admin_pages/memberhistory.dart';
import 'package:member_humic/presentation/admin_pages/projectgallery/projectgallerypage.dart';
import 'package:member_humic/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:member_humic/presentation/auth/login.dart';
import 'package:member_humic/presentation/landing_pages/dashboard.dart';

class Adminnavbar extends StatefulWidget {
  const Adminnavbar({super.key});

  @override
  State<Adminnavbar> createState() => _AdminnavbarState();
}

class _AdminnavbarState extends State<Adminnavbar> {
  Widget _selectedPage = const DashboardpageAdmin();
  String _currentPage = 'Dashboard';

  void _navigateTo(Widget page, String pageName) {
    setState(() {
      _selectedPage = page;
      _currentPage = pageName;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/icons/logo.png', width: 40),
                  ),
                  _buildMenuItem(
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    currentPage: 'Dashboard',
                    page: const DashboardpageAdmin(),
                  ),
                  _buildMenuItem(
                    icon: Icons.person_add_outlined,
                    title: 'Add Member',
                    currentPage: 'Add Member',
                    page: const Addmemberpage(),
                  ),
                  _buildMenuItem(
                    icon: Icons.event_note_outlined,
                    title: 'Announcement',
                    currentPage: 'Announcement',
                    page: const Announcmentpage(),
                  ),
                  _buildMenuItem(
                    icon: Icons.photo_outlined,
                    title: 'Project Gallery',
                    currentPage: 'Project Gallery',
                    page: const Projectgallerypage(),
                  ),
                  _buildMenuItem(
                    icon: Icons.folder_shared_outlined,
                    title: 'Member History',
                    currentPage: 'Member History',
                    page: const Memberhistorypage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    success: (_) {
                      AuthLocalDatasource().removeAuthData();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Dashboard()),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      context.read<LogoutBloc>().add(const LogoutEvent.logout());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD81F13).withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: _selectedPage,
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String currentPage,
    required Widget page,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: _currentPage == currentPage
              ? const Color(0xff1B59F8).withOpacity(0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: _currentPage == currentPage
                ? const Color(0xff1B59F8)
                : Colors.grey,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: _currentPage == currentPage
                  ? const Color(0xff1B59F8)
                  : Colors.grey,
              fontWeight: _currentPage == currentPage
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          onTap: () {
            _navigateTo(page, currentPage);
          },
        ),
      ),
    );
  }
}
