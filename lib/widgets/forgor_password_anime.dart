import 'package:flutter/material.dart';

class ForgotPasswordAnimation extends StatefulWidget {
  @override
  _ForgotPasswordAnimationState createState() =>
      _ForgotPasswordAnimationState();
}

class _ForgotPasswordAnimationState extends State<ForgotPasswordAnimation>
    with TickerProviderStateMixin {
  AnimationController _animeController;
  Animation<double> _titleSizeAnimation;
  bool isTaped = false;

  @override
  void initState() {
    super.initState();

    _animeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _titleSizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween<double>(begin: 17, end: 18), weight: 18),
        TweenSequenceItem(tween: Tween<double>(begin: 18, end: 17), weight: 18),
      ],
    ).animate(_animeController);

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
        return GestureDetector(
          onTap: () =>
              isTaped ? _animeController.reverse() : _animeController.forward(),
          child: Container(
            height: 30,
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password? ',
              style: TextStyle(
                fontSize: _titleSizeAnimation.value,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
