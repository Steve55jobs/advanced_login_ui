import 'package:advanced_login_ui/widgets/appbar.dart';
import 'package:advanced_login_ui/widgets/button.dart';
import 'package:advanced_login_ui/widgets/fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.red[900],
              Colors.grey[900].withGreen(1),
              Colors.red[900],
            ],
          ),
        ),
        child: Column(
          children: [
            CustomAppBar(),
            CustomFields(),
            SizedBox(height: 20),
            Button(),
            
          ],
        ),
      ),
    );
  }
}
