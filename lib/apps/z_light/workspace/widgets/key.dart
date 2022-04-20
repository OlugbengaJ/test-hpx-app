import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      Paint paint = Paint();
      Path path = Path();
  

      // Path number 1
  

      paint.color = Color(0xffffffff);
      path = Path();
      path.lineTo(0, -0.02);
      path.cubicTo(0, -0.02, size.width, -0.02, size.width, -0.02);
      path.cubicTo(size.width, -0.02, size.width, size.height * 0.52, size.width, size.height * 0.52);
      path.cubicTo(size.width, size.height * 0.52, 0, size.height * 0.52, 0, size.height * 0.52);
      path.cubicTo(0, size.height * 0.52, 0, -0.02, 0, -0.02);
      canvas.drawPath(path, paint);
  

      // Path number 2
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height * 0.67);
      path.cubicTo(size.width * 0.02, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.67, size.width * 0.02, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 3
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.1, size.height * 0.67);
      path.cubicTo(size.width * 0.1, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.1, size.height * 0.07, size.width * 0.1, size.height * 0.07);
      path.cubicTo(size.width * 0.1, size.height * 0.07, size.width * 0.1, size.height * 0.67, size.width * 0.1, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 4
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.15, size.height * 0.67);
      path.cubicTo(size.width * 0.15, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.15, size.height * 0.07, size.width * 0.15, size.height * 0.07);
      path.cubicTo(size.width * 0.15, size.height * 0.07, size.width * 0.15, size.height * 0.67, size.width * 0.15, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 5
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.19, size.height * 0.67);
      path.cubicTo(size.width * 0.19, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.19, size.height * 0.07, size.width * 0.19, size.height * 0.07);
      path.cubicTo(size.width * 0.19, size.height * 0.07, size.width * 0.19, size.height * 0.67, size.width * 0.19, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 6
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.23, size.height * 0.67);
      path.cubicTo(size.width * 0.23, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.23, size.height * 0.07, size.width * 0.23, size.height * 0.07);
      path.cubicTo(size.width * 0.23, size.height * 0.07, size.width * 0.23, size.height * 0.67, size.width * 0.23, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 7
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.3, size.height * 0.67);
      path.cubicTo(size.width * 0.3, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.3, size.height * 0.07, size.width * 0.3, size.height * 0.07);
      path.cubicTo(size.width * 0.3, size.height * 0.07, size.width * 0.3, size.height * 0.67, size.width * 0.3, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 8
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.34, size.height * 0.67);
      path.cubicTo(size.width * 0.34, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.34, size.height * 0.07, size.width * 0.34, size.height * 0.07);
      path.cubicTo(size.width * 0.34, size.height * 0.07, size.width * 0.34, size.height * 0.67, size.width * 0.34, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 9
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.39, size.height * 0.67);
      path.cubicTo(size.width * 0.39, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.39, size.height * 0.07, size.width * 0.39, size.height * 0.07);
      path.cubicTo(size.width * 0.39, size.height * 0.07, size.width * 0.39, size.height * 0.67, size.width * 0.39, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 10
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.43, size.height * 0.67);
      path.cubicTo(size.width * 0.43, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.43, size.height * 0.07, size.width * 0.43, size.height * 0.07);
      path.cubicTo(size.width * 0.43, size.height * 0.07, size.width * 0.43, size.height * 0.67, size.width * 0.43, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 11
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.49, size.height * 0.67);
      path.cubicTo(size.width * 0.49, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.49, size.height * 0.07, size.width * 0.49, size.height * 0.07);
      path.cubicTo(size.width * 0.49, size.height * 0.07, size.width * 0.49, size.height * 0.67, size.width * 0.49, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 12
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.54, size.height * 0.67);
      path.cubicTo(size.width * 0.54, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.54, size.height * 0.07, size.width * 0.54, size.height * 0.07);
      path.cubicTo(size.width * 0.54, size.height * 0.07, size.width * 0.54, size.height * 0.67, size.width * 0.54, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 13
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.58, size.height * 0.67);
      path.cubicTo(size.width * 0.58, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.58, size.height * 0.07, size.width * 0.58, size.height * 0.07);
      path.cubicTo(size.width * 0.58, size.height * 0.07, size.width * 0.58, size.height * 0.67, size.width * 0.58, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 14
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.62, size.height * 0.67);
      path.cubicTo(size.width * 0.62, size.height * 0.67, size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.67);
      path.cubicTo(size.width * 0.04, size.height * 0.67, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.62, size.height * 0.07, size.width * 0.62, size.height * 0.07);
      path.cubicTo(size.width * 0.62, size.height * 0.07, size.width * 0.62, size.height * 0.67, size.width * 0.62, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 15
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height * 0.77);
      path.cubicTo(size.width * 0.02, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.77, size.width * 0.02, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 16
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.06, size.height * 0.77);
      path.cubicTo(size.width * 0.06, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.06, size.height * 0.07, size.width * 0.06, size.height * 0.07);
      path.cubicTo(size.width * 0.06, size.height * 0.07, size.width * 0.06, size.height * 0.77, size.width * 0.06, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 17
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.1, size.height * 0.77);
      path.cubicTo(size.width * 0.1, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.1, size.height * 0.07, size.width * 0.1, size.height * 0.07);
      path.cubicTo(size.width * 0.1, size.height * 0.07, size.width * 0.1, size.height * 0.77, size.width * 0.1, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 18
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.15, size.height * 0.77);
      path.cubicTo(size.width * 0.15, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.15, size.height * 0.07, size.width * 0.15, size.height * 0.07);
      path.cubicTo(size.width * 0.15, size.height * 0.07, size.width * 0.15, size.height * 0.77, size.width * 0.15, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 19
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.19, size.height * 0.77);
      path.cubicTo(size.width * 0.19, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.19, size.height * 0.07, size.width * 0.19, size.height * 0.07);
      path.cubicTo(size.width * 0.19, size.height * 0.07, size.width * 0.19, size.height * 0.77, size.width * 0.19, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 20
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.23, size.height * 0.77);
      path.cubicTo(size.width * 0.23, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.23, size.height * 0.07, size.width * 0.23, size.height * 0.07);
      path.cubicTo(size.width * 0.23, size.height * 0.07, size.width * 0.23, size.height * 0.77, size.width * 0.23, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 21
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.28, size.height * 0.77);
      path.cubicTo(size.width * 0.28, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.28, size.height * 0.07, size.width * 0.28, size.height * 0.07);
      path.cubicTo(size.width * 0.28, size.height * 0.07, size.width * 0.28, size.height * 0.77, size.width * 0.28, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 22
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.32, size.height * 0.77);
      path.cubicTo(size.width * 0.32, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.32, size.height * 0.07, size.width * 0.32, size.height * 0.07);
      path.cubicTo(size.width * 0.32, size.height * 0.07, size.width * 0.32, size.height * 0.77, size.width * 0.32, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 23
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.36, size.height * 0.77);
      path.cubicTo(size.width * 0.36, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.36, size.height * 0.07, size.width * 0.36, size.height * 0.07);
      path.cubicTo(size.width * 0.36, size.height * 0.07, size.width * 0.36, size.height * 0.77, size.width * 0.36, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 24
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.41, size.height * 0.77);
      path.cubicTo(size.width * 0.41, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.41, size.height * 0.07, size.width * 0.41, size.height * 0.07);
      path.cubicTo(size.width * 0.41, size.height * 0.07, size.width * 0.41, size.height * 0.77, size.width * 0.41, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 25
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.45, size.height * 0.77);
      path.cubicTo(size.width * 0.45, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.45, size.height * 0.07, size.width * 0.45, size.height * 0.07);
      path.cubicTo(size.width * 0.45, size.height * 0.07, size.width * 0.45, size.height * 0.77, size.width * 0.45, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 26
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.49, size.height * 0.77);
      path.cubicTo(size.width * 0.49, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.49, size.height * 0.07, size.width * 0.49, size.height * 0.07);
      path.cubicTo(size.width * 0.49, size.height * 0.07, size.width * 0.49, size.height * 0.77, size.width * 0.49, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 27
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.54, size.height * 0.77);
      path.cubicTo(size.width * 0.54, size.height * 0.77, size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.77);
      path.cubicTo(size.width * 0.04, size.height * 0.77, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.54, size.height * 0.07, size.width * 0.54, size.height * 0.07);
      path.cubicTo(size.width * 0.54, size.height * 0.07, size.width * 0.54, size.height * 0.77, size.width * 0.54, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 28
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.58, size.height * 0.77);
      path.cubicTo(size.width * 0.58, size.height * 0.77, size.width * 0.08, size.height * 0.77, size.width * 0.08, size.height * 0.77);
      path.cubicTo(size.width * 0.08, size.height * 0.77, size.width * 0.08, size.height * 0.07, size.width * 0.08, size.height * 0.07);
      path.cubicTo(size.width * 0.08, size.height * 0.07, size.width * 0.58, size.height * 0.07, size.width * 0.58, size.height * 0.07);
      path.cubicTo(size.width * 0.58, size.height * 0.07, size.width * 0.58, size.height * 0.77, size.width * 0.58, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 29
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height * 0.84);
      path.cubicTo(size.width * 0.02, size.height * 0.84, size.width * 0.06, size.height * 0.84, size.width * 0.06, size.height * 0.84);
      path.cubicTo(size.width * 0.06, size.height * 0.84, size.width * 0.06, size.height * 0.07, size.width * 0.06, size.height * 0.07);
      path.cubicTo(size.width * 0.06, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.84, size.width * 0.02, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 30
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.08, size.height * 0.84);
      path.cubicTo(size.width * 0.08, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.08, size.height * 0.07, size.width * 0.08, size.height * 0.07);
      path.cubicTo(size.width * 0.08, size.height * 0.07, size.width * 0.08, size.height * 0.84, size.width * 0.08, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 31
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.13, size.height * 0.84);
      path.cubicTo(size.width * 0.13, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.13, size.height * 0.07, size.width * 0.13, size.height * 0.07);
      path.cubicTo(size.width * 0.13, size.height * 0.07, size.width * 0.13, size.height * 0.84, size.width * 0.13, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 32
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.17, size.height * 0.84);
      path.cubicTo(size.width * 0.17, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.17, size.height * 0.07, size.width * 0.17, size.height * 0.07);
      path.cubicTo(size.width * 0.17, size.height * 0.07, size.width * 0.17, size.height * 0.84, size.width * 0.17, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 33
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width / 5, size.height * 0.84);
      path.cubicTo(size.width / 5, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width / 5, size.height * 0.07, size.width / 5, size.height * 0.07);
      path.cubicTo(size.width / 5, size.height * 0.07, size.width / 5, size.height * 0.84, size.width / 5, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 34
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.26, size.height * 0.84);
      path.cubicTo(size.width * 0.26, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.26, size.height * 0.07, size.width * 0.26, size.height * 0.07);
      path.cubicTo(size.width * 0.26, size.height * 0.07, size.width * 0.26, size.height * 0.84, size.width * 0.26, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 35
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.3, size.height * 0.84);
      path.cubicTo(size.width * 0.3, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.3, size.height * 0.07, size.width * 0.3, size.height * 0.07);
      path.cubicTo(size.width * 0.3, size.height * 0.07, size.width * 0.3, size.height * 0.84, size.width * 0.3, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 36
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.34, size.height * 0.84);
      path.cubicTo(size.width * 0.34, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.34, size.height * 0.07, size.width * 0.34, size.height * 0.07);
      path.cubicTo(size.width * 0.34, size.height * 0.07, size.width * 0.34, size.height * 0.84, size.width * 0.34, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 37
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.39, size.height * 0.84);
      path.cubicTo(size.width * 0.39, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.39, size.height * 0.07, size.width * 0.39, size.height * 0.07);
      path.cubicTo(size.width * 0.39, size.height * 0.07, size.width * 0.39, size.height * 0.84, size.width * 0.39, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 38
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.43, size.height * 0.84);
      path.cubicTo(size.width * 0.43, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.43, size.height * 0.07, size.width * 0.43, size.height * 0.07);
      path.cubicTo(size.width * 0.43, size.height * 0.07, size.width * 0.43, size.height * 0.84, size.width * 0.43, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 39
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.47, size.height * 0.84);
      path.cubicTo(size.width * 0.47, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.47, size.height * 0.07, size.width * 0.47, size.height * 0.07);
      path.cubicTo(size.width * 0.47, size.height * 0.07, size.width * 0.47, size.height * 0.84, size.width * 0.47, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 40
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.52, size.height * 0.84);
      path.cubicTo(size.width * 0.52, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.52, size.height * 0.07, size.width * 0.52, size.height * 0.07);
      path.cubicTo(size.width * 0.52, size.height * 0.07, size.width * 0.52, size.height * 0.84, size.width * 0.52, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 41
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.56, size.height * 0.84);
      path.cubicTo(size.width * 0.56, size.height * 0.84, size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.84);
      path.cubicTo(size.width * 0.04, size.height * 0.84, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.56, size.height * 0.07, size.width * 0.56, size.height * 0.07);
      path.cubicTo(size.width * 0.56, size.height * 0.07, size.width * 0.56, size.height * 0.84, size.width * 0.56, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 42
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.6, size.height * 0.84);
      path.cubicTo(size.width * 0.6, size.height * 0.84, size.width * 0.06, size.height * 0.84, size.width * 0.06, size.height * 0.84);
      path.cubicTo(size.width * 0.06, size.height * 0.84, size.width * 0.06, size.height * 0.07, size.width * 0.06, size.height * 0.07);
      path.cubicTo(size.width * 0.06, size.height * 0.07, size.width * 0.6, size.height * 0.07, size.width * 0.6, size.height * 0.07);
      path.cubicTo(size.width * 0.6, size.height * 0.07, size.width * 0.6, size.height * 0.84, size.width * 0.6, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 43
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height * 0.92);
      path.cubicTo(size.width * 0.02, size.height * 0.92, size.width * 0.07, size.height * 0.92, size.width * 0.07, size.height * 0.92);
      path.cubicTo(size.width * 0.07, size.height * 0.92, size.width * 0.07, size.height * 0.07, size.width * 0.07, size.height * 0.07);
      path.cubicTo(size.width * 0.07, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.92, size.width * 0.02, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 44
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.09, size.height * 0.92);
      path.cubicTo(size.width * 0.09, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.09, size.height * 0.07, size.width * 0.09, size.height * 0.07);
      path.cubicTo(size.width * 0.09, size.height * 0.07, size.width * 0.09, size.height * 0.92, size.width * 0.09, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 45
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.14, size.height * 0.92);
      path.cubicTo(size.width * 0.14, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.14, size.height * 0.07, size.width * 0.14, size.height * 0.07);
      path.cubicTo(size.width * 0.14, size.height * 0.07, size.width * 0.14, size.height * 0.92, size.width * 0.14, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 46
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.18, size.height * 0.92);
      path.cubicTo(size.width * 0.18, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.18, size.height * 0.07, size.width * 0.18, size.height * 0.07);
      path.cubicTo(size.width * 0.18, size.height * 0.07, size.width * 0.18, size.height * 0.92, size.width * 0.18, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 47
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.22, size.height * 0.92);
      path.cubicTo(size.width * 0.22, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.22, size.height * 0.07, size.width * 0.22, size.height * 0.07);
      path.cubicTo(size.width * 0.22, size.height * 0.07, size.width * 0.22, size.height * 0.92, size.width * 0.22, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 48
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.27, size.height * 0.92);
      path.cubicTo(size.width * 0.27, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.27, size.height * 0.07, size.width * 0.27, size.height * 0.07);
      path.cubicTo(size.width * 0.27, size.height * 0.07, size.width * 0.27, size.height * 0.92, size.width * 0.27, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 49
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.31, size.height * 0.92);
      path.cubicTo(size.width * 0.31, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.31, size.height * 0.07, size.width * 0.31, size.height * 0.07);
      path.cubicTo(size.width * 0.31, size.height * 0.07, size.width * 0.31, size.height * 0.92, size.width * 0.31, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 50
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.35, size.height * 0.92);
      path.cubicTo(size.width * 0.35, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.35, size.height * 0.07, size.width * 0.35, size.height * 0.07);
      path.cubicTo(size.width * 0.35, size.height * 0.07, size.width * 0.35, size.height * 0.92, size.width * 0.35, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 51
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.4, size.height * 0.92);
      path.cubicTo(size.width * 0.4, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.4, size.height * 0.07, size.width * 0.4, size.height * 0.07);
      path.cubicTo(size.width * 0.4, size.height * 0.07, size.width * 0.4, size.height * 0.92, size.width * 0.4, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 52
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.44, size.height * 0.92);
      path.cubicTo(size.width * 0.44, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.44, size.height * 0.07, size.width * 0.44, size.height * 0.07);
      path.cubicTo(size.width * 0.44, size.height * 0.07, size.width * 0.44, size.height * 0.92, size.width * 0.44, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 53
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.48, size.height * 0.92);
      path.cubicTo(size.width * 0.48, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.48, size.height * 0.07, size.width * 0.48, size.height * 0.07);
      path.cubicTo(size.width * 0.48, size.height * 0.07, size.width * 0.48, size.height * 0.92, size.width * 0.48, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 54
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.53, size.height * 0.92);
      path.cubicTo(size.width * 0.53, size.height * 0.92, size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.92);
      path.cubicTo(size.width * 0.04, size.height * 0.92, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.53, size.height * 0.07, size.width * 0.53, size.height * 0.07);
      path.cubicTo(size.width * 0.53, size.height * 0.07, size.width * 0.53, size.height * 0.92, size.width * 0.53, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 55
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.57, size.height * 0.92);
      path.cubicTo(size.width * 0.57, size.height * 0.92, size.width * 0.09, size.height * 0.92, size.width * 0.09, size.height * 0.92);
      path.cubicTo(size.width * 0.09, size.height * 0.92, size.width * 0.09, size.height * 0.07, size.width * 0.09, size.height * 0.07);
      path.cubicTo(size.width * 0.09, size.height * 0.07, size.width * 0.57, size.height * 0.07, size.width * 0.57, size.height * 0.07);
      path.cubicTo(size.width * 0.57, size.height * 0.07, size.width * 0.57, size.height * 0.92, size.width * 0.57, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 56
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height);
      path.cubicTo(size.width * 0.02, size.height, size.width * 0.09, size.height, size.width * 0.09, size.height);
      path.cubicTo(size.width * 0.09, size.height, size.width * 0.09, size.height * 0.07, size.width * 0.09, size.height * 0.07);
      path.cubicTo(size.width * 0.09, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height, size.width * 0.02, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 57
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.12, size.height);
      path.cubicTo(size.width * 0.12, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.12, size.height * 0.07, size.width * 0.12, size.height * 0.07);
      path.cubicTo(size.width * 0.12, size.height * 0.07, size.width * 0.12, size.height, size.width * 0.12, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 58
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.16, size.height);
      path.cubicTo(size.width * 0.16, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.16, size.height * 0.07, size.width * 0.16, size.height * 0.07);
      path.cubicTo(size.width * 0.16, size.height * 0.07, size.width * 0.16, size.height, size.width * 0.16, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 59
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width / 5, size.height);
      path.cubicTo(size.width / 5, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width / 5, size.height * 0.07, size.width / 5, size.height * 0.07);
      path.cubicTo(size.width / 5, size.height * 0.07, size.width / 5, size.height, size.width / 5, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 60
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width / 4, size.height);
      path.cubicTo(size.width / 4, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width / 4, size.height * 0.07, size.width / 4, size.height * 0.07);
      path.cubicTo(size.width / 4, size.height * 0.07, size.width / 4, size.height, size.width / 4, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 61
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.29, size.height);
      path.cubicTo(size.width * 0.29, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.29, size.height * 0.07, size.width * 0.29, size.height * 0.07);
      path.cubicTo(size.width * 0.29, size.height * 0.07, size.width * 0.29, size.height, size.width * 0.29, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 62
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width / 3, size.height);
      path.cubicTo(size.width / 3, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width / 3, size.height * 0.07, size.width / 3, size.height * 0.07);
      path.cubicTo(size.width / 3, size.height * 0.07, size.width / 3, size.height, size.width / 3, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 63
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.38, size.height);
      path.cubicTo(size.width * 0.38, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.38, size.height * 0.07, size.width * 0.38, size.height * 0.07);
      path.cubicTo(size.width * 0.38, size.height * 0.07, size.width * 0.38, size.height, size.width * 0.38, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 64
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.42, size.height);
      path.cubicTo(size.width * 0.42, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.42, size.height * 0.07, size.width * 0.42, size.height * 0.07);
      path.cubicTo(size.width * 0.42, size.height * 0.07, size.width * 0.42, size.height, size.width * 0.42, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 65
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.46, size.height);
      path.cubicTo(size.width * 0.46, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.46, size.height * 0.07, size.width * 0.46, size.height * 0.07);
      path.cubicTo(size.width * 0.46, size.height * 0.07, size.width * 0.46, size.height, size.width * 0.46, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 66
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.51, size.height);
      path.cubicTo(size.width * 0.51, size.height, size.width * 0.04, size.height, size.width * 0.04, size.height);
      path.cubicTo(size.width * 0.04, size.height, size.width * 0.04, size.height * 0.07, size.width * 0.04, size.height * 0.07);
      path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.51, size.height * 0.07, size.width * 0.51, size.height * 0.07);
      path.cubicTo(size.width * 0.51, size.height * 0.07, size.width * 0.51, size.height, size.width * 0.51, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 67
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.55, size.height);
      path.cubicTo(size.width * 0.55, size.height, size.width * 0.11, size.height, size.width * 0.11, size.height);
      path.cubicTo(size.width * 0.11, size.height, size.width * 0.11, size.height * 0.07, size.width * 0.11, size.height * 0.07);
      path.cubicTo(size.width * 0.11, size.height * 0.07, size.width * 0.55, size.height * 0.07, size.width * 0.55, size.height * 0.07);
      path.cubicTo(size.width * 0.55, size.height * 0.07, size.width * 0.55, size.height, size.width * 0.55, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 68
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.02, size.height * 1.07);
      path.cubicTo(size.width * 0.02, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 0.07);
      path.cubicTo(size.width * 0.02, size.height * 0.07, size.width * 0.02, size.height * 1.07, size.width * 0.02, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 69
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.07, size.height * 1.07);
      path.cubicTo(size.width * 0.07, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.07, size.height * 0.07, size.width * 0.07, size.height * 0.07);
      path.cubicTo(size.width * 0.07, size.height * 0.07, size.width * 0.07, size.height * 1.07, size.width * 0.07, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 70
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.12, size.height * 1.07);
      path.cubicTo(size.width * 0.12, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.12, size.height * 0.07, size.width * 0.12, size.height * 0.07);
      path.cubicTo(size.width * 0.12, size.height * 0.07, size.width * 0.12, size.height * 1.07, size.width * 0.12, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 71
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.17, size.height * 1.07);
      path.cubicTo(size.width * 0.17, size.height * 1.07, size.width * 0.28, size.height * 1.07, size.width * 0.28, size.height * 1.07);
      path.cubicTo(size.width * 0.28, size.height * 1.07, size.width * 0.28, size.height * 0.07, size.width * 0.28, size.height * 0.07);
      path.cubicTo(size.width * 0.28, size.height * 0.07, size.width * 0.17, size.height * 0.07, size.width * 0.17, size.height * 0.07);
      path.cubicTo(size.width * 0.17, size.height * 0.07, size.width * 0.17, size.height * 1.07, size.width * 0.17, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 72
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.46, size.height * 1.07);
      path.cubicTo(size.width * 0.46, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.46, size.height * 0.07, size.width * 0.46, size.height * 0.07);
      path.cubicTo(size.width * 0.46, size.height * 0.07, size.width * 0.46, size.height * 1.07, size.width * 0.46, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 73
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.51, size.height * 1.07);
      path.cubicTo(size.width * 0.51, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.51, size.height * 0.07, size.width * 0.51, size.height * 0.07);
      path.cubicTo(size.width * 0.51, size.height * 0.07, size.width * 0.51, size.height * 1.07, size.width * 0.51, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 74
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.56, size.height * 1.07);
      path.cubicTo(size.width * 0.56, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.56, size.height * 0.07, size.width * 0.56, size.height * 0.07);
      path.cubicTo(size.width * 0.56, size.height * 0.07, size.width * 0.56, size.height * 1.07, size.width * 0.56, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 75
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.62, size.height * 1.07);
      path.cubicTo(size.width * 0.62, size.height * 1.07, size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 1.07);
      path.cubicTo(size.width * 0.05, size.height * 1.07, size.width * 0.05, size.height * 0.07, size.width * 0.05, size.height * 0.07);
      path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.62, size.height * 0.07, size.width * 0.62, size.height * 0.07);
      path.cubicTo(size.width * 0.62, size.height * 0.07, size.width * 0.62, size.height * 1.07, size.width * 0.62, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 76
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.68, size.height * 0.67);
      path.cubicTo(size.width * 0.69, size.height * 0.67, size.width * 0.7, size.height * 0.67, size.width * 0.72, size.height * 0.67);
      path.cubicTo(size.width * 0.72, size.height * 0.67, size.width * 0.72, size.height * 0.68, size.width * 0.72, size.height * 0.68);
      path.cubicTo(size.width * 0.72, size.height * 0.7, size.width * 0.72, size.height * 0.72, size.width * 0.72, size.height * 0.74);
      path.cubicTo(size.width * 0.72, size.height * 0.74, size.width * 0.72, size.height * 0.74, size.width * 0.72, size.height * 0.74);
      path.cubicTo(size.width * 0.7, size.height * 0.74, size.width * 0.69, size.height * 0.74, size.width * 0.68, size.height * 0.74);
      path.cubicTo(size.width * 0.68, size.height * 0.74, size.width * 0.68, size.height * 0.74, size.width * 0.68, size.height * 0.74);
      path.cubicTo(size.width * 0.68, size.height * 0.72, size.width * 0.68, size.height * 0.7, size.width * 0.68, size.height * 0.68);
      path.cubicTo(size.width * 0.68, size.height * 0.68, size.width * 0.68, size.height * 0.67, size.width * 0.68, size.height * 0.67);
      path.cubicTo(size.width * 0.68, size.height * 0.67, size.width * 0.68, size.height * 0.67, size.width * 0.68, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 77
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.72, size.height * 0.67);
      path.cubicTo(size.width * 0.74, size.height * 0.67, size.width * 0.75, size.height * 0.67, size.width * 0.76, size.height * 0.67);
      path.cubicTo(size.width * 0.76, size.height * 0.67, size.width * 0.76, size.height * 0.68, size.width * 0.76, size.height * 0.68);
      path.cubicTo(size.width * 0.76, size.height * 0.7, size.width * 0.76, size.height * 0.72, size.width * 0.76, size.height * 0.74);
      path.cubicTo(size.width * 0.76, size.height * 0.74, size.width * 0.76, size.height * 0.74, size.width * 0.76, size.height * 0.74);
      path.cubicTo(size.width * 0.75, size.height * 0.74, size.width * 0.74, size.height * 0.74, size.width * 0.72, size.height * 0.74);
      path.cubicTo(size.width * 0.72, size.height * 0.74, size.width * 0.72, size.height * 0.74, size.width * 0.72, size.height * 0.74);
      path.cubicTo(size.width * 0.72, size.height * 0.72, size.width * 0.72, size.height * 0.7, size.width * 0.72, size.height * 0.68);
      path.cubicTo(size.width * 0.72, size.height * 0.68, size.width * 0.72, size.height * 0.67, size.width * 0.72, size.height * 0.67);
      path.cubicTo(size.width * 0.72, size.height * 0.67, size.width * 0.72, size.height * 0.67, size.width * 0.72, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 78
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.77, size.height * 0.67);
      path.cubicTo(size.width * 0.78, size.height * 0.67, size.width * 0.79, size.height * 0.67, size.width * 0.8, size.height * 0.67);
      path.cubicTo(size.width * 0.81, size.height * 0.67, size.width * 0.81, size.height * 0.68, size.width * 0.81, size.height * 0.68);
      path.cubicTo(size.width * 0.81, size.height * 0.7, size.width * 0.81, size.height * 0.72, size.width * 0.81, size.height * 0.74);
      path.cubicTo(size.width * 0.81, size.height * 0.74, size.width * 0.8, size.height * 0.74, size.width * 0.8, size.height * 0.74);
      path.cubicTo(size.width * 0.79, size.height * 0.74, size.width * 0.78, size.height * 0.74, size.width * 0.77, size.height * 0.74);
      path.cubicTo(size.width * 0.77, size.height * 0.74, size.width * 0.77, size.height * 0.74, size.width * 0.77, size.height * 0.74);
      path.cubicTo(size.width * 0.77, size.height * 0.72, size.width * 0.77, size.height * 0.7, size.width * 0.77, size.height * 0.68);
      path.cubicTo(size.width * 0.77, size.height * 0.68, size.width * 0.77, size.height * 0.67, size.width * 0.77, size.height * 0.67);
      path.cubicTo(size.width * 0.77, size.height * 0.67, size.width * 0.77, size.height * 0.67, size.width * 0.77, size.height * 0.67);
      canvas.drawPath(path, paint);
  

      // Path number 79
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.68, size.height * 0.77);
      path.cubicTo(size.width * 0.69, size.height * 0.77, size.width * 0.7, size.height * 0.77, size.width * 0.72, size.height * 0.77);
      path.cubicTo(size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77);
      path.cubicTo(size.width * 0.72, size.height * 0.79, size.width * 0.72, size.height * 0.81, size.width * 0.72, size.height * 0.83);
      path.cubicTo(size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84);
      path.cubicTo(size.width * 0.7, size.height * 0.84, size.width * 0.69, size.height * 0.84, size.width * 0.68, size.height * 0.84);
      path.cubicTo(size.width * 0.68, size.height * 0.84, size.width * 0.68, size.height * 0.83, size.width * 0.68, size.height * 0.83);
      path.cubicTo(size.width * 0.68, size.height * 0.81, size.width * 0.68, size.height * 0.79, size.width * 0.68, size.height * 0.77);
      path.cubicTo(size.width * 0.68, size.height * 0.77, size.width * 0.68, size.height * 0.77, size.width * 0.68, size.height * 0.77);
      path.cubicTo(size.width * 0.68, size.height * 0.77, size.width * 0.68, size.height * 0.77, size.width * 0.68, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 80
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.72, size.height * 0.77);
      path.cubicTo(size.width * 0.74, size.height * 0.77, size.width * 0.75, size.height * 0.77, size.width * 0.76, size.height * 0.77);
      path.cubicTo(size.width * 0.76, size.height * 0.77, size.width * 0.76, size.height * 0.77, size.width * 0.76, size.height * 0.77);
      path.cubicTo(size.width * 0.76, size.height * 0.79, size.width * 0.76, size.height * 0.81, size.width * 0.76, size.height * 0.83);
      path.cubicTo(size.width * 0.76, size.height * 0.84, size.width * 0.76, size.height * 0.84, size.width * 0.76, size.height * 0.84);
      path.cubicTo(size.width * 0.75, size.height * 0.84, size.width * 0.74, size.height * 0.84, size.width * 0.72, size.height * 0.84);
      path.cubicTo(size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.83, size.width * 0.72, size.height * 0.83);
      path.cubicTo(size.width * 0.72, size.height * 0.81, size.width * 0.72, size.height * 0.79, size.width * 0.72, size.height * 0.77);
      path.cubicTo(size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77);
      path.cubicTo(size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77, size.width * 0.72, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 81
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.77, size.height * 0.77);
      path.cubicTo(size.width * 0.78, size.height * 0.77, size.width * 0.79, size.height * 0.77, size.width * 0.8, size.height * 0.77);
      path.cubicTo(size.width * 0.81, size.height * 0.77, size.width * 0.81, size.height * 0.77, size.width * 0.81, size.height * 0.77);
      path.cubicTo(size.width * 0.81, size.height * 0.79, size.width * 0.81, size.height * 0.81, size.width * 0.81, size.height * 0.83);
      path.cubicTo(size.width * 0.81, size.height * 0.84, size.width * 0.8, size.height * 0.84, size.width * 0.8, size.height * 0.84);
      path.cubicTo(size.width * 0.79, size.height * 0.84, size.width * 0.78, size.height * 0.84, size.width * 0.77, size.height * 0.84);
      path.cubicTo(size.width * 0.77, size.height * 0.84, size.width * 0.77, size.height * 0.83, size.width * 0.77, size.height * 0.83);
      path.cubicTo(size.width * 0.77, size.height * 0.81, size.width * 0.77, size.height * 0.79, size.width * 0.77, size.height * 0.77);
      path.cubicTo(size.width * 0.77, size.height * 0.77, size.width * 0.77, size.height * 0.77, size.width * 0.77, size.height * 0.77);
      path.cubicTo(size.width * 0.77, size.height * 0.77, size.width * 0.77, size.height * 0.77, size.width * 0.77, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 82
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.68, size.height * 0.84);
      path.cubicTo(size.width * 0.69, size.height * 0.84, size.width * 0.7, size.height * 0.84, size.width * 0.72, size.height * 0.84);
      path.cubicTo(size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.85, size.width * 0.72, size.height * 0.85);
      path.cubicTo(size.width * 0.72, size.height * 0.87, size.width * 0.72, size.height * 0.89, size.width * 0.72, size.height * 0.91);
      path.cubicTo(size.width * 0.72, size.height * 0.91, size.width * 0.72, size.height * 0.91, size.width * 0.72, size.height * 0.91);
      path.cubicTo(size.width * 0.7, size.height * 0.91, size.width * 0.69, size.height * 0.91, size.width * 0.68, size.height * 0.91);
      path.cubicTo(size.width * 0.68, size.height * 0.91, size.width * 0.68, size.height * 0.91, size.width * 0.68, size.height * 0.91);
      path.cubicTo(size.width * 0.68, size.height * 0.89, size.width * 0.68, size.height * 0.87, size.width * 0.68, size.height * 0.85);
      path.cubicTo(size.width * 0.68, size.height * 0.84, size.width * 0.68, size.height * 0.84, size.width * 0.68, size.height * 0.84);
      path.cubicTo(size.width * 0.68, size.height * 0.84, size.width * 0.68, size.height * 0.84, size.width * 0.68, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 83
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.72, size.height * 0.84);
      path.cubicTo(size.width * 0.74, size.height * 0.84, size.width * 0.75, size.height * 0.84, size.width * 0.76, size.height * 0.84);
      path.cubicTo(size.width * 0.76, size.height * 0.84, size.width * 0.76, size.height * 0.85, size.width * 0.76, size.height * 0.85);
      path.cubicTo(size.width * 0.76, size.height * 0.87, size.width * 0.76, size.height * 0.89, size.width * 0.76, size.height * 0.91);
      path.cubicTo(size.width * 0.76, size.height * 0.91, size.width * 0.76, size.height * 0.91, size.width * 0.76, size.height * 0.91);
      path.cubicTo(size.width * 0.75, size.height * 0.91, size.width * 0.74, size.height * 0.91, size.width * 0.72, size.height * 0.91);
      path.cubicTo(size.width * 0.72, size.height * 0.91, size.width * 0.72, size.height * 0.91, size.width * 0.72, size.height * 0.91);
      path.cubicTo(size.width * 0.72, size.height * 0.89, size.width * 0.72, size.height * 0.87, size.width * 0.72, size.height * 0.85);
      path.cubicTo(size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84);
      path.cubicTo(size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84, size.width * 0.72, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 84
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.77, size.height * 0.84);
      path.cubicTo(size.width * 0.78, size.height * 0.84, size.width * 0.79, size.height * 0.84, size.width * 0.8, size.height * 0.84);
      path.cubicTo(size.width * 0.81, size.height * 0.84, size.width * 0.81, size.height * 0.85, size.width * 0.81, size.height * 0.85);
      path.cubicTo(size.width * 0.81, size.height * 0.87, size.width * 0.81, size.height * 0.89, size.width * 0.81, size.height * 0.91);
      path.cubicTo(size.width * 0.81, size.height * 0.91, size.width * 0.8, size.height * 0.91, size.width * 0.8, size.height * 0.91);
      path.cubicTo(size.width * 0.79, size.height * 0.91, size.width * 0.78, size.height * 0.91, size.width * 0.77, size.height * 0.91);
      path.cubicTo(size.width * 0.77, size.height * 0.91, size.width * 0.77, size.height * 0.91, size.width * 0.77, size.height * 0.91);
      path.cubicTo(size.width * 0.77, size.height * 0.89, size.width * 0.77, size.height * 0.87, size.width * 0.77, size.height * 0.85);
      path.cubicTo(size.width * 0.77, size.height * 0.84, size.width * 0.77, size.height * 0.84, size.width * 0.77, size.height * 0.84);
      path.cubicTo(size.width * 0.77, size.height * 0.84, size.width * 0.77, size.height * 0.84, size.width * 0.77, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 85
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.72, size.height);
      path.cubicTo(size.width * 0.74, size.height, size.width * 0.75, size.height, size.width * 0.76, size.height);
      path.cubicTo(size.width * 0.76, size.height, size.width * 0.76, size.height, size.width * 0.76, size.height);
      path.cubicTo(size.width * 0.76, size.height * 1.02, size.width * 0.76, size.height * 1.04, size.width * 0.76, size.height * 1.06);
      path.cubicTo(size.width * 0.76, size.height * 1.06, size.width * 0.76, size.height * 1.06, size.width * 0.76, size.height * 1.06);
      path.cubicTo(size.width * 0.75, size.height * 1.06, size.width * 0.74, size.height * 1.06, size.width * 0.72, size.height * 1.06);
      path.cubicTo(size.width * 0.72, size.height * 1.06, size.width * 0.72, size.height * 1.06, size.width * 0.72, size.height * 1.06);
      path.cubicTo(size.width * 0.72, size.height * 1.04, size.width * 0.72, size.height * 1.02, size.width * 0.72, size.height);
      path.cubicTo(size.width * 0.72, size.height, size.width * 0.72, size.height, size.width * 0.72, size.height);
      path.cubicTo(size.width * 0.72, size.height, size.width * 0.72, size.height, size.width * 0.72, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 86
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.68, size.height * 1.07);
      path.cubicTo(size.width * 0.69, size.height * 1.07, size.width * 0.7, size.height * 1.07, size.width * 0.72, size.height * 1.07);
      path.cubicTo(size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07);
      path.cubicTo(size.width * 0.72, size.height * 1.09, size.width * 0.72, size.height * 1.11, size.width * 0.72, size.height * 1.13);
      path.cubicTo(size.width * 0.72, size.height * 1.14, size.width * 0.72, size.height * 1.14, size.width * 0.72, size.height * 1.14);
      path.cubicTo(size.width * 0.7, size.height * 1.14, size.width * 0.69, size.height * 1.14, size.width * 0.68, size.height * 1.14);
      path.cubicTo(size.width * 0.68, size.height * 1.14, size.width * 0.68, size.height * 1.13, size.width * 0.68, size.height * 1.13);
      path.cubicTo(size.width * 0.68, size.height * 1.11, size.width * 0.68, size.height * 1.09, size.width * 0.68, size.height * 1.07);
      path.cubicTo(size.width * 0.68, size.height * 1.07, size.width * 0.68, size.height * 1.07, size.width * 0.68, size.height * 1.07);
      path.cubicTo(size.width * 0.68, size.height * 1.07, size.width * 0.68, size.height * 1.07, size.width * 0.68, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 87
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.72, size.height * 1.07);
      path.cubicTo(size.width * 0.74, size.height * 1.07, size.width * 0.75, size.height * 1.07, size.width * 0.76, size.height * 1.07);
      path.cubicTo(size.width * 0.76, size.height * 1.07, size.width * 0.76, size.height * 1.07, size.width * 0.76, size.height * 1.07);
      path.cubicTo(size.width * 0.76, size.height * 1.09, size.width * 0.76, size.height * 1.11, size.width * 0.76, size.height * 1.13);
      path.cubicTo(size.width * 0.76, size.height * 1.14, size.width * 0.76, size.height * 1.14, size.width * 0.76, size.height * 1.14);
      path.cubicTo(size.width * 0.75, size.height * 1.14, size.width * 0.74, size.height * 1.14, size.width * 0.72, size.height * 1.14);
      path.cubicTo(size.width * 0.72, size.height * 1.14, size.width * 0.72, size.height * 1.13, size.width * 0.72, size.height * 1.13);
      path.cubicTo(size.width * 0.72, size.height * 1.11, size.width * 0.72, size.height * 1.09, size.width * 0.72, size.height * 1.07);
      path.cubicTo(size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07);
      path.cubicTo(size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07, size.width * 0.72, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 88
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.77, size.height * 1.07);
      path.cubicTo(size.width * 0.78, size.height * 1.07, size.width * 0.79, size.height * 1.07, size.width * 0.8, size.height * 1.07);
      path.cubicTo(size.width * 0.81, size.height * 1.07, size.width * 0.81, size.height * 1.07, size.width * 0.81, size.height * 1.07);
      path.cubicTo(size.width * 0.81, size.height * 1.09, size.width * 0.81, size.height * 1.11, size.width * 0.81, size.height * 1.13);
      path.cubicTo(size.width * 0.81, size.height * 1.14, size.width * 0.8, size.height * 1.14, size.width * 0.8, size.height * 1.14);
      path.cubicTo(size.width * 0.79, size.height * 1.14, size.width * 0.78, size.height * 1.14, size.width * 0.77, size.height * 1.14);
      path.cubicTo(size.width * 0.77, size.height * 1.14, size.width * 0.77, size.height * 1.13, size.width * 0.77, size.height * 1.13);
      path.cubicTo(size.width * 0.77, size.height * 1.11, size.width * 0.77, size.height * 1.09, size.width * 0.77, size.height * 1.07);
      path.cubicTo(size.width * 0.77, size.height * 1.07, size.width * 0.77, size.height * 1.07, size.width * 0.77, size.height * 1.07);
      path.cubicTo(size.width * 0.77, size.height * 1.07, size.width * 0.77, size.height * 1.07, size.width * 0.77, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 89
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height * 0.77);
      path.cubicTo(size.width * 0.83, size.height * 0.77, size.width * 0.85, size.height * 0.77, size.width * 0.86, size.height * 0.77);
      path.cubicTo(size.width * 0.86, size.height * 0.77, size.width * 0.86, size.height * 0.77, size.width * 0.86, size.height * 0.77);
      path.cubicTo(size.width * 0.86, size.height * 0.79, size.width * 0.86, size.height * 0.81, size.width * 0.86, size.height * 0.83);
      path.cubicTo(size.width * 0.86, size.height * 0.84, size.width * 0.86, size.height * 0.84, size.width * 0.86, size.height * 0.84);
      path.cubicTo(size.width * 0.85, size.height * 0.84, size.width * 0.83, size.height * 0.84, size.width * 0.82, size.height * 0.84);
      path.cubicTo(size.width * 0.82, size.height * 0.84, size.width * 0.82, size.height * 0.83, size.width * 0.82, size.height * 0.83);
      path.cubicTo(size.width * 0.82, size.height * 0.81, size.width * 0.82, size.height * 0.79, size.width * 0.82, size.height * 0.77);
      path.cubicTo(size.width * 0.82, size.height * 0.77, size.width * 0.82, size.height * 0.77, size.width * 0.82, size.height * 0.77);
      path.cubicTo(size.width * 0.82, size.height * 0.77, size.width * 0.82, size.height * 0.77, size.width * 0.82, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 90
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.87, size.height * 0.77);
      path.cubicTo(size.width * 0.88, size.height * 0.77, size.width * 0.89, size.height * 0.77, size.width * 0.9, size.height * 0.77);
      path.cubicTo(size.width * 0.9, size.height * 0.77, size.width * 0.9, size.height * 0.77, size.width * 0.9, size.height * 0.77);
      path.cubicTo(size.width * 0.9, size.height * 0.79, size.width * 0.9, size.height * 0.81, size.width * 0.9, size.height * 0.83);
      path.cubicTo(size.width * 0.9, size.height * 0.84, size.width * 0.9, size.height * 0.84, size.width * 0.9, size.height * 0.84);
      path.cubicTo(size.width * 0.89, size.height * 0.84, size.width * 0.88, size.height * 0.84, size.width * 0.87, size.height * 0.84);
      path.cubicTo(size.width * 0.86, size.height * 0.84, size.width * 0.86, size.height * 0.83, size.width * 0.86, size.height * 0.83);
      path.cubicTo(size.width * 0.86, size.height * 0.81, size.width * 0.86, size.height * 0.79, size.width * 0.86, size.height * 0.77);
      path.cubicTo(size.width * 0.86, size.height * 0.77, size.width * 0.86, size.height * 0.77, size.width * 0.87, size.height * 0.77);
      path.cubicTo(size.width * 0.87, size.height * 0.77, size.width * 0.87, size.height * 0.77, size.width * 0.87, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 91
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.91, size.height * 0.77);
      path.cubicTo(size.width * 0.92, size.height * 0.77, size.width * 0.93, size.height * 0.77, size.width * 0.94, size.height * 0.77);
      path.cubicTo(size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77);
      path.cubicTo(size.width * 0.95, size.height * 0.79, size.width * 0.95, size.height * 0.81, size.width * 0.95, size.height * 0.83);
      path.cubicTo(size.width * 0.95, size.height * 0.84, size.width * 0.94, size.height * 0.84, size.width * 0.94, size.height * 0.84);
      path.cubicTo(size.width * 0.93, size.height * 0.84, size.width * 0.92, size.height * 0.84, size.width * 0.91, size.height * 0.84);
      path.cubicTo(size.width * 0.91, size.height * 0.84, size.width * 0.91, size.height * 0.83, size.width * 0.91, size.height * 0.83);
      path.cubicTo(size.width * 0.91, size.height * 0.81, size.width * 0.91, size.height * 0.79, size.width * 0.91, size.height * 0.77);
      path.cubicTo(size.width * 0.91, size.height * 0.77, size.width * 0.91, size.height * 0.77, size.width * 0.91, size.height * 0.77);
      path.cubicTo(size.width * 0.91, size.height * 0.77, size.width * 0.91, size.height * 0.77, size.width * 0.91, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 92
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.95, size.height * 0.77);
      path.cubicTo(size.width * 0.96, size.height * 0.77, size.width * 0.98, size.height * 0.77, size.width, size.height * 0.77);
      path.cubicTo(size.width, size.height * 0.77, size.width, size.height * 0.77, size.width, size.height * 0.77);
      path.cubicTo(size.width, size.height * 0.79, size.width, size.height * 0.81, size.width, size.height * 0.83);
      path.cubicTo(size.width, size.height * 0.84, size.width, size.height * 0.84, size.width, size.height * 0.84);
      path.cubicTo(size.width * 0.98, size.height * 0.84, size.width * 0.96, size.height * 0.84, size.width * 0.95, size.height * 0.84);
      path.cubicTo(size.width * 0.95, size.height * 0.84, size.width * 0.95, size.height * 0.83, size.width * 0.95, size.height * 0.83);
      path.cubicTo(size.width * 0.95, size.height * 0.81, size.width * 0.95, size.height * 0.79, size.width * 0.95, size.height * 0.77);
      path.cubicTo(size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77);
      path.cubicTo(size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77, size.width * 0.95, size.height * 0.77);
      canvas.drawPath(path, paint);
  

      // Path number 93
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height * 0.84);
      path.cubicTo(size.width * 0.83, size.height * 0.84, size.width * 0.85, size.height * 0.84, size.width * 0.86, size.height * 0.84);
      path.cubicTo(size.width * 0.86, size.height * 0.84, size.width * 0.86, size.height * 0.85, size.width * 0.86, size.height * 0.85);
      path.cubicTo(size.width * 0.86, size.height * 0.87, size.width * 0.86, size.height * 0.89, size.width * 0.86, size.height * 0.91);
      path.cubicTo(size.width * 0.86, size.height * 0.91, size.width * 0.86, size.height * 0.91, size.width * 0.86, size.height * 0.91);
      path.cubicTo(size.width * 0.85, size.height * 0.91, size.width * 0.83, size.height * 0.91, size.width * 0.82, size.height * 0.91);
      path.cubicTo(size.width * 0.82, size.height * 0.91, size.width * 0.82, size.height * 0.91, size.width * 0.82, size.height * 0.91);
      path.cubicTo(size.width * 0.82, size.height * 0.89, size.width * 0.82, size.height * 0.87, size.width * 0.82, size.height * 0.85);
      path.cubicTo(size.width * 0.82, size.height * 0.84, size.width * 0.82, size.height * 0.84, size.width * 0.82, size.height * 0.84);
      path.cubicTo(size.width * 0.82, size.height * 0.84, size.width * 0.82, size.height * 0.84, size.width * 0.82, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 94
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.87, size.height * 0.84);
      path.cubicTo(size.width * 0.88, size.height * 0.84, size.width * 0.89, size.height * 0.84, size.width * 0.9, size.height * 0.84);
      path.cubicTo(size.width * 0.9, size.height * 0.84, size.width * 0.9, size.height * 0.85, size.width * 0.9, size.height * 0.85);
      path.cubicTo(size.width * 0.9, size.height * 0.87, size.width * 0.9, size.height * 0.89, size.width * 0.9, size.height * 0.91);
      path.cubicTo(size.width * 0.9, size.height * 0.91, size.width * 0.9, size.height * 0.91, size.width * 0.9, size.height * 0.91);
      path.cubicTo(size.width * 0.89, size.height * 0.91, size.width * 0.88, size.height * 0.91, size.width * 0.87, size.height * 0.91);
      path.cubicTo(size.width * 0.86, size.height * 0.91, size.width * 0.86, size.height * 0.91, size.width * 0.86, size.height * 0.91);
      path.cubicTo(size.width * 0.86, size.height * 0.89, size.width * 0.86, size.height * 0.87, size.width * 0.86, size.height * 0.85);
      path.cubicTo(size.width * 0.86, size.height * 0.84, size.width * 0.86, size.height * 0.84, size.width * 0.87, size.height * 0.84);
      path.cubicTo(size.width * 0.87, size.height * 0.84, size.width * 0.87, size.height * 0.84, size.width * 0.87, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 95
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.91, size.height * 0.84);
      path.cubicTo(size.width * 0.92, size.height * 0.84, size.width * 0.93, size.height * 0.84, size.width * 0.94, size.height * 0.84);
      path.cubicTo(size.width * 0.95, size.height * 0.84, size.width * 0.95, size.height * 0.85, size.width * 0.95, size.height * 0.85);
      path.cubicTo(size.width * 0.95, size.height * 0.87, size.width * 0.95, size.height * 0.89, size.width * 0.95, size.height * 0.91);
      path.cubicTo(size.width * 0.95, size.height * 0.91, size.width * 0.94, size.height * 0.91, size.width * 0.94, size.height * 0.91);
      path.cubicTo(size.width * 0.93, size.height * 0.91, size.width * 0.92, size.height * 0.91, size.width * 0.91, size.height * 0.91);
      path.cubicTo(size.width * 0.91, size.height * 0.91, size.width * 0.91, size.height * 0.91, size.width * 0.91, size.height * 0.91);
      path.cubicTo(size.width * 0.91, size.height * 0.89, size.width * 0.91, size.height * 0.87, size.width * 0.91, size.height * 0.85);
      path.cubicTo(size.width * 0.91, size.height * 0.84, size.width * 0.91, size.height * 0.84, size.width * 0.91, size.height * 0.84);
      path.cubicTo(size.width * 0.91, size.height * 0.84, size.width * 0.91, size.height * 0.84, size.width * 0.91, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 96
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.95, size.height * 0.84);
      path.cubicTo(size.width * 0.96, size.height * 0.84, size.width * 0.98, size.height * 0.84, size.width, size.height * 0.84);
      path.cubicTo(size.width, size.height * 0.84, size.width, size.height * 0.85, size.width, size.height * 0.85);
      path.cubicTo(size.width, size.height * 0.9, size.width, size.height * 0.94, size.width, size.height * 0.98);
      path.cubicTo(size.width, size.height, size.width, size.height, size.width, size.height);
      path.cubicTo(size.width * 0.98, size.height, size.width * 0.96, size.height, size.width * 0.95, size.height);
      path.cubicTo(size.width * 0.95, size.height, size.width * 0.95, size.height * 0.98, size.width * 0.95, size.height * 0.98);
      path.cubicTo(size.width * 0.95, size.height * 0.93, size.width * 0.95, size.height * 0.89, size.width * 0.95, size.height * 0.85);
      path.cubicTo(size.width * 0.95, size.height * 0.85, size.width * 0.95, size.height * 0.84, size.width * 0.95, size.height * 0.84);
      path.cubicTo(size.width * 0.95, size.height * 0.84, size.width * 0.95, size.height * 0.84, size.width * 0.95, size.height * 0.84);
      canvas.drawPath(path, paint);
  

      // Path number 97
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height * 0.92);
      path.cubicTo(size.width * 0.83, size.height * 0.92, size.width * 0.85, size.height * 0.92, size.width * 0.86, size.height * 0.92);
      path.cubicTo(size.width * 0.86, size.height * 0.92, size.width * 0.86, size.height * 0.92, size.width * 0.86, size.height * 0.92);
      path.cubicTo(size.width * 0.86, size.height * 0.94, size.width * 0.86, size.height * 0.96, size.width * 0.86, size.height * 0.98);
      path.cubicTo(size.width * 0.86, size.height, size.width * 0.86, size.height, size.width * 0.86, size.height);
      path.cubicTo(size.width * 0.85, size.height, size.width * 0.83, size.height, size.width * 0.82, size.height);
      path.cubicTo(size.width * 0.82, size.height, size.width * 0.82, size.height * 0.98, size.width * 0.82, size.height * 0.98);
      path.cubicTo(size.width * 0.82, size.height * 0.96, size.width * 0.82, size.height * 0.94, size.width * 0.82, size.height * 0.92);
      path.cubicTo(size.width * 0.82, size.height * 0.92, size.width * 0.82, size.height * 0.92, size.width * 0.82, size.height * 0.92);
      path.cubicTo(size.width * 0.82, size.height * 0.92, size.width * 0.82, size.height * 0.92, size.width * 0.82, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 98
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.87, size.height * 0.92);
      path.cubicTo(size.width * 0.88, size.height * 0.92, size.width * 0.89, size.height * 0.92, size.width * 0.9, size.height * 0.92);
      path.cubicTo(size.width * 0.9, size.height * 0.92, size.width * 0.9, size.height * 0.92, size.width * 0.9, size.height * 0.92);
      path.cubicTo(size.width * 0.9, size.height * 0.94, size.width * 0.9, size.height * 0.96, size.width * 0.9, size.height * 0.98);
      path.cubicTo(size.width * 0.9, size.height, size.width * 0.9, size.height, size.width * 0.9, size.height);
      path.cubicTo(size.width * 0.89, size.height, size.width * 0.88, size.height, size.width * 0.87, size.height);
      path.cubicTo(size.width * 0.86, size.height, size.width * 0.86, size.height * 0.98, size.width * 0.86, size.height * 0.98);
      path.cubicTo(size.width * 0.86, size.height * 0.96, size.width * 0.86, size.height * 0.94, size.width * 0.86, size.height * 0.92);
      path.cubicTo(size.width * 0.86, size.height * 0.92, size.width * 0.86, size.height * 0.92, size.width * 0.87, size.height * 0.92);
      path.cubicTo(size.width * 0.87, size.height * 0.92, size.width * 0.87, size.height * 0.92, size.width * 0.87, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 99
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.91, size.height * 0.92);
      path.cubicTo(size.width * 0.92, size.height * 0.92, size.width * 0.93, size.height * 0.92, size.width * 0.94, size.height * 0.92);
      path.cubicTo(size.width * 0.95, size.height * 0.92, size.width * 0.95, size.height * 0.92, size.width * 0.95, size.height * 0.92);
      path.cubicTo(size.width * 0.95, size.height * 0.94, size.width * 0.95, size.height * 0.96, size.width * 0.95, size.height * 0.98);
      path.cubicTo(size.width * 0.95, size.height, size.width * 0.94, size.height, size.width * 0.94, size.height);
      path.cubicTo(size.width * 0.93, size.height, size.width * 0.92, size.height, size.width * 0.91, size.height);
      path.cubicTo(size.width * 0.91, size.height, size.width * 0.91, size.height * 0.98, size.width * 0.91, size.height * 0.98);
      path.cubicTo(size.width * 0.91, size.height * 0.96, size.width * 0.91, size.height * 0.94, size.width * 0.91, size.height * 0.92);
      path.cubicTo(size.width * 0.91, size.height * 0.92, size.width * 0.91, size.height * 0.92, size.width * 0.91, size.height * 0.92);
      path.cubicTo(size.width * 0.91, size.height * 0.92, size.width * 0.91, size.height * 0.92, size.width * 0.91, size.height * 0.92);
      canvas.drawPath(path, paint);
  

      // Path number 100
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height);
      path.cubicTo(size.width * 0.83, size.height, size.width * 0.85, size.height, size.width * 0.86, size.height);
      path.cubicTo(size.width * 0.86, size.height, size.width * 0.86, size.height, size.width * 0.86, size.height);
      path.cubicTo(size.width * 0.86, size.height * 1.02, size.width * 0.86, size.height * 1.04, size.width * 0.86, size.height * 1.06);
      path.cubicTo(size.width * 0.86, size.height * 1.06, size.width * 0.86, size.height * 1.06, size.width * 0.86, size.height * 1.06);
      path.cubicTo(size.width * 0.85, size.height * 1.06, size.width * 0.83, size.height * 1.06, size.width * 0.82, size.height * 1.06);
      path.cubicTo(size.width * 0.82, size.height * 1.06, size.width * 0.82, size.height * 1.06, size.width * 0.82, size.height * 1.06);
      path.cubicTo(size.width * 0.82, size.height * 1.04, size.width * 0.82, size.height * 1.02, size.width * 0.82, size.height);
      path.cubicTo(size.width * 0.82, size.height, size.width * 0.82, size.height, size.width * 0.82, size.height);
      path.cubicTo(size.width * 0.82, size.height, size.width * 0.82, size.height, size.width * 0.82, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 101
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.87, size.height);
      path.cubicTo(size.width * 0.88, size.height, size.width * 0.89, size.height, size.width * 0.9, size.height);
      path.cubicTo(size.width * 0.9, size.height, size.width * 0.9, size.height, size.width * 0.9, size.height);
      path.cubicTo(size.width * 0.9, size.height * 1.02, size.width * 0.9, size.height * 1.04, size.width * 0.9, size.height * 1.06);
      path.cubicTo(size.width * 0.9, size.height * 1.06, size.width * 0.9, size.height * 1.06, size.width * 0.9, size.height * 1.06);
      path.cubicTo(size.width * 0.89, size.height * 1.06, size.width * 0.88, size.height * 1.06, size.width * 0.87, size.height * 1.06);
      path.cubicTo(size.width * 0.86, size.height * 1.06, size.width * 0.86, size.height * 1.06, size.width * 0.86, size.height * 1.06);
      path.cubicTo(size.width * 0.86, size.height * 1.04, size.width * 0.86, size.height * 1.02, size.width * 0.86, size.height);
      path.cubicTo(size.width * 0.86, size.height, size.width * 0.86, size.height, size.width * 0.87, size.height);
      path.cubicTo(size.width * 0.87, size.height, size.width * 0.87, size.height, size.width * 0.87, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 102
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.91, size.height);
      path.cubicTo(size.width * 0.92, size.height, size.width * 0.93, size.height, size.width * 0.94, size.height);
      path.cubicTo(size.width * 0.95, size.height, size.width * 0.95, size.height, size.width * 0.95, size.height);
      path.cubicTo(size.width * 0.95, size.height * 1.02, size.width * 0.95, size.height * 1.04, size.width * 0.95, size.height * 1.06);
      path.cubicTo(size.width * 0.95, size.height * 1.06, size.width * 0.94, size.height * 1.06, size.width * 0.94, size.height * 1.06);
      path.cubicTo(size.width * 0.93, size.height * 1.06, size.width * 0.92, size.height * 1.06, size.width * 0.91, size.height * 1.06);
      path.cubicTo(size.width * 0.91, size.height * 1.06, size.width * 0.91, size.height * 1.06, size.width * 0.91, size.height * 1.06);
      path.cubicTo(size.width * 0.91, size.height * 1.04, size.width * 0.91, size.height * 1.02, size.width * 0.91, size.height);
      path.cubicTo(size.width * 0.91, size.height, size.width * 0.91, size.height, size.width * 0.91, size.height);
      path.cubicTo(size.width * 0.91, size.height, size.width * 0.91, size.height, size.width * 0.91, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 103
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.95, size.height);
      path.cubicTo(size.width * 0.96, size.height, size.width * 0.98, size.height, size.width, size.height);
      path.cubicTo(size.width, size.height, size.width, size.height, size.width, size.height);
      path.cubicTo(size.width, size.height * 1.05, size.width, size.height * 1.09, size.width, size.height * 1.13);
      path.cubicTo(size.width, size.height * 1.14, size.width, size.height * 1.14, size.width, size.height * 1.14);
      path.cubicTo(size.width * 0.98, size.height * 1.14, size.width * 0.96, size.height * 1.14, size.width * 0.95, size.height * 1.14);
      path.cubicTo(size.width * 0.95, size.height * 1.14, size.width * 0.95, size.height * 1.13, size.width * 0.95, size.height * 1.13);
      path.cubicTo(size.width * 0.95, size.height * 1.08, size.width * 0.95, size.height * 1.04, size.width * 0.95, size.height);
      path.cubicTo(size.width * 0.95, size.height, size.width * 0.95, size.height, size.width * 0.95, size.height);
      path.cubicTo(size.width * 0.95, size.height, size.width * 0.95, size.height, size.width * 0.95, size.height);
      canvas.drawPath(path, paint);
  

      // Path number 104
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height * 1.07);
      path.cubicTo(size.width * 0.85, size.height * 1.07, size.width * 0.87, size.height * 1.07, size.width * 0.9, size.height * 1.07);
      path.cubicTo(size.width * 0.9, size.height * 1.07, size.width * 0.9, size.height * 1.07, size.width * 0.9, size.height * 1.07);
      path.cubicTo(size.width * 0.9, size.height * 1.09, size.width * 0.9, size.height * 1.11, size.width * 0.9, size.height * 1.13);
      path.cubicTo(size.width * 0.9, size.height * 1.14, size.width * 0.9, size.height * 1.14, size.width * 0.9, size.height * 1.14);
      path.cubicTo(size.width * 0.87, size.height * 1.14, size.width * 0.85, size.height * 1.14, size.width * 0.82, size.height * 1.14);
      path.cubicTo(size.width * 0.82, size.height * 1.14, size.width * 0.82, size.height * 1.13, size.width * 0.82, size.height * 1.13);
      path.cubicTo(size.width * 0.82, size.height * 1.11, size.width * 0.82, size.height * 1.09, size.width * 0.82, size.height * 1.07);
      path.cubicTo(size.width * 0.82, size.height * 1.07, size.width * 0.82, size.height * 1.07, size.width * 0.82, size.height * 1.07);
      path.cubicTo(size.width * 0.82, size.height * 1.07, size.width * 0.82, size.height * 1.07, size.width * 0.82, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 105
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.91, size.height * 1.07);
      path.cubicTo(size.width * 0.92, size.height * 1.07, size.width * 0.93, size.height * 1.07, size.width * 0.94, size.height * 1.07);
      path.cubicTo(size.width * 0.95, size.height * 1.07, size.width * 0.95, size.height * 1.07, size.width * 0.95, size.height * 1.07);
      path.cubicTo(size.width * 0.95, size.height * 1.09, size.width * 0.95, size.height * 1.11, size.width * 0.95, size.height * 1.13);
      path.cubicTo(size.width * 0.95, size.height * 1.14, size.width * 0.94, size.height * 1.14, size.width * 0.94, size.height * 1.14);
      path.cubicTo(size.width * 0.93, size.height * 1.14, size.width * 0.92, size.height * 1.14, size.width * 0.91, size.height * 1.14);
      path.cubicTo(size.width * 0.91, size.height * 1.14, size.width * 0.91, size.height * 1.13, size.width * 0.91, size.height * 1.13);
      path.cubicTo(size.width * 0.91, size.height * 1.11, size.width * 0.91, size.height * 1.09, size.width * 0.91, size.height * 1.07);
      path.cubicTo(size.width * 0.91, size.height * 1.07, size.width * 0.91, size.height * 1.07, size.width * 0.91, size.height * 1.07);
      path.cubicTo(size.width * 0.91, size.height * 1.07, size.width * 0.91, size.height * 1.07, size.width * 0.91, size.height * 1.07);
      canvas.drawPath(path, paint);
  

      // Path number 106
  

      paint.color = Color(0xffffffff).withOpacity(0);
      path = Path();
      path.lineTo(size.width * 0.82, size.height * 0.01);
      path.cubicTo(size.width * 0.82, size.height * 0.01, size.width * 0.17, size.height * 0.01, size.width * 0.17, size.height * 0.01);
      path.cubicTo(size.width * 0.17, size.height * 0.01, size.width * 0.17, size.height * 0.07, size.width * 0.17, size.height * 0.07);
      path.cubicTo(size.width * 0.17, size.height * 0.07, size.width * 0.82, size.height * 0.07, size.width * 0.82, size.height * 0.07);
      path.cubicTo(size.width * 0.82, size.height * 0.07, size.width * 0.82, size.height * 0.01, size.width * 0.82, size.height * 0.01);
      canvas.drawPath(path, paint);
    }
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
  }
