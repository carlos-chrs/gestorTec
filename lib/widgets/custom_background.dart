// import 'package:flutter/material.dart';

// class CustomBackground extends StatelessWidget {
//   const CustomBackground({super.key, required this.child});
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: CustomPaint(
//         foregroundPainter: BackgroundPainter(),
//         child: Container(child: child),
//       ),
//     );
//   }
// }

// class BackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white // Color de las figuras geométricas
//       ..style = PaintingStyle.fill;

//     // Dibujar un rectángulo
//     // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
//     canvas.drawColor(Colors.white, BlendMode.color);

//     // Dibujar un círculo
//     // Puedes agregar más figuras geométricas según tus necesidades
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
