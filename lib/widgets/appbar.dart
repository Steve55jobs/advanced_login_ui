import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (context, double value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: buildAppBarBackground(),
    );
  }

  Container buildAppBarBackground() {
    return Container(
      height: 300,
      child: Stack(
        children: [
          buildFirstLightImage(),
          buildSeccondLightImage(),
          buildBookImage(),
          buildLoginTitle(),
        ],
      ),
    );
  }

  Positioned buildBookImage() {
    return Positioned(
      left: 260,
      top: 100,
      height: 130,
      child: Image.asset('assets/books.png'),
    );
  }

  Positioned buildLoginTitle() {
    return Positioned(
      left: 160,
      top: 230,
      height: 60,
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  Positioned buildSeccondLightImage() {
    return Positioned(
      left: 130,
      width: 80,
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/light.png'),
          ),
        ),
      ),
    );
  }

  Positioned buildFirstLightImage() {
    return Positioned(
      left: 30,
      width: 80,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/light.png'),
          ),
        ),
      ),
    );
  }
}
