import 'package:flutter/material.dart';
import 'registerpage.dart';




class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            LanguageButton(language: 'Kazakh', icon: Icons.language, nextPage: RegistrationPage()),
            SizedBox(height: 20),
            LanguageButton(language: 'Russian', icon: Icons.language, nextPage: RegistrationPage()),
            SizedBox(height: 20),
            LanguageButton(language: 'English', icon: Icons.language, nextPage: RegistrationPage()),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String language;
  final IconData icon;
  final Widget nextPage;

  LanguageButton({required this.language, required this.icon, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      icon: Icon(icon, color: Colors.grey),
      label: Text(language),
    );
  }


}

