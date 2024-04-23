import 'package:flutter/material.dart';
import 'package:srs5/service/shared_preference.dart';
import 'bottombarpage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFieldWithIcon(
              controller: nameController,
              labelText: 'Name',
              icon: Icons.person,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithIcon(
              controller: emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            _buildTextFieldWithIcon(
              controller: phoneNumberController,
              labelText: 'Phone Number',
              icon: Icons.phone,
            ),
            SizedBox(height: 20),
            _buildPasswordTextFieldWithIcon(
              controller: passwordController,
              labelText: 'Password',
              icon: Icons.lock,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SharedPreferenceHelper.setAuthenticated(true);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomBarPage(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                    ),
                  ),
                  (route) => false,
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     const url = 'https://srsp7-f71c5-default-rtdb.firebaseio.com//user.json';
  //     http.post(Uri.parse(url),body: jsonEncode({
  //       'name': nameController,
  //       'phone': phoneNumberController,
  //       'email': emailController,
  //       'password': passwordController,
  //     }));
  //     _showDialog(name: _fullnameController.text);
  //   } else {
  //     _showMessage(message: LocaleKeys.submitForm.tr());
  //   }
  // }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter your $labelText',
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildPasswordTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter your $labelText',
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      obscureText: !_isPasswordVisible,
    );
  }
}
