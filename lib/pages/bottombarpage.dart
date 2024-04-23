import 'package:flutter/material.dart';
import 'package:srs5/pages/animationpage.dart';
import 'package:srs5/pages/translationpage.dart';
import 'package:srs5/pages/qr/ui/qr_page.dart';
import 'package:srs5/pages/likepage.dart';
import 'package:srs5/pages/profilepage.dart';
import 'package:srs5/ui/pages/homepage.dart';
import 'package:srs5/ui/pages/newspage.dart';


class BottomBarPage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  BottomBarPage({required this.name, required this.email, required this.phoneNumber});

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isAuthenticated ? BottomBarPage(name: '', email: '', phoneNumber: '') : LanguageSelectionPage(),
    );
  }
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar Page'),
        backgroundColor: Colors.pink,
      ),
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red),
            label: 'Home Page', backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.red),
            label: 'Like Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium_rounded, color: Colors.red),
            label: 'news Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.red),
            label: 'QR page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation, color: Colors.red),
            label: 'Anim page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_sharp, color: Colors.red),
            label: 'User Info Page',
          ),
          
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SecondPage();
      case 2:
        return ThirdPage();
      case 3:
        return QrScannPage(); // Use QrScannPage here
      case 5:
        return UserInfoPage();
      case 4:
        return AnimationPage();
      default:
        return Container();
    }
  }
}
