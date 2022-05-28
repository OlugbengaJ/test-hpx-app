import 'package:flutter/material.dart';

/// [KeyCustomPainter] is a reference to a custom key layout.
///
/// Although it is not imported anywhere in the project, it was written as
/// an initial proof of concept which served as a guide to the current code
/// setup for the keyboard rendering.
class KeyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var rect = ui.Offset.zero & size;
    // canvas.clipRect(rect);

    // Paint paint0Stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009211208;
    // paint0Stroke.color = Color.fromARGB(255, 22, 180, 62).withOpacity(1);
    // paint0Stroke.strokeCap = StrokeCap.round;
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.002653339, size.height * -0.04052338,
    //             size.width * 0.9990597, size.height * 0.9968769),
    //         bottomRight: Radius.circular(size.width * 0.007771956),
    //         bottomLeft: Radius.circular(size.width * 0.007771956),
    //         topLeft: Radius.circular(size.width * 0.007771956),
    //         topRight: Radius.circular(size.width * 0.007771956)),
    //     paint0Stroke);

    // Paint paint0_fill = Paint()..style = PaintingStyle.fill;
    // paint0_fill.color = Color.fromARGB(255, 76, 22, 163).withOpacity(1);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.002653339, size.height * -0.04052338,
    //             size.width * 0.9990597, size.height * 0.9968769),
    //         bottomRight: Radius.circular(size.width * 0.007771956),
    //         bottomLeft: Radius.circular(size.width * 0.007771956),
    //         topLeft: Radius.circular(size.width * 0.007771956),
    //         topRight: Radius.circular(size.width * 0.007771956)),
    //     paint0_fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009211208;
    paint1Stroke.color = const Color.fromARGB(255, 201, 89, 89).withOpacity(1);
    paint1Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint1Stroke);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint2Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint2Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1043067, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint2Stroke);

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint3Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1474861, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint3Stroke);

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint4Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint4Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1906656, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint4Stroke);

    Paint paint5Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint5Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint5Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2338450, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint5Stroke);

    Paint paint6Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint6Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint6Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2986056, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint6Stroke);

    Paint paint7Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint7Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint7Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3417850, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint7Stroke);

    Paint paint8Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint8Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint8Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3849645, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint8Stroke);

    Paint paint9Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint9Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint9Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4281439, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint9Stroke);

    Paint paint10Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint10Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint10Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4929045, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint10Stroke);

    Paint paint11Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint11Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint11Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5360839, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint11Stroke);

    Paint paint12Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint12Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint12Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5792634, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint12Stroke);

    Paint paint13Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint13Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint13Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6224429, size.height * 1.303479,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint13Stroke);

    Paint paint14Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint14Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint14Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint14Stroke);

    Paint paint15Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint15Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint15Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.06113107, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint15Stroke);

    Paint paint16Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint16Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint16Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1043105, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint16Stroke);

    Paint paint17Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint17Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint17Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1474900, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint17Stroke);

    Paint paint18Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint18Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint18Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1906694, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint18Stroke);

    Paint paint19Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint19Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint19Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2338489, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint19Stroke);

    Paint paint20Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint20Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint20Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2770283, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint20Stroke);

    Paint paint21Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint21Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint21Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3202078, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint21Stroke);

    Paint paint22Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint22Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint22Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3633872, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint22Stroke);

    Paint paint23Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint23Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint23Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4065667, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint23Stroke);

    Paint paint24Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint24Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint24Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4497461, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint24Stroke);

    Paint paint25Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint25Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint25Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4929256, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint25Stroke);

    Paint paint26Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint26Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint26Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5361051, size.height * 1.486105,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint26Stroke);

    Paint paint27Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint27Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint27Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5792851, size.height * 1.486105,
                size.width * 0.08232708, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint27Stroke);

    Paint paint28Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint28Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint28Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.630892,
                size.width * 0.06137159, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint28Stroke);

    Paint paint29Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint29Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint29Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.08335119, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint29Stroke);

    Paint paint30Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint30Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint30Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1265306, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint30Stroke);

    Paint paint31Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint31Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint31Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1697101, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint31Stroke);

    Paint paint32Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint32Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint32Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2128895, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint32Stroke);

    Paint paint33Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint33Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint33Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2560690, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint33Stroke);

    Paint paint34Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint34Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint34Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2992485, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint34Stroke);

    Paint paint35Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint35Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint35Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3424279, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint35Stroke);

    Paint paint36Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint36Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint36Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3856074, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint36Stroke);

    Paint paint37Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint37Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint37Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4287868, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint37Stroke);

    Paint paint38Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint38Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint38Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4719663, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint38Stroke);

    Paint paint39Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint39Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint39Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5151457, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint39Stroke);

    Paint paint40Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint40Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint40Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5583258, size.height * 1.630892,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint40Stroke);

    Paint paint41Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint41Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint41Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6015046, size.height * 1.630892,
                size.width * 0.06010505, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint41Stroke);

    Paint paint42Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint42Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint42Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.775680,
                size.width * 0.07202205, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint42Stroke);

    Paint paint43Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint43Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint43Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.09400165, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint43Stroke);

    Paint paint44Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint44Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint44Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1371811, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint44Stroke);

    Paint paint45Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint45Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint45Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1803606, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint45Stroke);

    Paint paint46Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint46Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint46Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2235400, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint46Stroke);

    Paint paint47Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint47Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint47Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2667195, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint47Stroke);

    Paint paint48Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint48Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint48Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3098989, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint48Stroke);

    Paint paint49Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint49Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint49Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3530784, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint49Stroke);

    Paint paint50Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint50Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint50Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3962578, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint50Stroke);

    Paint paint51Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint51Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint51Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4394379, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint51Stroke);

    Paint paint52Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint52Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint52Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4826174, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint52Stroke);

    Paint paint53Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint53Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint53Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5257968, size.height * 1.775680,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint53Stroke);

    Paint paint54Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191898;
    paint54Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint54Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5689763, size.height * 1.775680,
                size.width * 0.09263212, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint54Stroke);

    Paint paint55Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint55Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint55Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 1.920468,
                size.width * 0.09361081, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint55Stroke);

    Paint paint56Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint56Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint56Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1155904, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint56Stroke);

    Paint paint57Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint57Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint57Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1587699, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint57Stroke);

    Paint paint58Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint58Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint58Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2019493, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint58Stroke);

    Paint paint59Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint59Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint59Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2451288, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint59Stroke);

    Paint paint60Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint60Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint60Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2883082, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint60Stroke);

    Paint paint61Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint61Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint61Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3314877, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint61Stroke);

    Paint paint62Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint62Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint62Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3746671, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint62Stroke);

    Paint paint63Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint63Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint63Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4178466, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint63Stroke);

    Paint paint64Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint64Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint64Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4610267, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint64Stroke);

    Paint paint65Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint65Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint65Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5042061, size.height * 1.920468,
                size.width * 0.03914955, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint65Stroke);

    Paint paint66Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint66Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint66Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5473856, size.height * 1.920468,
                size.width * 0.1142209, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint66Stroke);

    Paint paint67Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint67Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint67Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01795162, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint67Stroke);

    Paint paint68Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint68Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint68Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.06976658, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint68Stroke);

    Paint paint69Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint69Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint69Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1215815, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint69Stroke);

    Paint paint70Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint70Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint70Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1733965, size.height * 2.065255,
                size.width * 0.2809437, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint70Stroke);

    Paint paint71Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint71Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint71Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4583625, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint71Stroke);

    Paint paint72Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint72Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint72Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5101774, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint72Stroke);

    Paint paint73Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint73Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint73Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.5619924, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint73Stroke);

    Paint paint74Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.0009191897;
    paint74Stroke.color = const Color(0xffbababa).withOpacity(1);
    paint74Stroke.strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.6138054, size.height * 2.065255,
                size.width * 0.04778506, size.height * 0.1312806),
            bottomRight: Radius.circular(size.width * 0.001594051),
            bottomLeft: Radius.circular(size.width * 0.001594051),
            topLeft: Radius.circular(size.width * 0.001594051),
            topRight: Radius.circular(size.width * 0.001594051)),
        paint74Stroke);

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

    // Paint paint75Stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009191897;
    // paint75Stroke.color = Color.fromARGB(255, 117, 36, 36).withOpacity(1);
    // paint75Stroke.strokeCap = StrokeCap.round;
    // canvas.drawPath(path_75, paint75Stroke);

    // Paint paint76Stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0009120650;
    // paint76Stroke.color = Color.fromARGB(255, 186, 186, 186).withOpacity(1);
    // paint76Stroke.strokeCap = StrokeCap.round;
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.8177198, size.height * 0.01141999,
    //             size.width * 0.1686892, size.height * 0.1313042),
    //         bottomRight: Radius.circular(size.width * 0.001588933),
    //         bottomLeft: Radius.circular(size.width * 0.001588933),
    //         topLeft: Radius.circular(size.width * 0.001588933),
    //         topRight: Radius.circular(size.width * 0.001588933)),
    //     paint76Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
