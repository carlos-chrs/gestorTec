import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double blurIntensity;

  const BlurredBackground({
    Key? key,
    required this.child,
    this.backgroundColor = const Color.fromARGB(176, 226, 226, 226),
    this.blurIntensity = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
        child: Container(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}
