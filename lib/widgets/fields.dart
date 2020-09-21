import 'package:advanced_login_ui/animation/fade.dart';
import 'package:advanced_login_ui/widgets/forgor_password_anime.dart';
import 'package:flutter/material.dart';

class CustomFields extends StatefulWidget {
  @override
  _CustomFieldsState createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: FadeAnimation(
        1,
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.80),
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  emailField(),
                  passField(),
                ],
              ),
            ),
            SizedBox(height: 10),
            ForgotPasswordAnimation(),
          ],
        ),
      ),
    );
  }

  Container emailField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[350],
          ),
        ),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.deepOrangeAccent,
        ),
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Container passField() {
    return Container(
      child: TextField(
        style: TextStyle(
          color: Colors.deepOrangeAccent,
        ),
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
