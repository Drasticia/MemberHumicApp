import 'package:flutter/material.dart';
import 'package:member_humic/presentation/auth/login.dart';
import 'package:member_humic/presentation/landing_pages/aboutus.dart';
import 'package:member_humic/presentation/landing_pages/contactus.dart';
import 'package:member_humic/presentation/landing_pages/projectgallery.dart';
import 'package:member_humic/presentation/landing_pages/statistik.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget _selectedPage = const Home(); 
  String _currentPage = 'Home';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/logo.png', 
              height: 40,
            ),
          ],
        ),
      ),
      
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/icons/logo.png', width: 40),
            ),
            ListTile(
              title: Text('Home', style: TextStyle(
                color: _currentPage == 'Home' ? Colors.black : Colors.grey,
                fontWeight: _currentPage == 'Home' ? FontWeight.bold : FontWeight.normal,
              )),
              onTap: () {
                _navigateTo(const Home(), 'Home');
              },
            ),
            ListTile(
              title: Text('About Us', style: TextStyle(
                color: _currentPage == 'About' ? Colors.black : Colors.grey,
                fontWeight: _currentPage == 'About' ? FontWeight.bold : FontWeight.normal,
              )),
              onTap: () {
                _navigateTo(const AboutPage(), 'About');
              },
            ),
            ListTile(
              title: Text('Statistic', style: TextStyle(
                color: _currentPage == 'Statistic' ? Colors.black : Colors.grey,
                fontWeight: _currentPage == 'Statistic' ? FontWeight.bold : FontWeight.normal,
              )),
              onTap: () {
                _navigateTo(const StatisticPage(), 'Statistic');
              },
            ),
            ListTile(
              title: Text('Project Gallery', style: TextStyle(
                color: _currentPage == 'Project Gallery' ? Colors.black : Colors.grey,
                fontWeight: _currentPage == 'Project Gallery' ? FontWeight.bold : FontWeight.normal,
              )),
              onTap: () {
                _navigateTo(const ProjectgalleryPage(), 'Project Gallery');
              },
            ),
            ListTile(
              title: Text('Contact Us', style: TextStyle(
                color: _currentPage == 'Contact' ? Colors.black : Colors.grey,
                fontWeight: _currentPage == 'Contact' ? FontWeight.bold : FontWeight.normal,
              )),
              onTap: () {
                _navigateTo(const ContactPage(), 'Contact');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Login', style: TextStyle(
                color: Colors.black,
              )),
              onTap: () {
                _navigateTo(const LoginPage(), 'Login');
              },
            ),
          ],
        ),
      ),
      body: _selectedPage,
    );
  }
}
