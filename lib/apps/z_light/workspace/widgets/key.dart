import 'package:flutter/material.dart';

/// KeyCustomPainter is a reference to a custom key layout.
///
/// Although it is not imported anywhere in the project, it was written as
/// an initial proof of concept which served as a guide to the current code
/// setup for the keyboard rendering.
class KeyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var rect = ui.Offset.zero & size;
    // canvas.clipRect(rect);

    // Paint paint_0_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009211208;
    // paint_0_stroke.color = Color.fromARGB(255, 22, 180, 62).withOpacity(1);
    // paint_0_stroke.strokeCap = StrokeCap.round;
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.002653339, size.height * -0.04052338,
    //             size.width * 0.9990597, size.height * 0.9968769),
    //         bottomRight: Radius.circular(size.width * 0.007771956),
    //         bottomLeft: Radius.circular(size.width * 0.007771956),
    //         topLeft: Radius.circular(size.width * 0.007771956),
    //         topRight: Radius.circular(size.width * 0.007771956)),
    //     paint_0_stroke);

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color.fromARGB(255, 76, 22, 163).withOpacity(1);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.002653339, size.height * -0.04052338,
    //             size.width * 0.9990597, size.height * 0.9968769),
    //         bottomRight: Radius.circular(size.width * 0.007771956),
    //         bottomLeft: Radius.circular(size.width * 0.007771956),
    //         topLeft: Radius.circular(size.width * 0.007771956),
    //         topRight: Radius.circular(size.width * 0.007771956)),
    //     paint_0_fill);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009211208;
    paint_1_stroke.color = Color.fromARGB(255, 201, 89, 89).withOpacity(1);
    paint_1_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_1_stroke);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_2_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_2_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1043067, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_2_stroke);

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_3_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_3_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1474861, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_3_stroke);

    Paint paint_4_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_4_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_4_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1906656, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_4_stroke);

    Paint paint_5_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_5_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_5_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2338450, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_5_stroke);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_6_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_6_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2986056, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_6_stroke);

    Paint paint_7_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_7_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_7_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3417850, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_7_stroke);

    Paint paint_8_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_8_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_8_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3849645, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_8_stroke);

    Paint paint_9_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_9_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_9_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4281439, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_9_stroke);

    Paint paint_10_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_10_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_10_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4929045, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_10_stroke);

    Paint paint_11_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_11_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_11_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5360839, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_11_stroke);

    Paint paint_12_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_12_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_12_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5792634, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_12_stroke);

    Paint paint_13_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_13_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_13_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6224429, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_13_stroke);

    Paint paint_14_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_14_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_14_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_14_stroke);

    Paint paint_15_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_15_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_15_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.06113107, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_15_stroke);

    Paint paint_16_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_16_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_16_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1043105, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_16_stroke);

    Paint paint_17_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_17_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_17_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1474900, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_17_stroke);

    Paint paint_18_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_18_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_18_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1906694, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_18_stroke);

    Paint paint_19_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_19_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_19_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2338489, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_19_stroke);

    Paint paint_20_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_20_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_20_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2770283, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_20_stroke);

    Paint paint_21_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_21_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_21_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3202078, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_21_stroke);

    Paint paint_22_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_22_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_22_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3633872, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_22_stroke);

    Paint paint_23_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_23_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_23_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4065667, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_23_stroke);

    Paint paint_24_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_24_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_24_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4497461, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_24_stroke);

    Paint paint_25_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_25_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_25_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4929256, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_25_stroke);

    Paint paint_26_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_26_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_26_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5361051, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_26_stroke);

    Paint paint_27_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_27_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_27_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5792851, size.height * 1.486105,
                size.width * 0.08232708, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_27_stroke);

    Paint paint_28_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_28_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_28_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.630892,
                size.width * 0.06137159, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_28_stroke);

    Paint paint_29_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_29_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_29_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.08335119, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_29_stroke);

    Paint paint_30_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_30_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_30_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1265306, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_30_stroke);

    Paint paint_31_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_31_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_31_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1697101, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_31_stroke);

    Paint paint_32_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_32_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_32_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2128895, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_32_stroke);

    Paint paint_33_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_33_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_33_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2560690, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_33_stroke);

    Paint paint_34_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_34_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_34_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2992485, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_34_stroke);

    Paint paint_35_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_35_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_35_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3424279, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_35_stroke);

    Paint paint_36_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_36_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_36_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3856074, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_36_stroke);

    Paint paint_37_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_37_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_37_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4287868, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_37_stroke);

    Paint paint_38_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_38_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_38_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4719663, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_38_stroke);

    Paint paint_39_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_39_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_39_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5151457, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_39_stroke);

    Paint paint_40_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_40_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_40_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5583258, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_40_stroke);

    Paint paint_41_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_41_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_41_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6015046, size.height * 1.630892,
                size.width * 0.06010505, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_41_stroke);

    Paint paint_42_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_42_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_42_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.775680,
                size.width * 0.07202205, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_42_stroke);

    Paint paint_43_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_43_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_43_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.09400165, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_43_stroke);

    Paint paint_44_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_44_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_44_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1371811, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_44_stroke);

    Paint paint_45_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_45_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_45_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1803606, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_45_stroke);

    Paint paint_46_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_46_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_46_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2235400, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_46_stroke);

    Paint paint_47_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_47_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_47_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2667195, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_47_stroke);

    Paint paint_48_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_48_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_48_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3098989, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_48_stroke);

    Paint paint_49_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_49_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_49_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3530784, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_49_stroke);

    Paint paint_50_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_50_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_50_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3962578, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_50_stroke);

    Paint paint_51_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_51_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_51_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4394379, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_51_stroke);

    Paint paint_52_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_52_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_52_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4826174, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_52_stroke);

    Paint paint_53_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_53_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_53_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5257968, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_53_stroke);

    Paint paint_54_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint_54_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_54_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5689763, size.height * 1.775680,
                size.width * 0.09263212, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_54_stroke);

    Paint paint_55_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_55_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_55_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.920468,
                size.width * 0.09361081, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_55_stroke);

    Paint paint_56_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_56_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_56_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1155904, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_56_stroke);

    Paint paint_57_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_57_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_57_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1587699, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_57_stroke);

    Paint paint_58_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_58_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_58_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2019493, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_58_stroke);

    Paint paint_59_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_59_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_59_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2451288, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_59_stroke);

    Paint paint_60_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_60_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_60_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2883082, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_60_stroke);

    Paint paint_61_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_61_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_61_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3314877, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_61_stroke);

    Paint paint_62_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_62_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_62_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3746671, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_62_stroke);

    Paint paint_63_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_63_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_63_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4178466, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_63_stroke);

    Paint paint_64_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_64_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_64_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4610267, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_64_stroke);

    Paint paint_65_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_65_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_65_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5042061, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_65_stroke);

    Paint paint_66_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_66_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_66_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5473856, size.height * 1.920468,
                size.width * 0.1142209, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_66_stroke);

    Paint paint_67_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_67_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_67_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_67_stroke);

    Paint paint_68_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_68_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_68_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.06976658, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_68_stroke);

    Paint paint_69_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_69_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_69_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1215815, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_69_stroke);

    Paint paint_70_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_70_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_70_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1733965, size.height * 2.065255,
                size.width * 0.2809437, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_70_stroke);

    Paint paint_71_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_71_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_71_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4583625, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_71_stroke);

    Paint paint_72_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_72_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_72_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5101774, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_72_stroke);

    Paint paint_73_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_73_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_73_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5619924, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_73_stroke);

    Paint paint_74_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint_74_stroke.color = Color(0xffbababa).withOpacity(1);
    paint_74_stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6138054, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint_74_stroke);

    // Path path_75 = Path();
    // path_75.moveTo(size.width * 0.6784962, size.height * 1.303571);
    // path_75.lineTo(size.width * 0.7144078, size.height * 1.303571);
    // path_75.cubicTo(
    //     size.width * 0.7159590,
    //     size.height * 1.303524,
    //     size.width * 0.7161068,
    //     size.height * 1.309174,
    //     size.width * 0.7159999,
    //     size.height * 1.313091);
    // path_75.lineTo(size.width * 0.7159999, size.height * 1.429417);
    // path_75.cubicTo(
    //     size.width * 0.7160140,
    //     size.height * 1.434622,
    //     size.width * 0.7143304,
    //     size.height * 1.435118,
    //     size.width * 0.7131630,
    //     size.height * 1.434760);
    // path_75.lineTo(size.width * 0.6784962, size.height * 1.434760);
    // path_75.cubicTo(
    //     size.width * 0.6769451,
    //     size.height * 1.434807,
    //     size.width * 0.6767979,
    //     size.height * 1.429157,
    //     size.width * 0.6769041,
    //     size.height * 1.425240);
    // path_75.lineTo(size.width * 0.6769041, size.height * 1.308915);
    // path_75.cubicTo(
    //     size.width * 0.6768836,
    //     size.height * 1.306040,
    //     size.width * 0.6776404,
    //     size.height * 1.303503,
    //     size.width * 0.6784969,
    //     size.height * 1.303571);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7216738, size.height * 1.303479);
    // path_75.lineTo(size.width * 0.7575853, size.height * 1.303479);
    // path_75.cubicTo(
    //     size.width * 0.7591365,
    //     size.height * 1.303432,
    //     size.width * 0.7592843,
    //     size.height * 1.309084,
    //     size.width * 0.7591775,
    //     size.height * 1.313005);
    // path_75.lineTo(size.width * 0.7591775, size.height * 1.429414);
    // path_75.cubicTo(
    //     size.width * 0.7591915,
    //     size.height * 1.434622,
    //     size.width * 0.7575079,
    //     size.height * 1.435120,
    //     size.width * 0.7563405,
    //     size.height * 1.434760);
    // path_75.lineTo(size.width * 0.7216738, size.height * 1.434760);
    // path_75.cubicTo(
    //     size.width * 0.7201226,
    //     size.height * 1.434807,
    //     size.width * 0.7199755,
    //     size.height * 1.429155,
    //     size.width * 0.7200816,
    //     size.height * 1.425234);
    // path_75.lineTo(size.width * 0.7200816, size.height * 1.308825);
    // path_75.cubicTo(
    //     size.width * 0.7200612,
    //     size.height * 1.305950,
    //     size.width * 0.7208179,
    //     size.height * 1.303411,
    //     size.width * 0.7216744,
    //     size.height * 1.303479);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7648513, size.height * 1.303479);
    // path_75.lineTo(size.width * 0.8007629, size.height * 1.303479);
    // path_75.cubicTo(
    //     size.width * 0.8023141,
    //     size.height * 1.303432,
    //     size.width * 0.8024618,
    //     size.height * 1.309084,
    //     size.width * 0.8023550,
    //     size.height * 1.313005);
    // path_75.lineTo(size.width * 0.8023550, size.height * 1.429414);
    // path_75.cubicTo(
    //     size.width * 0.8023691,
    //     size.height * 1.434622,
    //     size.width * 0.8006855,
    //     size.height * 1.435120,
    //     size.width * 0.7995181,
    //     size.height * 1.434760);
    // path_75.lineTo(size.width * 0.7648513, size.height * 1.434760);
    // path_75.cubicTo(
    //     size.width * 0.7633001,
    //     size.height * 1.434807,
    //     size.width * 0.7631530,
    //     size.height * 1.429155,
    //     size.width * 0.7632592,
    //     size.height * 1.425234);
    // path_75.lineTo(size.width * 0.7632592, size.height * 1.308825);
    // path_75.cubicTo(
    //     size.width * 0.7632387,
    //     size.height * 1.305950,
    //     size.width * 0.7639954,
    //     size.height * 1.303411,
    //     size.width * 0.7648520,
    //     size.height * 1.303479);
    // path_75.close();
    // path_75.moveTo(size.width * 0.6784962, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.7144078, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.7159590,
    //     size.height * 1.486012,
    //     size.width * 0.7161068,
    //     size.height * 1.491667,
    //     size.width * 0.7159999,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.7159999, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.7160140,
    //     size.height * 1.617203,
    //     size.width * 0.7143304,
    //     size.height * 1.617701,
    //     size.width * 0.7131630,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.6784962, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.6769451,
    //     size.height * 1.617390,
    //     size.width * 0.6767979,
    //     size.height * 1.611735,
    //     size.width * 0.6769041,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.6769041, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.6768836,
    //     size.height * 1.488531,
    //     size.width * 0.6776404,
    //     size.height * 1.485991,
    //     size.width * 0.6784969,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7216738, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.7575853, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.7591365,
    //     size.height * 1.486012,
    //     size.width * 0.7592843,
    //     size.height * 1.491667,
    //     size.width * 0.7591775,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.7591775, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.7591915,
    //     size.height * 1.617203,
    //     size.width * 0.7575079,
    //     size.height * 1.617701,
    //     size.width * 0.7563405,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.7216738, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.7201226,
    //     size.height * 1.617390,
    //     size.width * 0.7199755,
    //     size.height * 1.611735,
    //     size.width * 0.7200816,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.7200816, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.7200612,
    //     size.height * 1.488531,
    //     size.width * 0.7208179,
    //     size.height * 1.485991,
    //     size.width * 0.7216744,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7648513, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.8007629, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.8023141,
    //     size.height * 1.486012,
    //     size.width * 0.8024618,
    //     size.height * 1.491667,
    //     size.width * 0.8023550,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.8023550, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.8023691,
    //     size.height * 1.617203,
    //     size.width * 0.8006855,
    //     size.height * 1.617701,
    //     size.width * 0.7995181,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.7648513, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.7633001,
    //     size.height * 1.617390,
    //     size.width * 0.7631530,
    //     size.height * 1.611735,
    //     size.width * 0.7632592,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.7632592, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.7632387,
    //     size.height * 1.488531,
    //     size.width * 0.7639954,
    //     size.height * 1.485991,
    //     size.width * 0.7648520,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.6784962, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.7144078, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.7159590,
    //     size.height * 1.630800,
    //     size.width * 0.7161068,
    //     size.height * 1.636454,
    //     size.width * 0.7159999,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.7159999, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.7160140,
    //     size.height * 1.761991,
    //     size.width * 0.7143304,
    //     size.height * 1.762488,
    //     size.width * 0.7131630,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.6784962, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.6769451,
    //     size.height * 1.762177,
    //     size.width * 0.6767979,
    //     size.height * 1.756523,
    //     size.width * 0.6769041,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.6769041, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.6768836,
    //     size.height * 1.633318,
    //     size.width * 0.6776404,
    //     size.height * 1.630779,
    //     size.width * 0.6784969,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7216738, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.7575853, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.7591365,
    //     size.height * 1.630800,
    //     size.width * 0.7592843,
    //     size.height * 1.636454,
    //     size.width * 0.7591775,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.7591775, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.7591915,
    //     size.height * 1.761991,
    //     size.width * 0.7575079,
    //     size.height * 1.762488,
    //     size.width * 0.7563405,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.7216738, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.7201226,
    //     size.height * 1.762177,
    //     size.width * 0.7199755,
    //     size.height * 1.756523,
    //     size.width * 0.7200816,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.7200816, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.7200612,
    //     size.height * 1.633318,
    //     size.width * 0.7208179,
    //     size.height * 1.630779,
    //     size.width * 0.7216744,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7648513, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.8007629, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.8023141,
    //     size.height * 1.630800,
    //     size.width * 0.8024618,
    //     size.height * 1.636454,
    //     size.width * 0.8023550,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.8023550, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.8023691,
    //     size.height * 1.761991,
    //     size.width * 0.8006855,
    //     size.height * 1.762488,
    //     size.width * 0.7995181,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.7648513, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.7633001,
    //     size.height * 1.762177,
    //     size.width * 0.7631530,
    //     size.height * 1.756523,
    //     size.width * 0.7632592,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.7632592, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.7632387,
    //     size.height * 1.633318,
    //     size.width * 0.7639954,
    //     size.height * 1.630779,
    //     size.width * 0.7648520,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7216738, size.height * 1.920423);
    // path_75.lineTo(size.width * 0.7575853, size.height * 1.920423);
    // path_75.cubicTo(
    //     size.width * 0.7591365,
    //     size.height * 1.920375,
    //     size.width * 0.7592843,
    //     size.height * 1.926030,
    //     size.width * 0.7591775,
    //     size.height * 1.929949);
    // path_75.lineTo(size.width * 0.7591775, size.height * 2.046358);
    // path_75.cubicTo(
    //     size.width * 0.7591915,
    //     size.height * 2.051566,
    //     size.width * 0.7575079,
    //     size.height * 2.052063,
    //     size.width * 0.7563405,
    //     size.height * 2.051703);
    // path_75.lineTo(size.width * 0.7216738, size.height * 2.051703);
    // path_75.cubicTo(
    //     size.width * 0.7201226,
    //     size.height * 2.051752,
    //     size.width * 0.7199755,
    //     size.height * 2.046098,
    //     size.width * 0.7200816,
    //     size.height * 2.042177);
    // path_75.lineTo(size.width * 0.7200816, size.height * 1.925768);
    // path_75.cubicTo(
    //     size.width * 0.7200612,
    //     size.height * 1.922894,
    //     size.width * 0.7208179,
    //     size.height * 1.920354,
    //     size.width * 0.7216744,
    //     size.height * 1.920423);
    // path_75.close();
    // path_75.moveTo(size.width * 0.6784962, size.height * 2.065210);
    // path_75.lineTo(size.width * 0.7144078, size.height * 2.065210);
    // path_75.cubicTo(
    //     size.width * 0.7159590,
    //     size.height * 2.065163,
    //     size.width * 0.7161068,
    //     size.height * 2.070817,
    //     size.width * 0.7159999,
    //     size.height * 2.074736);
    // path_75.lineTo(size.width * 0.7159999, size.height * 2.191145);
    // path_75.cubicTo(
    //     size.width * 0.7160140,
    //     size.height * 2.196353,
    //     size.width * 0.7143304,
    //     size.height * 2.196851,
    //     size.width * 0.7131630,
    //     size.height * 2.196491);
    // path_75.lineTo(size.width * 0.6784962, size.height * 2.196491);
    // path_75.cubicTo(
    //     size.width * 0.6769451,
    //     size.height * 2.196538,
    //     size.width * 0.6767979,
    //     size.height * 2.190886,
    //     size.width * 0.6769041,
    //     size.height * 2.186965);
    // path_75.lineTo(size.width * 0.6769041, size.height * 2.070556);
    // path_75.cubicTo(
    //     size.width * 0.6768836,
    //     size.height * 2.067681,
    //     size.width * 0.6776404,
    //     size.height * 2.065142,
    //     size.width * 0.6784969,
    //     size.height * 2.065210);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7216738, size.height * 2.065210);
    // path_75.lineTo(size.width * 0.7575853, size.height * 2.065210);
    // path_75.cubicTo(
    //     size.width * 0.7591365,
    //     size.height * 2.065163,
    //     size.width * 0.7592843,
    //     size.height * 2.070817,
    //     size.width * 0.7591775,
    //     size.height * 2.074736);
    // path_75.lineTo(size.width * 0.7591775, size.height * 2.191145);
    // path_75.cubicTo(
    //     size.width * 0.7591915,
    //     size.height * 2.196353,
    //     size.width * 0.7575079,
    //     size.height * 2.196851,
    //     size.width * 0.7563405,
    //     size.height * 2.196491);
    // path_75.lineTo(size.width * 0.7216738, size.height * 2.196491);
    // path_75.cubicTo(
    //     size.width * 0.7201226,
    //     size.height * 2.196538,
    //     size.width * 0.7199755,
    //     size.height * 2.190886,
    //     size.width * 0.7200816,
    //     size.height * 2.186965);
    // path_75.lineTo(size.width * 0.7200816, size.height * 2.070556);
    // path_75.cubicTo(
    //     size.width * 0.7200612,
    //     size.height * 2.067681,
    //     size.width * 0.7208179,
    //     size.height * 2.065142,
    //     size.width * 0.7216744,
    //     size.height * 2.065210);
    // path_75.close();
    // path_75.moveTo(size.width * 0.7648513, size.height * 2.065210);
    // path_75.lineTo(size.width * 0.8007629, size.height * 2.065210);
    // path_75.cubicTo(
    //     size.width * 0.8023141,
    //     size.height * 2.065163,
    //     size.width * 0.8024618,
    //     size.height * 2.070817,
    //     size.width * 0.8023550,
    //     size.height * 2.074736);
    // path_75.lineTo(size.width * 0.8023550, size.height * 2.191145);
    // path_75.cubicTo(
    //     size.width * 0.8023691,
    //     size.height * 2.196353,
    //     size.width * 0.8006855,
    //     size.height * 2.196851,
    //     size.width * 0.7995181,
    //     size.height * 2.196491);
    // path_75.lineTo(size.width * 0.7648513, size.height * 2.196491);
    // path_75.cubicTo(
    //     size.width * 0.7633001,
    //     size.height * 2.196538,
    //     size.width * 0.7631530,
    //     size.height * 2.190886,
    //     size.width * 0.7632592,
    //     size.height * 2.186965);
    // path_75.lineTo(size.width * 0.7632592, size.height * 2.070556);
    // path_75.cubicTo(
    //     size.width * 0.7632387,
    //     size.height * 2.067681,
    //     size.width * 0.7639954,
    //     size.height * 2.065142,
    //     size.width * 0.7648520,
    //     size.height * 2.065210);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8193126, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.8552241, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.8567753,
    //     size.height * 1.486012,
    //     size.width * 0.8569231,
    //     size.height * 1.491667,
    //     size.width * 0.8568163,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.8568163, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.8568303,
    //     size.height * 1.617203,
    //     size.width * 0.8551467,
    //     size.height * 1.617701,
    //     size.width * 0.8539793,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.8193126, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.8177614,
    //     size.height * 1.617387,
    //     size.width * 0.8176143,
    //     size.height * 1.611735,
    //     size.width * 0.8177204,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.8177204, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.8177000,
    //     size.height * 1.488531,
    //     size.width * 0.8184567,
    //     size.height * 1.485991,
    //     size.width * 0.8193132,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8624901, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.8984017, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.8999529,
    //     size.height * 1.486012,
    //     size.width * 0.9001006,
    //     size.height * 1.491667,
    //     size.width * 0.8999938,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.8999938, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.9000079,
    //     size.height * 1.617203,
    //     size.width * 0.8983243,
    //     size.height * 1.617701,
    //     size.width * 0.8971569,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.8624901, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.8609389,
    //     size.height * 1.617387,
    //     size.width * 0.8607918,
    //     size.height * 1.611735,
    //     size.width * 0.8608980,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.8608980, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.8608775,
    //     size.height * 1.488531,
    //     size.width * 0.8616342,
    //     size.height * 1.485991,
    //     size.width * 0.8624907,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9056676, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.9415792, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.9431304,
    //     size.height * 1.486012,
    //     size.width * 0.9432782,
    //     size.height * 1.491667,
    //     size.width * 0.9431713,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.9431713, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.9431854,
    //     size.height * 1.617203,
    //     size.width * 0.9415018,
    //     size.height * 1.617701,
    //     size.width * 0.9403344,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.9056676, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.9041165,
    //     size.height * 1.617387,
    //     size.width * 0.9039693,
    //     size.height * 1.611735,
    //     size.width * 0.9040755,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.9040755, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.9040550,
    //     size.height * 1.488531,
    //     size.width * 0.9048118,
    //     size.height * 1.485991,
    //     size.width * 0.9056683,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9488452, size.height * 1.486060);
    // path_75.lineTo(size.width * 0.9847567, size.height * 1.486060);
    // path_75.cubicTo(
    //     size.width * 0.9863079,
    //     size.height * 1.486012,
    //     size.width * 0.9864557,
    //     size.height * 1.491667,
    //     size.width * 0.9863489,
    //     size.height * 1.495586);
    // path_75.lineTo(size.width * 0.9863489, size.height * 1.611995);
    // path_75.cubicTo(
    //     size.width * 0.9863629,
    //     size.height * 1.617203,
    //     size.width * 0.9846793,
    //     size.height * 1.617701,
    //     size.width * 0.9835119,
    //     size.height * 1.617340);
    // path_75.lineTo(size.width * 0.9488452, size.height * 1.617340);
    // path_75.cubicTo(
    //     size.width * 0.9472940,
    //     size.height * 1.617387,
    //     size.width * 0.9471469,
    //     size.height * 1.611735,
    //     size.width * 0.9472530,
    //     size.height * 1.607814);
    // path_75.lineTo(size.width * 0.9472530, size.height * 1.491405);
    // path_75.cubicTo(
    //     size.width * 0.9472326,
    //     size.height * 1.488531,
    //     size.width * 0.9479893,
    //     size.height * 1.485991,
    //     size.width * 0.9488458,
    //     size.height * 1.486060);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8193126, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.8552241, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.8567753,
    //     size.height * 1.630800,
    //     size.width * 0.8569231,
    //     size.height * 1.636454,
    //     size.width * 0.8568163,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.8568163, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.8568303,
    //     size.height * 1.761991,
    //     size.width * 0.8551467,
    //     size.height * 1.762488,
    //     size.width * 0.8539793,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.8193126, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.8177614,
    //     size.height * 1.762175,
    //     size.width * 0.8176143,
    //     size.height * 1.756523,
    //     size.width * 0.8177204,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.8177204, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.8177000,
    //     size.height * 1.633318,
    //     size.width * 0.8184567,
    //     size.height * 1.630779,
    //     size.width * 0.8193132,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8624901, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.8984017, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.8999529,
    //     size.height * 1.630800,
    //     size.width * 0.9001006,
    //     size.height * 1.636454,
    //     size.width * 0.8999938,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.8999938, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.9000079,
    //     size.height * 1.761991,
    //     size.width * 0.8983243,
    //     size.height * 1.762488,
    //     size.width * 0.8971569,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.8624901, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.8609389,
    //     size.height * 1.762175,
    //     size.width * 0.8607918,
    //     size.height * 1.756523,
    //     size.width * 0.8608980,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.8608980, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.8608775,
    //     size.height * 1.633318,
    //     size.width * 0.8616342,
    //     size.height * 1.630779,
    //     size.width * 0.8624907,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9056676, size.height * 1.630847);
    // path_75.lineTo(size.width * 0.9415792, size.height * 1.630847);
    // path_75.cubicTo(
    //     size.width * 0.9431304,
    //     size.height * 1.630800,
    //     size.width * 0.9432782,
    //     size.height * 1.636454,
    //     size.width * 0.9431713,
    //     size.height * 1.640373);
    // path_75.lineTo(size.width * 0.9431713, size.height * 1.756782);
    // path_75.cubicTo(
    //     size.width * 0.9431854,
    //     size.height * 1.761991,
    //     size.width * 0.9415018,
    //     size.height * 1.762488,
    //     size.width * 0.9403344,
    //     size.height * 1.762128);
    // path_75.lineTo(size.width * 0.9056676, size.height * 1.762128);
    // path_75.cubicTo(
    //     size.width * 0.9041165,
    //     size.height * 1.762175,
    //     size.width * 0.9039693,
    //     size.height * 1.756523,
    //     size.width * 0.9040755,
    //     size.height * 1.752602);
    // path_75.lineTo(size.width * 0.9040755, size.height * 1.636193);
    // path_75.cubicTo(
    //     size.width * 0.9040550,
    //     size.height * 1.633318,
    //     size.width * 0.9048118,
    //     size.height * 1.630779,
    //     size.width * 0.9056683,
    //     size.height * 1.630847);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9488452, size.height * 1.630849);
    // path_75.lineTo(size.width * 0.9847567, size.height * 1.630849);
    // path_75.cubicTo(
    //     size.width * 0.9863079,
    //     size.height * 1.630749,
    //     size.width * 0.9864557,
    //     size.height * 1.642630,
    //     size.width * 0.9863489,
    //     size.height * 1.650869);
    // path_75.lineTo(size.width * 0.9863489, size.height * 1.895489);
    // path_75.cubicTo(
    //     size.width * 0.9863629,
    //     size.height * 1.906437,
    //     size.width * 0.9846793,
    //     size.height * 1.907477,
    //     size.width * 0.9835119,
    //     size.height * 1.906725);
    // path_75.lineTo(size.width * 0.9488452, size.height * 1.906725);
    // path_75.cubicTo(
    //     size.width * 0.9472940,
    //     size.height * 1.906823,
    //     size.width * 0.9471469,
    //     size.height * 1.894944,
    //     size.width * 0.9472530,
    //     size.height * 1.886705);
    // path_75.lineTo(size.width * 0.9472530, size.height * 1.642083);
    // path_75.cubicTo(
    //     size.width * 0.9472326,
    //     size.height * 1.636045,
    //     size.width * 0.9479893,
    //     size.height * 1.630704,
    //     size.width * 0.9488458,
    //     size.height * 1.630849);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8193126, size.height * 1.775635);
    // path_75.lineTo(size.width * 0.8552241, size.height * 1.775635);
    // path_75.cubicTo(
    //     size.width * 0.8567753,
    //     size.height * 1.775588,
    //     size.width * 0.8569231,
    //     size.height * 1.781238,
    //     size.width * 0.8568163,
    //     size.height * 1.785154);
    // path_75.lineTo(size.width * 0.8568163, size.height * 1.901482);
    // path_75.cubicTo(
    //     size.width * 0.8568303,
    //     size.height * 1.906688,
    //     size.width * 0.8551467,
    //     size.height * 1.907181,
    //     size.width * 0.8539793,
    //     size.height * 1.906823);
    // path_75.lineTo(size.width * 0.8193126, size.height * 1.906823);
    // path_75.cubicTo(
    //     size.width * 0.8177614,
    //     size.height * 1.906870,
    //     size.width * 0.8176143,
    //     size.height * 1.901223,
    //     size.width * 0.8177204,
    //     size.height * 1.897304);
    // path_75.lineTo(size.width * 0.8177204, size.height * 1.780978);
    // path_75.cubicTo(
    //     size.width * 0.8177000,
    //     size.height * 1.778106,
    //     size.width * 0.8184567,
    //     size.height * 1.775566,
    //     size.width * 0.8193132,
    //     size.height * 1.775637);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8624901, size.height * 1.775635);
    // path_75.lineTo(size.width * 0.8984017, size.height * 1.775635);
    // path_75.cubicTo(
    //     size.width * 0.8999529,
    //     size.height * 1.775588,
    //     size.width * 0.9001006,
    //     size.height * 1.781238,
    //     size.width * 0.8999938,
    //     size.height * 1.785154);
    // path_75.lineTo(size.width * 0.8999938, size.height * 1.901482);
    // path_75.cubicTo(
    //     size.width * 0.9000079,
    //     size.height * 1.906688,
    //     size.width * 0.8983243,
    //     size.height * 1.907181,
    //     size.width * 0.8971569,
    //     size.height * 1.906823);
    // path_75.lineTo(size.width * 0.8624901, size.height * 1.906823);
    // path_75.cubicTo(
    //     size.width * 0.8609389,
    //     size.height * 1.906870,
    //     size.width * 0.8607918,
    //     size.height * 1.901223,
    //     size.width * 0.8608980,
    //     size.height * 1.897304);
    // path_75.lineTo(size.width * 0.8608980, size.height * 1.780978);
    // path_75.cubicTo(
    //     size.width * 0.8608775,
    //     size.height * 1.778106,
    //     size.width * 0.8616342,
    //     size.height * 1.775566,
    //     size.width * 0.8624907,
    //     size.height * 1.775637);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9056676, size.height * 1.775635);
    // path_75.lineTo(size.width * 0.9415792, size.height * 1.775635);
    // path_75.cubicTo(
    //     size.width * 0.9431304,
    //     size.height * 1.775588,
    //     size.width * 0.9432782,
    //     size.height * 1.781238,
    //     size.width * 0.9431713,
    //     size.height * 1.785154);
    // path_75.lineTo(size.width * 0.9431713, size.height * 1.901482);
    // path_75.cubicTo(
    //     size.width * 0.9431854,
    //     size.height * 1.906688,
    //     size.width * 0.9415018,
    //     size.height * 1.907181,
    //     size.width * 0.9403344,
    //     size.height * 1.906823);
    // path_75.lineTo(size.width * 0.9056676, size.height * 1.906823);
    // path_75.cubicTo(
    //     size.width * 0.9041165,
    //     size.height * 1.906870,
    //     size.width * 0.9039693,
    //     size.height * 1.901223,
    //     size.width * 0.9040755,
    //     size.height * 1.897304);
    // path_75.lineTo(size.width * 0.9040755, size.height * 1.780978);
    // path_75.cubicTo(
    //     size.width * 0.9040550,
    //     size.height * 1.778106,
    //     size.width * 0.9048118,
    //     size.height * 1.775566,
    //     size.width * 0.9056683,
    //     size.height * 1.775637);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8193126, size.height * 1.920470);
    // path_75.lineTo(size.width * 0.8552241, size.height * 1.920470);
    // path_75.cubicTo(
    //     size.width * 0.8567753,
    //     size.height * 1.920420,
    //     size.width * 0.8569231,
    //     size.height * 1.926070,
    //     size.width * 0.8568163,
    //     size.height * 1.929989);
    // path_75.lineTo(size.width * 0.8568163, size.height * 2.046315);
    // path_75.cubicTo(
    //     size.width * 0.8568303,
    //     size.height * 2.051521,
    //     size.width * 0.8551467,
    //     size.height * 2.052016,
    //     size.width * 0.8539793,
    //     size.height * 2.051656);
    // path_75.lineTo(size.width * 0.8193126, size.height * 2.051656);
    // path_75.cubicTo(
    //     size.width * 0.8177614,
    //     size.height * 2.051705,
    //     size.width * 0.8176143,
    //     size.height * 2.046057,
    //     size.width * 0.8177204,
    //     size.height * 2.042139);
    // path_75.lineTo(size.width * 0.8177204, size.height * 1.925811);
    // path_75.cubicTo(
    //     size.width * 0.8177000,
    //     size.height * 1.922941,
    //     size.width * 0.8184567,
    //     size.height * 1.920399,
    //     size.width * 0.8193132,
    //     size.height * 1.920470);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8624901, size.height * 1.920470);
    // path_75.lineTo(size.width * 0.8984017, size.height * 1.920470);
    // path_75.cubicTo(
    //     size.width * 0.8999529,
    //     size.height * 1.920420,
    //     size.width * 0.9001006,
    //     size.height * 1.926070,
    //     size.width * 0.8999938,
    //     size.height * 1.929989);
    // path_75.lineTo(size.width * 0.8999938, size.height * 2.046315);
    // path_75.cubicTo(
    //     size.width * 0.9000079,
    //     size.height * 2.051521,
    //     size.width * 0.8983243,
    //     size.height * 2.052016,
    //     size.width * 0.8971569,
    //     size.height * 2.051656);
    // path_75.lineTo(size.width * 0.8624901, size.height * 2.051656);
    // path_75.cubicTo(
    //     size.width * 0.8609389,
    //     size.height * 2.051705,
    //     size.width * 0.8607918,
    //     size.height * 2.046057,
    //     size.width * 0.8608980,
    //     size.height * 2.042139);
    // path_75.lineTo(size.width * 0.8608980, size.height * 1.925811);
    // path_75.cubicTo(
    //     size.width * 0.8608775,
    //     size.height * 1.922941,
    //     size.width * 0.8616342,
    //     size.height * 1.920399,
    //     size.width * 0.8624907,
    //     size.height * 1.920470);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9056676, size.height * 1.920470);
    // path_75.lineTo(size.width * 0.9415792, size.height * 1.920470);
    // path_75.cubicTo(
    //     size.width * 0.9431304,
    //     size.height * 1.920420,
    //     size.width * 0.9432782,
    //     size.height * 1.926070,
    //     size.width * 0.9431713,
    //     size.height * 1.929989);
    // path_75.lineTo(size.width * 0.9431713, size.height * 2.046315);
    // path_75.cubicTo(
    //     size.width * 0.9431854,
    //     size.height * 2.051521,
    //     size.width * 0.9415018,
    //     size.height * 2.052016,
    //     size.width * 0.9403344,
    //     size.height * 2.051656);
    // path_75.lineTo(size.width * 0.9056676, size.height * 2.051656);
    // path_75.cubicTo(
    //     size.width * 0.9041165,
    //     size.height * 2.051705,
    //     size.width * 0.9039693,
    //     size.height * 2.046057,
    //     size.width * 0.9040755,
    //     size.height * 2.042139);
    // path_75.lineTo(size.width * 0.9040755, size.height * 1.925811);
    // path_75.cubicTo(
    //     size.width * 0.9040550,
    //     size.height * 1.922941,
    //     size.width * 0.9048118,
    //     size.height * 1.920399,
    //     size.width * 0.9056683,
    //     size.height * 1.920470);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9488452, size.height * 1.920517);
    // path_75.lineTo(size.width * 0.9847567, size.height * 1.920517);
    // path_75.cubicTo(
    //     size.width * 0.9863079,
    //     size.height * 1.920416,
    //     size.width * 0.9864557,
    //     size.height * 1.932297,
    //     size.width * 0.9863489,
    //     size.height * 1.940536);
    // path_75.lineTo(size.width * 0.9863489, size.height * 2.185157);
    // path_75.cubicTo(
    //     size.width * 0.9863629,
    //     size.height * 2.196105,
    //     size.width * 0.9846793,
    //     size.height * 2.197145,
    //     size.width * 0.9835119,
    //     size.height * 2.196390);
    // path_75.lineTo(size.width * 0.9488452, size.height * 2.196390);
    // path_75.cubicTo(
    //     size.width * 0.9472940,
    //     size.height * 2.196489,
    //     size.width * 0.9471469,
    //     size.height * 2.184612,
    //     size.width * 0.9472530,
    //     size.height * 2.176371);
    // path_75.lineTo(size.width * 0.9472530, size.height * 1.931750);
    // path_75.cubicTo(
    //     size.width * 0.9472326,
    //     size.height * 1.925712,
    //     size.width * 0.9479893,
    //     size.height * 1.920371,
    //     size.width * 0.9488458,
    //     size.height * 1.920517);
    // path_75.close();
    // path_75.moveTo(size.width * 0.8210985, size.height * 2.065302);
    // path_75.lineTo(size.width * 0.8966157, size.height * 2.065302);
    // path_75.cubicTo(
    //     size.width * 0.8998780,
    //     size.height * 2.065255,
    //     size.width * 0.9001883,
    //     size.height * 2.070905,
    //     size.width * 0.8999637,
    //     size.height * 2.074822);
    // path_75.lineTo(size.width * 0.8999637, size.height * 2.191150);
    // path_75.cubicTo(
    //     size.width * 0.8999932,
    //     size.height * 2.196353,
    //     size.width * 0.8964532,
    //     size.height * 2.196849,
    //     size.width * 0.8939982,
    //     size.height * 2.196491);
    // path_75.lineTo(size.width * 0.8210985, size.height * 2.196491);
    // path_75.cubicTo(
    //     size.width * 0.8178362,
    //     size.height * 2.196538,
    //     size.width * 0.8175260,
    //     size.height * 2.190890,
    //     size.width * 0.8177505,
    //     size.height * 2.186971);
    // path_75.lineTo(size.width * 0.8177505, size.height * 2.070646);
    // path_75.cubicTo(
    //     size.width * 0.8177077,
    //     size.height * 2.067771,
    //     size.width * 0.8192985,
    //     size.height * 2.065234,
    //     size.width * 0.8210985,
    //     size.height * 2.065305);
    // path_75.close();
    // path_75.moveTo(size.width * 0.9056676, size.height * 2.065302);
    // path_75.lineTo(size.width * 0.9415792, size.height * 2.065302);
    // path_75.cubicTo(
    //     size.width * 0.9431304,
    //     size.height * 2.065255,
    //     size.width * 0.9432782,
    //     size.height * 2.070905,
    //     size.width * 0.9431713,
    //     size.height * 2.074822);
    // path_75.lineTo(size.width * 0.9431713, size.height * 2.191150);
    // path_75.cubicTo(
    //     size.width * 0.9431854,
    //     size.height * 2.196353,
    //     size.width * 0.9415018,
    //     size.height * 2.196849,
    //     size.width * 0.9403344,
    //     size.height * 2.196491);
    // path_75.lineTo(size.width * 0.9056676, size.height * 2.196491);
    // path_75.cubicTo(
    //     size.width * 0.9041165,
    //     size.height * 2.196538,
    //     size.width * 0.9039693,
    //     size.height * 2.190890,
    //     size.width * 0.9040755,
    //     size.height * 2.186971);
    // path_75.lineTo(size.width * 0.9040755, size.height * 2.070646);
    // path_75.cubicTo(
    //     size.width * 0.9040550,
    //     size.height * 2.067771,
    //     size.width * 0.9048118,
    //     size.height * 2.065234,
    //     size.width * 0.9056683,
    //     size.height * 2.065305);
    // path_75.close();

    // Paint paint_75_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009191897;
    // paint_75_stroke.color = Color.fromARGB(255, 117, 36, 36).withOpacity(1);
    // paint_75_stroke.strokeCap = StrokeCap.round;
    // canvas.drawPath(path_75, paint_75_stroke);

    // Paint paint_76_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009120650;
    // paint_76_stroke.color = Color.fromARGB(255, 186, 186, 186).withOpacity(1);
    // paint_76_stroke.strokeCap = StrokeCap.round;
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.8177198, size.height * 0.01141999,
    //             size.width * 0.1686892, size.height * 0.1313042),
    //         bottomRight: Radius.circular(size.width * 0.001588933),
    //         bottomLeft: Radius.circular(size.width * 0.001588933),
    //         topLeft: Radius.circular(size.width * 0.001588933),
    //         topRight: Radius.circular(size.width * 0.001588933)),
    //     paint_76_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
