import 'package:flutter/material.dart';
import 'package:member_humic/presentation/landing_pages/dashboard.dart';
import 'package:member_humic/presentation/member_pages/announcementpage.dart';
import 'package:member_humic/presentation/member_pages/dashboardpages/dashboardpage.dart';
import 'package:member_humic/presentation/member_pages/projectgallerypage.dart/projectgallery.dart';

class Membernavbar extends StatefulWidget {
  const Membernavbar({super.key});

  @override
  _MembernavbarState createState() => _MembernavbarState();
}

class _MembernavbarState extends State<Membernavbar> {
  Widget _selectedPage = const DashboardpageMember();
  String _currentPage = 'Dashboard';

  void _navigateTo(Widget page, String pageName) {
    setState(() {
      _selectedPage = page;
      _currentPage = pageName;
    });
    Navigator.of(context).pop();
  }

  void _logout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
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
                    page: const DashboardpageMember(),
                  ),
                  _buildMenuItem(
                    icon: Icons.person_add_outlined,
                    title: 'Project Gallery',
                    currentPage: 'Project Gallery',
                    page: const ProjectgalleryMember(),
                  ),
                  _buildMenuItem(
                    icon: Icons.event_note_outlined,
                    title: 'Announcement',
                    currentPage: 'Announcement',
                    page: const AnnouncementpageMember(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton.icon(
                onPressed: _logout,
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD81F13).withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9), 
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                ),
              ),
            )
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
