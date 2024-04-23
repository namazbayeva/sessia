import 'package:flutter/material.dart';
import 'package:srs5/pages/bottombarpage.dart';
import 'package:srs5/pages/translationpage.dart';
import 'package:srs5/service/shared_preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init().then((_) {
    bool isAuthenticated = SharedPreferenceHelper.isAuthenticated();
    runApp(MyApp(isAuthenticated: isAuthenticated));
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isAuthenticated ? BottomBarPage(name: 'Nazyken', email: 'anazyken@gmail.com', phoneNumber: '87478424543') : LanguageSelectionPage(),
    );
  }
}
