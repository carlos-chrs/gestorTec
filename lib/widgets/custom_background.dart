import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  CustomBackground({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(),
      child: Container(child: child),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Color de las figuras geométricas
      ..style = PaintingStyle.fill;

    // Dibujar un rectángulo
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Dibujar un círculo
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);

    // Puedes agregar más figuras geométricas según tus necesidades
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
