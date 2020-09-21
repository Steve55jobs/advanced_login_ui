import 'package:advanced_login_ui/animation/fade.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  AnimationController _animeController;
  Animation<Color> _colorAnimationForButton;
  Animation _curve;
  bool isTaped = false;

  @override
  void initState() {
    super.initState();
    _animeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _curve = CurvedAnimation(
      parent: _animeController,
      curve: Curves.slowMiddle,
    );

    _colorAnimationForButton = ColorTween(
      begin: Colors.orange,
      end: Colors.orange[700],
    ).animate(_curve);

    _animeController.addListener(() {
      setState(() {});
    });

    _animeController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          isTaped = true;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          isTaped = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animeController,
      builder: (context, _) {
        return Column(
          children: [
            FadeAnimation(
              1,
              GestureDetector(
                onTap: () {
                  isTaped
                      ? _animeController.reverse()
                      : _animeController.forward();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white10,
                        offset: Offset(0, 2),
                      )
                    ],
                    color: _colorAnimationForButton.value,
                  ),
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            FadeAnimation(
              1.3,
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Haven't any account? Sign Up for free!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
