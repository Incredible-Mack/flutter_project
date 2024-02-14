import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _borderRadius = 100;
  final Tween<double> _backgroundScale = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [_pageBackGround(), _circularAnimationBtn()],
        ),
      ),
    );
  }

  Widget _pageBackGround() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: Duration(seconds: 2),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(100),
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _circularAnimationBtn() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _borderRadius += _borderRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          height: _borderRadius,
          width: _borderRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: const Center(
            child: Text(
              "Tap Me",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
