import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.8213077790304396).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.color = Color(0xff474747).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1755919, size.height * 0.4169526,
                size.width * 0.03325817, size.height * 0.04667124),
            bottomRight: Radius.circular(size.width * 0.003100338),
            bottomLeft: Radius.circular(size.width * 0.003100338),
            topLeft: Radius.circular(size.width * 0.003100338),
            topRight: Radius.circular(size.width * 0.003100338)),
        paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1755919, size.height * 0.4169526,
                size.width * 0.03325817, size.height * 0.04667124),
            bottomRight: Radius.circular(size.width * 0.003100338),
            bottomLeft: Radius.circular(size.width * 0.003100338),
            topLeft: Radius.circular(size.width * 0.003100338),
            topRight: Radius.circular(size.width * 0.003100338)),
        paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1920924, size.height * 0.4307838);
    path_1.cubicTo(
        size.width * 0.1914126,
        size.height * 0.4316733,
        size.width * 0.1911184,
        size.height * 0.4323157,
        size.width * 0.1911184,
        size.height * 0.4329828);
    path_1.cubicTo(
        size.width * 0.1911184,
        size.height * 0.4337612,
        size.width * 0.1914532,
        size.height * 0.4343294,
        size.width * 0.1919707,
        size.height * 0.4343294);
    path_1.cubicTo(
        size.width * 0.1924070,
        size.height * 0.4343294,
        size.width * 0.1927621,
        size.height * 0.4338847,
        size.width * 0.1927621,
        size.height * 0.4333658);
    path_1.cubicTo(
        size.width * 0.1927621,
        size.height * 0.4328346,
        size.width * 0.1924171,
        size.height * 0.4323898,
        size.width * 0.1919910,
        size.height * 0.4323898);
    path_1.cubicTo(
        size.width * 0.1920722,
        size.height * 0.4319945,
        size.width * 0.1922751,
        size.height * 0.4315992,
        size.width * 0.1925795,
        size.height * 0.4312286);
    path_1.lineTo(size.width * 0.1920924, size.height * 0.4307838);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_2_stroke.color = Color(0xff474747).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1755919, size.height * 0.4684283,
                size.width * 0.04791432, size.height * 0.04667124),
            bottomRight: Radius.circular(size.width * 0.003100338),
            bottomLeft: Radius.circular(size.width * 0.003100338),
            topLeft: Radius.circular(size.width * 0.003100338),
            topRight: Radius.circular(size.width * 0.003100338)),
        paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1755919, size.height * 0.4684283,
                size.width * 0.04791432, size.height * 0.04667124),
            bottomRight: Radius.circular(size.width * 0.003100338),
            bottomLeft: Radius.circular(size.width * 0.003100338),
            topLeft: Radius.circular(size.width * 0.003100338),
            topRight: Radius.circular(size.width * 0.003100338)),
        paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.1941939, size.height * 0.4947014);
    path_3.cubicTo(
        size.width * 0.1940699,
        size.height * 0.4948524,
        size.width * 0.1938557,
        size.height * 0.4949623,
        size.width * 0.1936189,
        size.height * 0.4949623);
    path_3.cubicTo(
        size.width * 0.1932920,
        size.height * 0.4949623,
        size.width * 0.1930440,
        size.height * 0.4946191,
        size.width * 0.1930440,
        size.height * 0.4941386);
    path_3.lineTo(size.width * 0.1930440, size.height * 0.4905148);
    path_3.lineTo(size.width * 0.1943630, size.height * 0.4905148);
    path_3.lineTo(size.width * 0.1943630, size.height * 0.4891283);
    path_3.lineTo(size.width * 0.1930440, size.height * 0.4891283);
    path_3.lineTo(size.width * 0.1930440, size.height * 0.4871791);
    path_3.lineTo(size.width * 0.1917024, size.height * 0.4871791);
    path_3.lineTo(size.width * 0.1917024, size.height * 0.4891283);
    path_3.lineTo(size.width * 0.1908568, size.height * 0.4891283);
    path_3.lineTo(size.width * 0.1908568, size.height * 0.4905148);
    path_3.lineTo(size.width * 0.1917024, size.height * 0.4905148);
    path_3.lineTo(size.width * 0.1917024, size.height * 0.4943445);
    path_3.cubicTo(
        size.width * 0.1917024,
        size.height * 0.4955388,
        size.width * 0.1923788,
        size.height * 0.4963898,
        size.width * 0.1933484,
        size.height * 0.4963898);
    path_3.cubicTo(
        size.width * 0.1937880,
        size.height * 0.4963898,
        size.width * 0.1942616,
        size.height * 0.4961702,
        size.width * 0.1945885,
        size.height * 0.4958270);
    path_3.lineTo(size.width * 0.1941939, size.height * 0.4947014);
    path_3.close();
    path_3.moveTo(size.width * 0.1981928, size.height * 0.4889636);
    path_3.cubicTo(
        size.width * 0.1974600,
        size.height * 0.4889636,
        size.width * 0.1966933,
        size.height * 0.4892107,
        size.width * 0.1958703,
        size.height * 0.4897049);
    path_3.lineTo(size.width * 0.1963439, size.height * 0.4908717);
    path_3.cubicTo(
        size.width * 0.1968399,
        size.height * 0.4905697,
        size.width * 0.1973698,
        size.height * 0.4903363,
        size.width * 0.1979222,
        size.height * 0.4903363);
    path_3.cubicTo(
        size.width * 0.1989820,
        size.height * 0.4903363,
        size.width * 0.1993540,
        size.height * 0.4911325,
        size.width * 0.1993540,
        size.height * 0.4919561);
    path_3.lineTo(size.width * 0.1993540, size.height * 0.4921482);
    path_3.cubicTo(
        size.width * 0.1988241,
        size.height * 0.4919012,
        size.width * 0.1982492,
        size.height * 0.4917639,
        size.width * 0.1977193,
        size.height * 0.4917639);
    path_3.cubicTo(
        size.width * 0.1964115,
        size.height * 0.4917639,
        size.width * 0.1953405,
        size.height * 0.4927248,
        size.width * 0.1953405,
        size.height * 0.4941249);
    path_3.cubicTo(
        size.width * 0.1953405,
        size.height * 0.4954976,
        size.width * 0.1962762,
        size.height * 0.4963898,
        size.width * 0.1975163,
        size.height * 0.4963898);
    path_3.cubicTo(
        size.width * 0.1981928,
        size.height * 0.4963898,
        size.width * 0.1989256,
        size.height * 0.4960329,
        size.width * 0.1993540,
        size.height * 0.4953741);
    path_3.lineTo(size.width * 0.1993540, size.height * 0.4962251);
    path_3.lineTo(size.width * 0.2006956, size.height * 0.4962251);
    path_3.lineTo(size.width * 0.2006956, size.height * 0.4919561);
    path_3.cubicTo(
        size.width * 0.2006956,
        size.height * 0.4901579,
        size.width * 0.1997373,
        size.height * 0.4889636,
        size.width * 0.1981928,
        size.height * 0.4889636);
    path_3.close();
    path_3.moveTo(size.width * 0.1978207, size.height * 0.4951682);
    path_3.cubicTo(
        size.width * 0.1971669,
        size.height * 0.4951682,
        size.width * 0.1966821,
        size.height * 0.4947426,
        size.width * 0.1966821,
        size.height * 0.4940700);
    path_3.cubicTo(
        size.width * 0.1966821,
        size.height * 0.4933974,
        size.width * 0.1972345,
        size.height * 0.4929307,
        size.width * 0.1979222,
        size.height * 0.4929307);
    path_3.cubicTo(
        size.width * 0.1984408,
        size.height * 0.4929307,
        size.width * 0.1989256,
        size.height * 0.4930268,
        size.width * 0.1993540,
        size.height * 0.4932052);
    path_3.lineTo(size.width * 0.1993540, size.height * 0.4940014);
    path_3.cubicTo(
        size.width * 0.1991962,
        size.height * 0.4947563,
        size.width * 0.1984859,
        size.height * 0.4951682,
        size.width * 0.1978207,
        size.height * 0.4951682);
    path_3.close();
    path_3.moveTo(size.width * 0.2056234, size.height * 0.4889636);
    path_3.cubicTo(
        size.width * 0.2047554,
        size.height * 0.4889636,
        size.width * 0.2040564,
        size.height * 0.4894441,
        size.width * 0.2035941,
        size.height * 0.4902539);
    path_3.lineTo(size.width * 0.2035941, size.height * 0.4866301);
    path_3.lineTo(size.width * 0.2022187, size.height * 0.4866301);
    path_3.lineTo(size.width * 0.2022187, size.height * 0.4962251);
    path_3.lineTo(size.width * 0.2035941, size.height * 0.4962251);
    path_3.lineTo(size.width * 0.2035941, size.height * 0.4950995);
    path_3.cubicTo(
        size.width * 0.2040564,
        size.height * 0.4959094,
        size.width * 0.2047554,
        size.height * 0.4963898,
        size.width * 0.2056234,
        size.height * 0.4963898);
    path_3.cubicTo(
        size.width * 0.2071680,
        size.height * 0.4963898,
        size.width * 0.2082954,
        size.height * 0.4948524,
        size.width * 0.2082954,
        size.height * 0.4926699);
    path_3.cubicTo(
        size.width * 0.2082954,
        size.height * 0.4905010,
        size.width * 0.2071680,
        size.height * 0.4889636,
        size.width * 0.2056234,
        size.height * 0.4889636);
    path_3.close();
    path_3.moveTo(size.width * 0.2052514, size.height * 0.4949623);
    path_3.cubicTo(
        size.width * 0.2042818,
        size.height * 0.4949623,
        size.width * 0.2036054,
        size.height * 0.4940014,
        size.width * 0.2036054,
        size.height * 0.4926699);
    path_3.cubicTo(
        size.width * 0.2036054,
        size.height * 0.4913384,
        size.width * 0.2042818,
        size.height * 0.4903912,
        size.width * 0.2052514,
        size.height * 0.4903912);
    path_3.cubicTo(
        size.width * 0.2062322,
        size.height * 0.4903912,
        size.width * 0.2069312,
        size.height * 0.4913384,
        size.width * 0.2069312,
        size.height * 0.4926699);
    path_3.cubicTo(
        size.width * 0.2069312,
        size.height * 0.4940014,
        size.width * 0.2062322,
        size.height * 0.4949623,
        size.width * 0.2052514,
        size.height * 0.4949623);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    // Paint paint_4_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_4_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.5205903,
    //             size.width * 0.06426156, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_4_stroke);

    // Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    // paint_4_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.5205903,
    //             size.width * 0.06426156, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_4_fill);

    // Path path_5 = Path();
    // path_5.moveTo(size.width * 0.1856370, size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.1865614,
    //     size.height * 0.5485518,
    //     size.width * 0.1873393,
    //     size.height * 0.5480851,
    //     size.width * 0.1879030,
    //     size.height * 0.5473576);
    // path_5.lineTo(size.width * 0.1869786, size.height * 0.5463830);
    // path_5.cubicTo(
    //     size.width * 0.1866516,
    //     size.height * 0.5468360,
    //     size.width * 0.1861556,
    //     size.height * 0.5471242,
    //     size.width * 0.1856483,
    //     size.height * 0.5471242);
    // path_5.cubicTo(
    //     size.width * 0.1846900,
    //     size.height * 0.5471242,
    //     size.width * 0.1838895,
    //     size.height * 0.5460810,
    //     size.width * 0.1838895,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.1838895,
    //     size.height * 0.5435964,
    //     size.width * 0.1846900,
    //     size.height * 0.5425532,
    //     size.width * 0.1856483,
    //     size.height * 0.5425532);
    // path_5.cubicTo(
    //     size.width * 0.1861443,
    //     size.height * 0.5425532,
    //     size.width * 0.1866291,
    //     size.height * 0.5428415,
    //     size.width * 0.1869448,
    //     size.height * 0.5432670);
    // path_5.lineTo(size.width * 0.1878692, size.height * 0.5422787);
    // path_5.cubicTo(
    //     size.width * 0.1873168,
    //     size.height * 0.5415786,
    //     size.width * 0.1865389,
    //     size.height * 0.5411256,
    //     size.width * 0.1856595,
    //     size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.1839572,
    //     size.height * 0.5411256,
    //     size.width * 0.1825254,
    //     size.height * 0.5428140,
    //     size.width * 0.1825254,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.1825254,
    //     size.height * 0.5468497,
    //     size.width * 0.1839572,
    //     size.height * 0.5485518,
    //     size.width * 0.1856370,
    //     size.height * 0.5485518);
    // path_5.close();
    // path_5.moveTo(size.width * 0.1915209, size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.1907880,
    //     size.height * 0.5411256,
    //     size.width * 0.1900214,
    //     size.height * 0.5413727,
    //     size.width * 0.1891984,
    //     size.height * 0.5418668);
    // path_5.lineTo(size.width * 0.1896719, size.height * 0.5430336);
    // path_5.cubicTo(
    //     size.width * 0.1901680,
    //     size.height * 0.5427316,
    //     size.width * 0.1906979,
    //     size.height * 0.5424983,
    //     size.width * 0.1912503,
    //     size.height * 0.5424983);
    // path_5.cubicTo(
    //     size.width * 0.1923100,
    //     size.height * 0.5424983,
    //     size.width * 0.1926821,
    //     size.height * 0.5432944,
    //     size.width * 0.1926821,
    //     size.height * 0.5441181);
    // path_5.lineTo(size.width * 0.1926821, size.height * 0.5443102);
    // path_5.cubicTo(
    //     size.width * 0.1921522,
    //     size.height * 0.5440631,
    //     size.width * 0.1915772,
    //     size.height * 0.5439259,
    //     size.width * 0.1910474,
    //     size.height * 0.5439259);
    // path_5.cubicTo(
    //     size.width * 0.1897396,
    //     size.height * 0.5439259,
    //     size.width * 0.1886685,
    //     size.height * 0.5448868,
    //     size.width * 0.1886685,
    //     size.height * 0.5462869);
    // path_5.cubicTo(
    //     size.width * 0.1886685,
    //     size.height * 0.5476596,
    //     size.width * 0.1896043,
    //     size.height * 0.5485518,
    //     size.width * 0.1908444,
    //     size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.1915209,
    //     size.height * 0.5485518,
    //     size.width * 0.1922537,
    //     size.height * 0.5481949,
    //     size.width * 0.1926821,
    //     size.height * 0.5475360);
    // path_5.lineTo(size.width * 0.1926821, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.1940237, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.1940237, size.height * 0.5441181);
    // path_5.cubicTo(
    //     size.width * 0.1940237,
    //     size.height * 0.5423198,
    //     size.width * 0.1930654,
    //     size.height * 0.5411256,
    //     size.width * 0.1915209,
    //     size.height * 0.5411256);
    // path_5.close();
    // path_5.moveTo(size.width * 0.1911488, size.height * 0.5473301);
    // path_5.cubicTo(
    //     size.width * 0.1904949,
    //     size.height * 0.5473301,
    //     size.width * 0.1900101,
    //     size.height * 0.5469046,
    //     size.width * 0.1900101,
    //     size.height * 0.5462320);
    // path_5.cubicTo(
    //     size.width * 0.1900101,
    //     size.height * 0.5455594,
    //     size.width * 0.1905626,
    //     size.height * 0.5450927,
    //     size.width * 0.1912503,
    //     size.height * 0.5450927);
    // path_5.cubicTo(
    //     size.width * 0.1917689,
    //     size.height * 0.5450927,
    //     size.width * 0.1922537,
    //     size.height * 0.5451887,
    //     size.width * 0.1926821,
    //     size.height * 0.5453672);
    // path_5.lineTo(size.width * 0.1926821, size.height * 0.5461633);
    // path_5.cubicTo(
    //     size.width * 0.1925242,
    //     size.height * 0.5469183,
    //     size.width * 0.1918140,
    //     size.height * 0.5473301,
    //     size.width * 0.1911488,
    //     size.height * 0.5473301);
    // path_5.close();
    // path_5.moveTo(size.width * 0.1989515, size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.1980834,
    //     size.height * 0.5411256,
    //     size.width * 0.1973844,
    //     size.height * 0.5416060,
    //     size.width * 0.1969222,
    //     size.height * 0.5424159);
    // path_5.lineTo(size.width * 0.1969222, size.height * 0.5412903);
    // path_5.lineTo(size.width * 0.1955468, size.height * 0.5412903);
    // path_5.lineTo(size.width * 0.1955468, size.height * 0.5507481);
    // path_5.lineTo(size.width * 0.1969222, size.height * 0.5507481);
    // path_5.lineTo(size.width * 0.1969222, size.height * 0.5472615);
    // path_5.cubicTo(
    //     size.width * 0.1973844,
    //     size.height * 0.5480714,
    //     size.width * 0.1980834,
    //     size.height * 0.5485518,
    //     size.width * 0.1989515,
    //     size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.2004961,
    //     size.height * 0.5485518,
    //     size.width * 0.2016234,
    //     size.height * 0.5470144,
    //     size.width * 0.2016234,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2016234,
    //     size.height * 0.5426630,
    //     size.width * 0.2004961,
    //     size.height * 0.5411256,
    //     size.width * 0.1989515,
    //     size.height * 0.5411256);
    // path_5.close();
    // path_5.moveTo(size.width * 0.1985795, size.height * 0.5471242);
    // path_5.cubicTo(
    //     size.width * 0.1976099,
    //     size.height * 0.5471242,
    //     size.width * 0.1969335,
    //     size.height * 0.5461633,
    //     size.width * 0.1969335,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.1969335,
    //     size.height * 0.5435003,
    //     size.width * 0.1976099,
    //     size.height * 0.5425532,
    //     size.width * 0.1985795,
    //     size.height * 0.5425532);
    // path_5.cubicTo(
    //     size.width * 0.1995603,
    //     size.height * 0.5425532,
    //     size.width * 0.2002593,
    //     size.height * 0.5435003,
    //     size.width * 0.2002593,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2002593,
    //     size.height * 0.5461633,
    //     size.width * 0.1995603,
    //     size.height * 0.5471242,
    //     size.width * 0.1985795,
    //     size.height * 0.5471242);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2050209, size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.2063850,
    //     size.height * 0.5485518,
    //     size.width * 0.2073095,
    //     size.height * 0.5476733,
    //     size.width * 0.2073095,
    //     size.height * 0.5463143);
    // path_5.cubicTo(
    //     size.width * 0.2073095,
    //     size.height * 0.5448318,
    //     size.width * 0.2062497,
    //     size.height * 0.5444200,
    //     size.width * 0.2052689,
    //     size.height * 0.5440906);
    // path_5.cubicTo(
    //     size.width * 0.2043782,
    //     size.height * 0.5437749,
    //     size.width * 0.2040738,
    //     size.height * 0.5436376,
    //     size.width * 0.2040738,
    //     size.height * 0.5431846);
    // path_5.cubicTo(
    //     size.width * 0.2040738,
    //     size.height * 0.5427865,
    //     size.width * 0.2044459,
    //     size.height * 0.5425532,
    //     size.width * 0.2049307,
    //     size.height * 0.5425532);
    // path_5.cubicTo(
    //     size.width * 0.2054380,
    //     size.height * 0.5425532,
    //     size.width * 0.2060355,
    //     size.height * 0.5427728,
    //     size.width * 0.2065879,
    //     size.height * 0.5431984);
    // path_5.lineTo(size.width * 0.2071629, size.height * 0.5419767);
    // path_5.cubicTo(
    //     size.width * 0.2065316,
    //     size.height * 0.5414688,
    //     size.width * 0.2057311,
    //     size.height * 0.5411256,
    //     size.width * 0.2049307,
    //     size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.2036342,
    //     size.height * 0.5411256,
    //     size.width * 0.2027322,
    //     size.height * 0.5420316,
    //     size.width * 0.2027322,
    //     size.height * 0.5433631);
    // path_5.cubicTo(
    //     size.width * 0.2027435,
    //     size.height * 0.5446259,
    //     size.width * 0.2035440,
    //     size.height * 0.5450652,
    //     size.width * 0.2048067,
    //     size.height * 0.5454633);
    // path_5.cubicTo(
    //     size.width * 0.2054718,
    //     size.height * 0.5456829,
    //     size.width * 0.2059791,
    //     size.height * 0.5458614,
    //     size.width * 0.2059791,
    //     size.height * 0.5464104);
    // path_5.cubicTo(
    //     size.width * 0.2059791,
    //     size.height * 0.5468497,
    //     size.width * 0.2055958,
    //     size.height * 0.5471380,
    //     size.width * 0.2050434,
    //     size.height * 0.5471380);
    // path_5.cubicTo(
    //     size.width * 0.2043106,
    //     size.height * 0.5471380,
    //     size.width * 0.2036567,
    //     size.height * 0.5468085,
    //     size.width * 0.2030930,
    //     size.height * 0.5463143);
    // path_5.lineTo(size.width * 0.2024729, size.height * 0.5474811);
    // path_5.cubicTo(
    //     size.width * 0.2031719,
    //     size.height * 0.5481675,
    //     size.width * 0.2041302,
    //     size.height * 0.5485518,
    //     size.width * 0.2050209,
    //     size.height * 0.5485518);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2116973, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2130727, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2130727, size.height * 0.5387920);
    // path_5.lineTo(size.width * 0.2116973, size.height * 0.5387920);
    // path_5.lineTo(size.width * 0.2116973, size.height * 0.5483871);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2174115, size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.2191026,
    //     size.height * 0.5485518,
    //     size.width * 0.2205344,
    //     size.height * 0.5468497,
    //     size.width * 0.2205344,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2205344,
    //     size.height * 0.5428140,
    //     size.width * 0.2191026,
    //     size.height * 0.5411256,
    //     size.width * 0.2174115,
    //     size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.2157204,
    //     size.height * 0.5411256,
    //     size.width * 0.2142886,
    //     size.height * 0.5428140,
    //     size.width * 0.2142886,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2142886,
    //     size.height * 0.5468497,
    //     size.width * 0.2157204,
    //     size.height * 0.5485518,
    //     size.width * 0.2174115,
    //     size.height * 0.5485518);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2174115, size.height * 0.5471242);
    // path_5.cubicTo(
    //     size.width * 0.2164419,
    //     size.height * 0.5471242,
    //     size.width * 0.2156302,
    //     size.height * 0.5460810,
    //     size.width * 0.2156302,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2156302,
    //     size.height * 0.5435964,
    //     size.width * 0.2164419,
    //     size.height * 0.5425532,
    //     size.width * 0.2174115,
    //     size.height * 0.5425532);
    // path_5.cubicTo(
    //     size.width * 0.2183698,
    //     size.height * 0.5425532,
    //     size.width * 0.2191815,
    //     size.height * 0.5435964,
    //     size.width * 0.2191815,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2191815,
    //     size.height * 0.5460810,
    //     size.width * 0.2183698,
    //     size.height * 0.5471242,
    //     size.width * 0.2174115,
    //     size.height * 0.5471242);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2245344, size.height * 0.5485518);
    // path_5.cubicTo(
    //     size.width * 0.2254589,
    //     size.height * 0.5485518,
    //     size.width * 0.2262368,
    //     size.height * 0.5480851,
    //     size.width * 0.2268005,
    //     size.height * 0.5473576);
    // path_5.lineTo(size.width * 0.2258760, size.height * 0.5463830);
    // path_5.cubicTo(
    //     size.width * 0.2255490,
    //     size.height * 0.5468360,
    //     size.width * 0.2250530,
    //     size.height * 0.5471242,
    //     size.width * 0.2245457,
    //     size.height * 0.5471242);
    // path_5.cubicTo(
    //     size.width * 0.2235874,
    //     size.height * 0.5471242,
    //     size.width * 0.2227869,
    //     size.height * 0.5460810,
    //     size.width * 0.2227869,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2227869,
    //     size.height * 0.5435964,
    //     size.width * 0.2235874,
    //     size.height * 0.5425532,
    //     size.width * 0.2245457,
    //     size.height * 0.5425532);
    // path_5.cubicTo(
    //     size.width * 0.2250417,
    //     size.height * 0.5425532,
    //     size.width * 0.2255265,
    //     size.height * 0.5428415,
    //     size.width * 0.2258422,
    //     size.height * 0.5432670);
    // path_5.lineTo(size.width * 0.2267666, size.height * 0.5422787);
    // path_5.cubicTo(
    //     size.width * 0.2262142,
    //     size.height * 0.5415786,
    //     size.width * 0.2254363,
    //     size.height * 0.5411256,
    //     size.width * 0.2245569,
    //     size.height * 0.5411256);
    // path_5.cubicTo(
    //     size.width * 0.2228546,
    //     size.height * 0.5411256,
    //     size.width * 0.2214228,
    //     size.height * 0.5428140,
    //     size.width * 0.2214228,
    //     size.height * 0.5448318);
    // path_5.cubicTo(
    //     size.width * 0.2214228,
    //     size.height * 0.5468497,
    //     size.width * 0.2228546,
    //     size.height * 0.5485518,
    //     size.width * 0.2245344,
    //     size.height * 0.5485518);
    // path_5.close();
    // path_5.moveTo(size.width * 0.2333833, size.height * 0.5412903);
    // path_5.lineTo(size.width * 0.2317599, size.height * 0.5412903);
    // path_5.lineTo(size.width * 0.2292345, size.height * 0.5446534);
    // path_5.lineTo(size.width * 0.2292345, size.height * 0.5387920);
    // path_5.lineTo(size.width * 0.2278591, size.height * 0.5387920);
    // path_5.lineTo(size.width * 0.2278591, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2292345, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2292345, size.height * 0.5466163);
    // path_5.lineTo(size.width * 0.2300575, size.height * 0.5455594);
    // path_5.lineTo(size.width * 0.2317035, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2333044, size.height * 0.5483871);
    // path_5.lineTo(size.width * 0.2309820, size.height * 0.5444612);
    // path_5.lineTo(size.width * 0.2333833, size.height * 0.5412903);
    // path_5.close();

    // Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    // paint_5_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_5, paint_5_fill);

    // Paint paint_6_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_6_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.5720659,
    //             size.width * 0.08793687, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_6_stroke);

    // Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    // paint_6_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.5720659,
    //             size.width * 0.08793687, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_6_fill);

    // Path path_7 = Path();
    // path_7.moveTo(size.width * 0.2373563, size.height * 0.5940769);
    // path_7.lineTo(size.width * 0.2339346, size.height * 0.5899108);
    // path_7.lineTo(size.width * 0.2305130, size.height * 0.5940769);

    // Paint paint_7_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_7_stroke.color = Colors.white.withOpacity(1.0);
    // paint_7_stroke.strokeCap = StrokeCap.round;
    // paint_7_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_7, paint_7_stroke);

    // Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    // paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_7, paint_7_fill);

    // Path path_8 = Path();
    // path_8.moveTo(size.width * 0.2339346, size.height * 0.6015786);
    // path_8.lineTo(size.width * 0.2339346, size.height * 0.5900275);

    // Paint paint_8_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_8_stroke.color = Colors.white.withOpacity(1.0);
    // paint_8_stroke.strokeCap = StrokeCap.round;
    // paint_8_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_8, paint_8_stroke);

    // Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    // paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_8, paint_8_fill);

    // Path path_9 = Path();
    // path_9.moveTo(size.width * 0.2013303, size.height * 0.6000275);
    // path_9.cubicTo(
    //     size.width * 0.2026945,
    //     size.height * 0.6000275,
    //     size.width * 0.2036189,
    //     size.height * 0.5991489,
    //     size.width * 0.2036189,
    //     size.height * 0.5977900);
    // path_9.cubicTo(
    //     size.width * 0.2036189,
    //     size.height * 0.5963075,
    //     size.width * 0.2025592,
    //     size.height * 0.5958957,
    //     size.width * 0.2015784,
    //     size.height * 0.5955662);
    // path_9.cubicTo(
    //     size.width * 0.2006877,
    //     size.height * 0.5952505,
    //     size.width * 0.2003833,
    //     size.height * 0.5951132,
    //     size.width * 0.2003833,
    //     size.height * 0.5946603);
    // path_9.cubicTo(
    //     size.width * 0.2003833,
    //     size.height * 0.5942622,
    //     size.width * 0.2007554,
    //     size.height * 0.5940288,
    //     size.width * 0.2012401,
    //     size.height * 0.5940288);
    // path_9.cubicTo(
    //     size.width * 0.2017475,
    //     size.height * 0.5940288,
    //     size.width * 0.2023450,
    //     size.height * 0.5942485,
    //     size.width * 0.2028974,
    //     size.height * 0.5946740);
    // path_9.lineTo(size.width * 0.2034724, size.height * 0.5934523);
    // path_9.cubicTo(
    //     size.width * 0.2028410,
    //     size.height * 0.5929444,
    //     size.width * 0.2020406,
    //     size.height * 0.5926012,
    //     size.width * 0.2012401,
    //     size.height * 0.5926012);
    // path_9.cubicTo(
    //     size.width * 0.1999436,
    //     size.height * 0.5926012,
    //     size.width * 0.1990417,
    //     size.height * 0.5935072,
    //     size.width * 0.1990417,
    //     size.height * 0.5948387);
    // path_9.cubicTo(
    //     size.width * 0.1990530,
    //     size.height * 0.5961016,
    //     size.width * 0.1998534,
    //     size.height * 0.5965408,
    //     size.width * 0.2011161,
    //     size.height * 0.5969389);
    // path_9.cubicTo(
    //     size.width * 0.2017813,
    //     size.height * 0.5971585,
    //     size.width * 0.2022886,
    //     size.height * 0.5973370,
    //     size.width * 0.2022886,
    //     size.height * 0.5978861);
    // path_9.cubicTo(
    //     size.width * 0.2022886,
    //     size.height * 0.5983253,
    //     size.width * 0.2019053,
    //     size.height * 0.5986136,
    //     size.width * 0.2013529,
    //     size.height * 0.5986136);
    // path_9.cubicTo(
    //     size.width * 0.2006201,
    //     size.height * 0.5986136,
    //     size.width * 0.1999662,
    //     size.height * 0.5982841,
    //     size.width * 0.1994025,
    //     size.height * 0.5977900);
    // path_9.lineTo(size.width * 0.1987824, size.height * 0.5989568);
    // path_9.cubicTo(
    //     size.width * 0.1994814,
    //     size.height * 0.5996431,
    //     size.width * 0.2004397,
    //     size.height * 0.6000275,
    //     size.width * 0.2013303,
    //     size.height * 0.6000275);
    // path_9.close();
    // path_9.moveTo(size.width * 0.2079932, size.height * 0.5926012);
    // path_9.cubicTo(
    //     size.width * 0.2072153,
    //     size.height * 0.5926012,
    //     size.width * 0.2065276,
    //     size.height * 0.5930542,
    //     size.width * 0.2061781,
    //     size.height * 0.5937406);
    // path_9.lineTo(size.width * 0.2061781, size.height * 0.5902677);
    // path_9.lineTo(size.width * 0.2048027, size.height * 0.5902677);
    // path_9.lineTo(size.width * 0.2048027, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2061781, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2061781, size.height * 0.5955662);
    // path_9.cubicTo(
    //     size.width * 0.2061781,
    //     size.height * 0.5947152,
    //     size.width * 0.2068207,
    //     size.height * 0.5940288,
    //     size.width * 0.2075986,
    //     size.height * 0.5940288);
    // path_9.cubicTo(
    //     size.width * 0.2083202,
    //     size.height * 0.5940288,
    //     size.width * 0.2088275,
    //     size.height * 0.5947152,
    //     size.width * 0.2088275,
    //     size.height * 0.5956760);
    // path_9.lineTo(size.width * 0.2088275, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2101578, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2101578, size.height * 0.5953466);
    // path_9.cubicTo(
    //     size.width * 0.2101578,
    //     size.height * 0.5937406,
    //     size.width * 0.2092672,
    //     size.height * 0.5926012,
    //     size.width * 0.2079932,
    //     size.height * 0.5926012);
    // path_9.close();
    // path_9.moveTo(size.width * 0.2123501, size.height * 0.5916953);
    // path_9.cubicTo(
    //     size.width * 0.2127785,
    //     size.height * 0.5916953,
    //     size.width * 0.2131280,
    //     size.height * 0.5912423,
    //     size.width * 0.2131280,
    //     size.height * 0.5907344);
    // path_9.cubicTo(
    //     size.width * 0.2131280,
    //     size.height * 0.5902265,
    //     size.width * 0.2127785,
    //     size.height * 0.5897872,
    //     size.width * 0.2123501,
    //     size.height * 0.5897872);
    // path_9.cubicTo(
    //     size.width * 0.2119104,
    //     size.height * 0.5897872,
    //     size.width * 0.2115609,
    //     size.height * 0.5902265,
    //     size.width * 0.2115609,
    //     size.height * 0.5907344);
    // path_9.cubicTo(
    //     size.width * 0.2115609,
    //     size.height * 0.5912423,
    //     size.width * 0.2119104,
    //     size.height * 0.5916953,
    //     size.width * 0.2123501,
    //     size.height * 0.5916953);
    // path_9.close();
    // path_9.moveTo(size.width * 0.2116511, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2130265, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2130265, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2116511, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2116511, size.height * 0.5998627);
    // path_9.close();
    // path_9.moveTo(size.width * 0.2163055, size.height * 0.5921757);
    // path_9.cubicTo(
    //     size.width * 0.2163055,
    //     size.height * 0.5916953,
    //     size.width * 0.2165536,
    //     size.height * 0.5913521,
    //     size.width * 0.2168805,
    //     size.height * 0.5913521);
    // path_9.cubicTo(
    //     size.width * 0.2171172,
    //     size.height * 0.5913521,
    //     size.width * 0.2173315,
    //     size.height * 0.5914619,
    //     size.width * 0.2174555,
    //     size.height * 0.5916129);
    // path_9.lineTo(size.width * 0.2178501, size.height * 0.5905422);
    // path_9.cubicTo(
    //     size.width * 0.2175231,
    //     size.height * 0.5901990,
    //     size.width * 0.2170496,
    //     size.height * 0.5899794,
    //     size.width * 0.2166099,
    //     size.height * 0.5899794);
    // path_9.cubicTo(
    //     size.width * 0.2156404,
    //     size.height * 0.5899794,
    //     size.width * 0.2149639,
    //     size.height * 0.5908305,
    //     size.width * 0.2149639,
    //     size.height * 0.5920247);
    // path_9.lineTo(size.width * 0.2149639, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2141184, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2141184, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2149639, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2149639, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2163055, size.height * 0.5998627);
    // path_9.lineTo(size.width * 0.2163055, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2176246, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2176246, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2163055, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2163055, size.height * 0.5921757);
    // path_9.close();
    // path_9.moveTo(size.width * 0.2216280, size.height * 0.5983391);
    // path_9.cubicTo(
    //     size.width * 0.2215039,
    //     size.height * 0.5984900,
    //     size.width * 0.2212897,
    //     size.height * 0.5985999,
    //     size.width * 0.2210530,
    //     size.height * 0.5985999);
    // path_9.cubicTo(
    //     size.width * 0.2207260,
    //     size.height * 0.5985999,
    //     size.width * 0.2204780,
    //     size.height * 0.5982567,
    //     size.width * 0.2204780,
    //     size.height * 0.5977763);
    // path_9.lineTo(size.width * 0.2204780, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2217971, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2217971, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2204780, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2204780, size.height * 0.5908167);
    // path_9.lineTo(size.width * 0.2191364, size.height * 0.5908167);
    // path_9.lineTo(size.width * 0.2191364, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2182909, size.height * 0.5927660);
    // path_9.lineTo(size.width * 0.2182909, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2191364, size.height * 0.5941524);
    // path_9.lineTo(size.width * 0.2191364, size.height * 0.5979822);
    // path_9.cubicTo(
    //     size.width * 0.2191364,
    //     size.height * 0.5991764,
    //     size.width * 0.2198129,
    //     size.height * 0.6000275,
    //     size.width * 0.2207824,
    //     size.height * 0.6000275);
    // path_9.cubicTo(
    //     size.width * 0.2212221,
    //     size.height * 0.6000275,
    //     size.width * 0.2216956,
    //     size.height * 0.5998078,
    //     size.width * 0.2220225,
    //     size.height * 0.5994647);
    // path_9.lineTo(size.width * 0.2216280, size.height * 0.5983391);
    // path_9.close();

    // Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    // paint_9_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_9, paint_9_fill);

    // Paint paint_10_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_10_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2122322, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_10_stroke);

    // Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    // paint_10_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2122322, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_10_fill);

    // Path path_11 = Path();
    // path_11.moveTo(size.width * 0.2309696, size.height * 0.4447495);
    // path_11.lineTo(size.width * 0.2323675, size.height * 0.4447495);
    // path_11.lineTo(size.width * 0.2323675, size.height * 0.4353191);
    // path_11.lineTo(size.width * 0.2312401, size.height * 0.4353191);
    // path_11.lineTo(size.width * 0.2290643, size.height * 0.4371174);
    // path_11.lineTo(size.width * 0.2296392, size.height * 0.4383253);
    // path_11.lineTo(size.width * 0.2309696, size.height * 0.4372958);
    // path_11.lineTo(size.width * 0.2309696, size.height * 0.4447495);
    // path_11.close();

    // Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    // paint_11_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_11, paint_11_fill);

    // Paint paint_12_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_12_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2274521, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_12_stroke);

    // Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    // paint_12_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2274521, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_12_fill);

    // Path path_13 = Path();
    // path_13.moveTo(size.width * 0.2527170, size.height * 0.4915031);
    // path_13.cubicTo(
    //     size.width * 0.2527170,
    //     size.height * 0.4888538,
    //     size.width * 0.2508568,
    //     size.height * 0.4866301,
    //     size.width * 0.2486584,
    //     size.height * 0.4866301);
    // path_13.cubicTo(
    //     size.width * 0.2464487,
    //     size.height * 0.4866301,
    //     size.width * 0.2445885,
    //     size.height * 0.4888538,
    //     size.width * 0.2445885,
    //     size.height * 0.4915031);
    // path_13.cubicTo(
    //     size.width * 0.2445885,
    //     size.height * 0.4941524,
    //     size.width * 0.2464487,
    //     size.height * 0.4963898,
    //     size.width * 0.2486584,
    //     size.height * 0.4963898);
    // path_13.cubicTo(
    //     size.width * 0.2495829,
    //     size.height * 0.4963898,
    //     size.width * 0.2504397,
    //     size.height * 0.4959918,
    //     size.width * 0.2511274,
    //     size.height * 0.4953466);
    // path_13.lineTo(size.width * 0.2519617, size.height * 0.4962251);
    // path_13.lineTo(size.width * 0.2527057, size.height * 0.4951682);
    // path_13.lineTo(size.width * 0.2519278, size.height * 0.4943445);
    // path_13.cubicTo(
    //     size.width * 0.2524239,
    //     size.height * 0.4935484,
    //     size.width * 0.2527170,
    //     size.height * 0.4925601,
    //     size.width * 0.2527170,
    //     size.height * 0.4915031);
    // path_13.close();
    // path_13.moveTo(size.width * 0.2486584, size.height * 0.4948250);
    // path_13.cubicTo(
    //     size.width * 0.2472266,
    //     size.height * 0.4948250,
    //     size.width * 0.2460203,
    //     size.height * 0.4933150,
    //     size.width * 0.2460203,
    //     size.height * 0.4915031);
    // path_13.cubicTo(
    //     size.width * 0.2460203,
    //     size.height * 0.4897049,
    //     size.width * 0.2472266,
    //     size.height * 0.4881949,
    //     size.width * 0.2486584,
    //     size.height * 0.4881949);
    // path_13.cubicTo(
    //     size.width * 0.2500789,
    //     size.height * 0.4881949,
    //     size.width * 0.2512740,
    //     size.height * 0.4897049,
    //     size.width * 0.2512740,
    //     size.height * 0.4915031);
    // path_13.cubicTo(
    //     size.width * 0.2512740,
    //     size.height * 0.4921345,
    //     size.width * 0.2511274,
    //     size.height * 0.4927248,
    //     size.width * 0.2508794,
    //     size.height * 0.4932327);
    // path_13.lineTo(size.width * 0.2498422, size.height * 0.4921345);
    // path_13.lineTo(size.width * 0.2490981, size.height * 0.4931915);
    // path_13.lineTo(size.width * 0.2501015, size.height * 0.4942622);
    // path_13.cubicTo(
    //     size.width * 0.2496843,
    //     size.height * 0.4946191,
    //     size.width * 0.2491883,
    //     size.height * 0.4948250,
    //     size.width * 0.2486584,
    //     size.height * 0.4948250);
    // path_13.close();

    // Paint paint_13_fill = Paint()..style = PaintingStyle.fill;
    // paint_13_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_13, paint_13_fill);

    // Paint paint_14_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_14_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2432356, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_14_stroke);

    // Paint paint_14_fill = Paint()..style = PaintingStyle.fill;
    // paint_14_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2432356, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_14_fill);

    // Path path_15 = Path();
    // path_15.moveTo(size.width * 0.2665614, size.height * 0.5483871);
    // path_15.lineTo(size.width * 0.2681172, size.height * 0.5483871);
    // path_15.lineTo(size.width * 0.2648816, size.height * 0.5389568);
    // path_15.lineTo(size.width * 0.2633145, size.height * 0.5389568);
    // path_15.lineTo(size.width * 0.2600789, size.height * 0.5483871);
    // path_15.lineTo(size.width * 0.2616460, size.height * 0.5483871);
    // path_15.lineTo(size.width * 0.2622322, size.height * 0.5466850);
    // path_15.lineTo(size.width * 0.2659752, size.height * 0.5466850);
    // path_15.lineTo(size.width * 0.2665614, size.height * 0.5483871);
    // path_15.close();
    // path_15.moveTo(size.width * 0.2627396, size.height * 0.5452025);
    // path_15.lineTo(size.width * 0.2641037, size.height * 0.5412354);
    // path_15.lineTo(size.width * 0.2654679, size.height * 0.5452025);
    // path_15.lineTo(size.width * 0.2627396, size.height * 0.5452025);
    // path_15.close();

    // Paint paint_15_fill = Paint()..style = PaintingStyle.fill;
    // paint_15_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_15, paint_15_fill);

    // Paint paint_16_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_16_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2669109, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_16_stroke);

    // Paint paint_16_fill = Paint()..style = PaintingStyle.fill;
    // paint_16_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2669109, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_16_fill);

    // Path path_17 = Path();
    // path_17.moveTo(size.width * 0.2841150, size.height * 0.5998627);
    // path_17.lineTo(size.width * 0.2903608, size.height * 0.5998627);
    // path_17.lineTo(size.width * 0.2903608, size.height * 0.5982979);
    // path_17.lineTo(size.width * 0.2860428, size.height * 0.5982979);
    // path_17.lineTo(size.width * 0.2903044, size.height * 0.5917364);
    // path_17.lineTo(size.width * 0.2903044, size.height * 0.5904324);
    // path_17.lineTo(size.width * 0.2841939, size.height * 0.5904324);
    // path_17.lineTo(size.width * 0.2841939, size.height * 0.5919973);
    // path_17.lineTo(size.width * 0.2883878, size.height * 0.5919973);
    // path_17.lineTo(size.width * 0.2841150, size.height * 0.5985587);
    // path_17.lineTo(size.width * 0.2841150, size.height * 0.5998627);
    // path_17.close();

    // Paint paint_17_fill = Paint()..style = PaintingStyle.fill;
    // paint_17_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_17, paint_17_fill);

    // Paint paint_18_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_18_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.6228552,
    //             size.width * 0.04340474, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_18_stroke);

    // Paint paint_18_fill = Paint()..style = PaintingStyle.fill;
    // paint_18_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.6228552,
    //             size.width * 0.04340474, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_18_fill);

    // Path path_19 = Path();
    // path_19.moveTo(size.width * 0.1918377, size.height * 0.6508167);
    // path_19.cubicTo(
    //     size.width * 0.1927621,
    //     size.height * 0.6508167,
    //     size.width * 0.1935400,
    //     size.height * 0.6503500,
    //     size.width * 0.1941037,
    //     size.height * 0.6496225);
    // path_19.lineTo(size.width * 0.1931793, size.height * 0.6486479);
    // path_19.cubicTo(
    //     size.width * 0.1928523,
    //     size.height * 0.6491009,
    //     size.width * 0.1923563,
    //     size.height * 0.6493892,
    //     size.width * 0.1918489,
    //     size.height * 0.6493892);
    // path_19.cubicTo(
    //     size.width * 0.1908906,
    //     size.height * 0.6493892,
    //     size.width * 0.1900902,
    //     size.height * 0.6483459,
    //     size.width * 0.1900902,
    //     size.height * 0.6470968);
    // path_19.cubicTo(
    //     size.width * 0.1900902,
    //     size.height * 0.6458614,
    //     size.width * 0.1908906,
    //     size.height * 0.6448181,
    //     size.width * 0.1918489,
    //     size.height * 0.6448181);
    // path_19.cubicTo(
    //     size.width * 0.1923450,
    //     size.height * 0.6448181,
    //     size.width * 0.1928298,
    //     size.height * 0.6451064,
    //     size.width * 0.1931454,
    //     size.height * 0.6455319);
    // path_19.lineTo(size.width * 0.1940699, size.height * 0.6445436);
    // path_19.cubicTo(
    //     size.width * 0.1935175,
    //     size.height * 0.6438435,
    //     size.width * 0.1927396,
    //     size.height * 0.6433905,
    //     size.width * 0.1918602,
    //     size.height * 0.6433905);
    // path_19.cubicTo(
    //     size.width * 0.1901578,
    //     size.height * 0.6433905,
    //     size.width * 0.1887260,
    //     size.height * 0.6450789,
    //     size.width * 0.1887260,
    //     size.height * 0.6470968);
    // path_19.cubicTo(
    //     size.width * 0.1887260,
    //     size.height * 0.6491146,
    //     size.width * 0.1901578,
    //     size.height * 0.6508167,
    //     size.width * 0.1918377,
    //     size.height * 0.6508167);
    // path_19.close();
    // path_19.moveTo(size.width * 0.1980936, size.height * 0.6491283);
    // path_19.cubicTo(
    //     size.width * 0.1979696,
    //     size.height * 0.6492793,
    //     size.width * 0.1977554,
    //     size.height * 0.6493892,
    //     size.width * 0.1975186,
    //     size.height * 0.6493892);
    // path_19.cubicTo(
    //     size.width * 0.1971917,
    //     size.height * 0.6493892,
    //     size.width * 0.1969436,
    //     size.height * 0.6490460,
    //     size.width * 0.1969436,
    //     size.height * 0.6485655);
    // path_19.lineTo(size.width * 0.1969436, size.height * 0.6449417);
    // path_19.lineTo(size.width * 0.1982627, size.height * 0.6449417);
    // path_19.lineTo(size.width * 0.1982627, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1969436, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1969436, size.height * 0.6416060);
    // path_19.lineTo(size.width * 0.1956020, size.height * 0.6416060);
    // path_19.lineTo(size.width * 0.1956020, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1947565, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1947565, size.height * 0.6449417);
    // path_19.lineTo(size.width * 0.1956020, size.height * 0.6449417);
    // path_19.lineTo(size.width * 0.1956020, size.height * 0.6487714);
    // path_19.cubicTo(
    //     size.width * 0.1956020,
    //     size.height * 0.6499657,
    //     size.width * 0.1962785,
    //     size.height * 0.6508167,
    //     size.width * 0.1972480,
    //     size.height * 0.6508167);
    // path_19.cubicTo(
    //     size.width * 0.1976877,
    //     size.height * 0.6508167,
    //     size.width * 0.1981612,
    //     size.height * 0.6505971,
    //     size.width * 0.1984882,
    //     size.height * 0.6502539);
    // path_19.lineTo(size.width * 0.1980936, size.height * 0.6491283);
    // path_19.close();
    // path_19.moveTo(size.width * 0.2009651, size.height * 0.6449279);
    // path_19.lineTo(size.width * 0.2009651, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1995896, size.height * 0.6435553);
    // path_19.lineTo(size.width * 0.1995896, size.height * 0.6506520);
    // path_19.lineTo(size.width * 0.2009651, size.height * 0.6506520);
    // path_19.lineTo(size.width * 0.2009651, size.height * 0.6470693);
    // path_19.cubicTo(
    //     size.width * 0.2009651,
    //     size.height * 0.6457241,
    //     size.width * 0.2017993,
    //     size.height * 0.6448181,
    //     size.width * 0.2030507,
    //     size.height * 0.6448181);
    // path_19.lineTo(size.width * 0.2030507, size.height * 0.6433905);
    // path_19.cubicTo(
    //     size.width * 0.2020924,
    //     size.height * 0.6433905,
    //     size.width * 0.2013371,
    //     size.height * 0.6439808,
    //     size.width * 0.2009651,
    //     size.height * 0.6449279);
    // path_19.close();
    // path_19.moveTo(size.width * 0.2040699, size.height * 0.6506520);
    // path_19.lineTo(size.width * 0.2054453, size.height * 0.6506520);
    // path_19.lineTo(size.width * 0.2054453, size.height * 0.6410570);
    // path_19.lineTo(size.width * 0.2040699, size.height * 0.6410570);
    // path_19.lineTo(size.width * 0.2040699, size.height * 0.6506520);
    // path_19.close();

    // Paint paint_19_fill = Paint()..style = PaintingStyle.fill;
    // paint_19_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_19, paint_19_fill);

    // Paint paint_20_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_20_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2573281, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_20_stroke);

    // Paint paint_20_fill = Paint()..style = PaintingStyle.fill;
    // paint_20_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2573281, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_20_fill);

    // Path path_21 = Path();
    // path_21.moveTo(size.width * 0.2744645, size.height * 0.4447495);
    // path_21.lineTo(size.width * 0.2801578, size.height * 0.4447495);
    // path_21.lineTo(size.width * 0.2801578, size.height * 0.4431846);
    // path_21.lineTo(size.width * 0.2766516, size.height * 0.4431846);
    // path_21.lineTo(size.width * 0.2782751, size.height * 0.4415923);
    // path_21.cubicTo(
    //     size.width * 0.2796054,
    //     size.height * 0.4403432,
    //     size.width * 0.2800789,
    //     size.height * 0.4393411,
    //     size.width * 0.2800789,
    //     size.height * 0.4380920);
    // path_21.cubicTo(
    //     size.width * 0.2800789,
    //     size.height * 0.4363487,
    //     size.width * 0.2789064,
    //     size.height * 0.4351544,
    //     size.width * 0.2773732,
    //     size.height * 0.4351544);
    // path_21.cubicTo(
    //     size.width * 0.2761218,
    //     size.height * 0.4351544,
    //     size.width * 0.2751860,
    //     size.height * 0.4358270,
    //     size.width * 0.2744532,
    //     size.height * 0.4369938);
    // path_21.lineTo(size.width * 0.2753664, size.height * 0.4380233);
    // path_21.cubicTo(
    //     size.width * 0.2759301,
    //     size.height * 0.4371997,
    //     size.width * 0.2765163,
    //     size.height * 0.4366918,
    //     size.width * 0.2773281,
    //     size.height * 0.4366918);
    // path_21.cubicTo(
    //     size.width * 0.2780271,
    //     size.height * 0.4366918,
    //     size.width * 0.2786471,
    //     size.height * 0.4372409,
    //     size.width * 0.2786471,
    //     size.height * 0.4381332);
    // path_21.cubicTo(
    //     size.width * 0.2786471,
    //     size.height * 0.4389019,
    //     size.width * 0.2782976,
    //     size.height * 0.4396156,
    //     size.width * 0.2773168,
    //     size.height * 0.4405765);
    // path_21.lineTo(size.width * 0.2744645, size.height * 0.4433493);
    // path_21.lineTo(size.width * 0.2744645, size.height * 0.4447495);
    // path_21.close();

    // Paint paint_21_fill = Paint()..style = PaintingStyle.fill;
    // paint_21_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_21, paint_21_fill);

    // Paint paint_22_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_22_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2725479, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_22_stroke);

    // Paint paint_22_fill = Paint()..style = PaintingStyle.fill;
    // paint_22_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2725479, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_22_fill);

    // Path path_23 = Path();
    // path_23.moveTo(size.width * 0.2919166, size.height * 0.4962251);
    // path_23.lineTo(size.width * 0.2933145, size.height * 0.4962251);
    // path_23.lineTo(size.width * 0.2952649, size.height * 0.4892244);
    // path_23.lineTo(size.width * 0.2972041, size.height * 0.4962251);
    // path_23.lineTo(size.width * 0.2986133, size.height * 0.4962251);
    // path_23.lineTo(size.width * 0.3010598, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2995152, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2978579, size.height * 0.4935484);
    // path_23.lineTo(size.width * 0.2960316, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2944983, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2926607, size.height * 0.4935484);
    // path_23.lineTo(size.width * 0.2910034, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2894589, size.height * 0.4867948);
    // path_23.lineTo(size.width * 0.2919166, size.height * 0.4962251);
    // path_23.close();

    // Paint paint_23_fill = Paint()..style = PaintingStyle.fill;
    // paint_23_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_23, paint_23_fill);

    // Paint paint_24_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_24_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2883315, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_24_stroke);

    // Paint paint_24_fill = Paint()..style = PaintingStyle.fill;
    // paint_24_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2883315, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_24_fill);

    // Path path_25 = Path();
    // path_25.moveTo(size.width * 0.3086246, size.height * 0.5485381);
    // path_25.cubicTo(
    //     size.width * 0.3104735,
    //     size.height * 0.5485381,
    //     size.width * 0.3115333,
    //     size.height * 0.5473439,
    //     size.width * 0.3115333,
    //     size.height * 0.5456555);
    // path_25.cubicTo(
    //     size.width * 0.3115333,
    //     size.height * 0.5439396,
    //     size.width * 0.3104510,
    //     size.height * 0.5433082,
    //     size.width * 0.3088388,
    //     size.height * 0.5428689);
    // path_25.cubicTo(
    //     size.width * 0.3076099,
    //     size.height * 0.5425257,
    //     size.width * 0.3070349,
    //     size.height * 0.5422512,
    //     size.width * 0.3070349,
    //     size.height * 0.5414825);
    // path_25.cubicTo(
    //     size.width * 0.3070349,
    //     size.height * 0.5408236,
    //     size.width * 0.3075648,
    //     size.height * 0.5402471,
    //     size.width * 0.3083427,
    //     size.height * 0.5402471);
    // path_25.cubicTo(
    //     size.width * 0.3091094,
    //     size.height * 0.5402471,
    //     size.width * 0.3098873,
    //     size.height * 0.5406452,
    //     size.width * 0.3105637,
    //     size.height * 0.5413590);
    // path_25.lineTo(size.width * 0.3113303, size.height * 0.5400961);
    // path_25.cubicTo(
    //     size.width * 0.3105524,
    //     size.height * 0.5392862,
    //     size.width * 0.3096280,
    //     size.height * 0.5387783,
    //     size.width * 0.3083991,
    //     size.height * 0.5387783);
    // path_25.cubicTo(
    //     size.width * 0.3067644,
    //     size.height * 0.5387783,
    //     size.width * 0.3056144,
    //     size.height * 0.5399863,
    //     size.width * 0.3056144,
    //     size.height * 0.5416335);
    // path_25.cubicTo(
    //     size.width * 0.3056144,
    //     size.height * 0.5434043,
    //     size.width * 0.3067306,
    //     size.height * 0.5439671,
    //     size.width * 0.3083315,
    //     size.height * 0.5444200);
    // path_25.cubicTo(
    //     size.width * 0.3095716,
    //     size.height * 0.5447769,
    //     size.width * 0.3101240,
    //     size.height * 0.5450377,
    //     size.width * 0.3101240,
    //     size.height * 0.5458202);
    // path_25.cubicTo(
    //     size.width * 0.3101240,
    //     size.height * 0.5464928,
    //     size.width * 0.3096280,
    //     size.height * 0.5470693,
    //     size.width * 0.3086697,
    //     size.height * 0.5470693);
    // path_25.cubicTo(
    //     size.width * 0.3076550,
    //     size.height * 0.5470693,
    //     size.width * 0.3068320,
    //     size.height * 0.5465752,
    //     size.width * 0.3061218,
    //     size.height * 0.5457927);
    // path_25.lineTo(size.width * 0.3053100, size.height * 0.5470144);
    // path_25.cubicTo(
    //     size.width * 0.3061669,
    //     size.height * 0.5479890,
    //     size.width * 0.3072943,
    //     size.height * 0.5485381,
    //     size.width * 0.3086246,
    //     size.height * 0.5485381);
    // path_25.close();

    // Paint paint_25_fill = Paint()..style = PaintingStyle.fill;
    // paint_25_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_25, paint_25_fill);

    // Paint paint_26_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_26_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3120068, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_26_stroke);

    // Paint paint_26_fill = Paint()..style = PaintingStyle.fill;
    // paint_26_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3120068, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_26_fill);

    // Path path_27 = Path();
    // path_27.moveTo(size.width * 0.3363247, size.height * 0.5904324);
    // path_27.lineTo(size.width * 0.3346787, size.height * 0.5904324);
    // path_27.lineTo(size.width * 0.3326268, size.height * 0.5937817);
    // path_27.lineTo(size.width * 0.3305862, size.height * 0.5904324);
    // path_27.lineTo(size.width * 0.3289064, size.height * 0.5904324);
    // path_27.lineTo(size.width * 0.3317813, size.height * 0.5951544);
    // path_27.lineTo(size.width * 0.3289064, size.height * 0.5998627);
    // path_27.lineTo(size.width * 0.3305637, size.height * 0.5998627);
    // path_27.lineTo(size.width * 0.3326156, size.height * 0.5965134);
    // path_27.lineTo(size.width * 0.3346561, size.height * 0.5998627);
    // path_27.lineTo(size.width * 0.3363247, size.height * 0.5998627);
    // path_27.lineTo(size.width * 0.3334498, size.height * 0.5951407);
    // path_27.lineTo(size.width * 0.3363247, size.height * 0.5904324);
    // path_27.close();

    // Paint paint_27_fill = Paint()..style = PaintingStyle.fill;
    // paint_27_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_27, paint_27_fill);

    // Paint paint_28_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_28_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2223788, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_28_stroke);

    // Paint paint_28_fill = Paint()..style = PaintingStyle.fill;
    // paint_28_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2223788, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_28_fill);

    // Path path_29 = Path();
    // path_29.moveTo(size.width * 0.2403946, size.height * 0.6429650);
    // path_29.cubicTo(
    //     size.width * 0.2403946,
    //     size.height * 0.6424846,
    //     size.width * 0.2406426,
    //     size.height * 0.6421414,
    //     size.width * 0.2409696,
    //     size.height * 0.6421414);
    // path_29.cubicTo(
    //     size.width * 0.2412063,
    //     size.height * 0.6421414,
    //     size.width * 0.2414205,
    //     size.height * 0.6422512,
    //     size.width * 0.2415445,
    //     size.height * 0.6424022);
    // path_29.lineTo(size.width * 0.2419391, size.height * 0.6413315);
    // path_29.cubicTo(
    //     size.width * 0.2416122,
    //     size.height * 0.6409883,
    //     size.width * 0.2411387,
    //     size.height * 0.6407687,
    //     size.width * 0.2406990,
    //     size.height * 0.6407687);
    // path_29.cubicTo(
    //     size.width * 0.2397294,
    //     size.height * 0.6407687,
    //     size.width * 0.2390530,
    //     size.height * 0.6416198,
    //     size.width * 0.2390530,
    //     size.height * 0.6428140);
    // path_29.lineTo(size.width * 0.2390530, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2382074, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2382074, size.height * 0.6449417);
    // path_29.lineTo(size.width * 0.2390530, size.height * 0.6449417);
    // path_29.lineTo(size.width * 0.2390530, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2403946, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2403946, size.height * 0.6449417);
    // path_29.lineTo(size.width * 0.2417136, size.height * 0.6449417);
    // path_29.lineTo(size.width * 0.2417136, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2403946, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2403946, size.height * 0.6429650);
    // path_29.close();
    // path_29.moveTo(size.width * 0.2459876, size.height * 0.6433905);
    // path_29.cubicTo(
    //     size.width * 0.2452210,
    //     size.height * 0.6433905,
    //     size.width * 0.2445445,
    //     size.height * 0.6438435,
    //     size.width * 0.2441838,
    //     size.height * 0.6445024);
    // path_29.lineTo(size.width * 0.2441838, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2428083, size.height * 0.6435553);
    // path_29.lineTo(size.width * 0.2428083, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2441838, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2441838, size.height * 0.6461633);
    // path_29.cubicTo(
    //     size.width * 0.2442740,
    //     size.height * 0.6454084,
    //     size.width * 0.2448715,
    //     size.height * 0.6448181,
    //     size.width * 0.2455930,
    //     size.height * 0.6448181);
    // path_29.cubicTo(
    //     size.width * 0.2463145,
    //     size.height * 0.6448181,
    //     size.width * 0.2468219,
    //     size.height * 0.6455045,
    //     size.width * 0.2468219,
    //     size.height * 0.6464653);
    // path_29.lineTo(size.width * 0.2468219, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2481522, size.height * 0.6506520);
    // path_29.lineTo(size.width * 0.2481522, size.height * 0.6461359);
    // path_29.cubicTo(
    //     size.width * 0.2481522,
    //     size.height * 0.6445299,
    //     size.width * 0.2472616,
    //     size.height * 0.6433905,
    //     size.width * 0.2459876,
    //     size.height * 0.6433905);
    // path_29.close();

    // Paint paint_29_fill = Paint()..style = PaintingStyle.fill;
    // paint_29_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_29, paint_29_fill);

    // Paint paint_30_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_30_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3024239, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_30_stroke);

    // Paint paint_30_fill = Paint()..style = PaintingStyle.fill;
    // paint_30_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3024239, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_30_fill);

    // Path path_31 = Path();
    // path_31.moveTo(size.width * 0.3224126, size.height * 0.4449142);
    // path_31.cubicTo(
    //     size.width * 0.3241601,
    //     size.height * 0.4449142,
    //     size.width * 0.3252988,
    //     size.height * 0.4437612,
    //     size.width * 0.3252988,
    //     size.height * 0.4421414);
    // path_31.cubicTo(
    //     size.width * 0.3252988,
    //     size.height * 0.4408648,
    //     size.width * 0.3244870,
    //     size.height * 0.4401373,
    //     size.width * 0.3236640,
    //     size.height * 0.4399039);
    // path_31.cubicTo(
    //     size.width * 0.3244983,
    //     size.height * 0.4396019,
    //     size.width * 0.3251297,
    //     size.height * 0.4388607,
    //     size.width * 0.3251297,
    //     size.height * 0.4377213);
    // path_31.cubicTo(
    //     size.width * 0.3251297,
    //     size.height * 0.4362251,
    //     size.width * 0.3240361,
    //     size.height * 0.4351544,
    //     size.width * 0.3223901,
    //     size.height * 0.4351544);
    // path_31.cubicTo(
    //     size.width * 0.3210710,
    //     size.height * 0.4351544,
    //     size.width * 0.3201691,
    //     size.height * 0.4358682,
    //     size.width * 0.3195490,
    //     size.height * 0.4368154);
    // path_31.lineTo(size.width * 0.3203833, size.height * 0.4378586);
    // path_31.cubicTo(
    //     size.width * 0.3209132,
    //     size.height * 0.4371448,
    //     size.width * 0.3214994,
    //     size.height * 0.4366918,
    //     size.width * 0.3222661,
    //     size.height * 0.4366918);
    // path_31.cubicTo(
    //     size.width * 0.3231003,
    //     size.height * 0.4366918,
    //     size.width * 0.3237091,
    //     size.height * 0.4372272,
    //     size.width * 0.3237091,
    //     size.height * 0.4379959);
    // path_31.cubicTo(
    //     size.width * 0.3237091,
    //     size.height * 0.4388195,
    //     size.width * 0.3231116,
    //     size.height * 0.4392725,
    //     size.width * 0.3221984,
    //     size.height * 0.4392588);
    // path_31.lineTo(size.width * 0.3213303, size.height * 0.4392588);
    // path_31.lineTo(size.width * 0.3213303, size.height * 0.4407412);
    // path_31.lineTo(size.width * 0.3221984, size.height * 0.4407275);
    // path_31.cubicTo(
    //     size.width * 0.3232920,
    //     size.height * 0.4407275,
    //     size.width * 0.3238670,
    //     size.height * 0.4411668,
    //     size.width * 0.3238670,
    //     size.height * 0.4420041);
    // path_31.cubicTo(
    //     size.width * 0.3238670,
    //     size.height * 0.4428277,
    //     size.width * 0.3232920,
    //     size.height * 0.4433905,
    //     size.width * 0.3223675,
    //     size.height * 0.4433905);
    // path_31.cubicTo(
    //     size.width * 0.3215333,
    //     size.height * 0.4433905,
    //     size.width * 0.3207892,
    //     size.height * 0.4429375,
    //     size.width * 0.3202480,
    //     size.height * 0.4421963);
    // path_31.lineTo(size.width * 0.3193912, size.height * 0.4433219);
    // path_31.cubicTo(
    //     size.width * 0.3200225,
    //     size.height * 0.4442416,
    //     size.width * 0.3210598,
    //     size.height * 0.4449142,
    //     size.width * 0.3224126,
    //     size.height * 0.4449142);
    // path_31.close();

    // Paint paint_31_fill = Paint()..style = PaintingStyle.fill;
    // paint_31_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_31, paint_31_fill);

    // Paint paint_32_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_32_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3176437, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_32_stroke);

    // Paint paint_32_fill = Paint()..style = PaintingStyle.fill;
    // paint_32_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3176437, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_32_fill);

    // Path path_33 = Path();
    // path_33.moveTo(size.width * 0.3409019, size.height * 0.4883596);
    // path_33.lineTo(size.width * 0.3409019, size.height * 0.4867948);
    // path_33.lineTo(size.width * 0.3350733, size.height * 0.4867948);
    // path_33.lineTo(size.width * 0.3350733, size.height * 0.4962251);
    // path_33.lineTo(size.width * 0.3409019, size.height * 0.4962251);
    // path_33.lineTo(size.width * 0.3409019, size.height * 0.4946603);
    // path_33.lineTo(size.width * 0.3364825, size.height * 0.4946603);
    // path_33.lineTo(size.width * 0.3364825, size.height * 0.4922032);
    // path_33.lineTo(size.width * 0.3404848, size.height * 0.4922032);
    // path_33.lineTo(size.width * 0.3404848, size.height * 0.4906383);
    // path_33.lineTo(size.width * 0.3364825, size.height * 0.4906383);
    // path_33.lineTo(size.width * 0.3364825, size.height * 0.4883596);
    // path_33.lineTo(size.width * 0.3409019, size.height * 0.4883596);
    // path_33.close();

    // Paint paint_33_fill = Paint()..style = PaintingStyle.fill;
    // paint_33_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_33, paint_33_fill);

    // Paint paint_34_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_34_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3334273, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_34_stroke);

    // Paint paint_34_fill = Paint()..style = PaintingStyle.fill;
    // paint_34_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3334273, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_34_fill);

    // Path path_35 = Path();
    // path_35.moveTo(size.width * 0.3509583, size.height * 0.5483871);
    // path_35.lineTo(size.width * 0.3536866, size.height * 0.5483871);
    // path_35.cubicTo(
    //     size.width * 0.3562458,
    //     size.height * 0.5483871,
    //     size.width * 0.3580496,
    //     size.height * 0.5464242,
    //     size.width * 0.3580496,
    //     size.height * 0.5436651);
    // path_35.cubicTo(
    //     size.width * 0.3580496,
    //     size.height * 0.5409060,
    //     size.width * 0.3562458,
    //     size.height * 0.5389568,
    //     size.width * 0.3536866,
    //     size.height * 0.5389568);
    // path_35.lineTo(size.width * 0.3509583, size.height * 0.5389568);
    // path_35.lineTo(size.width * 0.3509583, size.height * 0.5483871);
    // path_35.close();
    // path_35.moveTo(size.width * 0.3523675, size.height * 0.5468360);
    // path_35.lineTo(size.width * 0.3523675, size.height * 0.5405079);
    // path_35.lineTo(size.width * 0.3538331, size.height * 0.5405079);
    // path_35.cubicTo(
    //     size.width * 0.3554679,
    //     size.height * 0.5405079,
    //     size.width * 0.3566178,
    //     size.height * 0.5418119,
    //     size.width * 0.3566178,
    //     size.height * 0.5436651);
    // path_35.cubicTo(
    //     size.width * 0.3566178,
    //     size.height * 0.5455182,
    //     size.width * 0.3554679,
    //     size.height * 0.5468360,
    //     size.width * 0.3538331,
    //     size.height * 0.5468360);
    // path_35.lineTo(size.width * 0.3523675, size.height * 0.5468360);
    // path_35.close();

    // Paint paint_35_fill = Paint()..style = PaintingStyle.fill;
    // paint_35_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_35, paint_35_fill);

    // Paint paint_36_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_36_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3571026, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_36_stroke);

    // Paint paint_36_fill = Paint()..style = PaintingStyle.fill;
    // paint_36_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3571026, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_36_fill);

    // Path path_37 = Path();
    // path_37.moveTo(size.width * 0.3783089, size.height * 0.6000275);
    // path_37.cubicTo(
    //     size.width * 0.3794476,
    //     size.height * 0.6000275,
    //     size.width * 0.3804848,
    //     size.height * 0.5994372,
    //     size.width * 0.3812289,
    //     size.height * 0.5984900);
    // path_37.lineTo(size.width * 0.3802368, size.height * 0.5973644);
    // path_37.cubicTo(
    //     size.width * 0.3797520,
    //     size.height * 0.5980371,
    //     size.width * 0.3790643,
    //     size.height * 0.5984626,
    //     size.width * 0.3783089,
    //     size.height * 0.5984626);
    // path_37.cubicTo(
    //     size.width * 0.3768771,
    //     size.height * 0.5984626,
    //     size.width * 0.3756708,
    //     size.height * 0.5969526,
    //     size.width * 0.3756708,
    //     size.height * 0.5951407);
    // path_37.cubicTo(
    //     size.width * 0.3756708,
    //     size.height * 0.5933425,
    //     size.width * 0.3768771,
    //     size.height * 0.5918325,
    //     size.width * 0.3783089,
    //     size.height * 0.5918325);
    // path_37.cubicTo(
    //     size.width * 0.3790530,
    //     size.height * 0.5918325,
    //     size.width * 0.3797520,
    //     size.height * 0.5922581,
    //     size.width * 0.3802255,
    //     size.height * 0.5929307);
    // path_37.lineTo(size.width * 0.3812289, size.height * 0.5917914);
    // path_37.cubicTo(
    //     size.width * 0.3804848,
    //     size.height * 0.5908579,
    //     size.width * 0.3794476,
    //     size.height * 0.5902677,
    //     size.width * 0.3783089,
    //     size.height * 0.5902677);
    // path_37.cubicTo(
    //     size.width * 0.3760992,
    //     size.height * 0.5902677,
    //     size.width * 0.3742390,
    //     size.height * 0.5924914,
    //     size.width * 0.3742390,
    //     size.height * 0.5951407);
    // path_37.cubicTo(
    //     size.width * 0.3742390,
    //     size.height * 0.5977900,
    //     size.width * 0.3760992,
    //     size.height * 0.6000275,
    //     size.width * 0.3783089,
    //     size.height * 0.6000275);
    // path_37.close();

    // Paint paint_37_fill = Paint()..style = PaintingStyle.fill;
    // paint_37_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_37, paint_37_fill);

    // Paint paint_38_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_38_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2702931, size.height * 0.6262869,
    //             size.width * 0.03889515, size.height * 0.04392588),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_38_stroke);

    // Paint paint_38_fill = Paint()..style = PaintingStyle.fill;
    // paint_38_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2702931, size.height * 0.6262869,
    //             size.width * 0.03889515, size.height * 0.04392588),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_38_fill);

    // Path path_39 = Path();
    // path_39.moveTo(size.width * 0.2882959, size.height * 0.6407522);
    // path_39.lineTo(size.width * 0.2818489, size.height * 0.6421036);
    // path_39.lineTo(size.width * 0.2818489, size.height * 0.6475113);
    // path_39.lineTo(size.width * 0.2882959, size.height * 0.6475113);
    // path_39.lineTo(size.width * 0.2882959, size.height * 0.6407522);
    // path_39.close();

    // Paint paint_39_fill = Paint()..style = PaintingStyle.fill;
    // paint_39_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_39, paint_39_fill);

    // Path path_40 = Path();
    // path_40.moveTo(size.width * 0.2976325, size.height * 0.6396706);
    // path_40.lineTo(size.width * 0.2896297, size.height * 0.6407522);
    // path_40.lineTo(size.width * 0.2896297, size.height * 0.6475113);
    // path_40.lineTo(size.width * 0.2976325, size.height * 0.6475113);
    // path_40.lineTo(size.width * 0.2976325, size.height * 0.6396706);
    // path_40.close();

    // Paint paint_40_fill = Paint()..style = PaintingStyle.fill;
    // paint_40_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_40, paint_40_fill);

    // Path path_41 = Path();
    // path_41.moveTo(size.width * 0.2882959, size.height * 0.6488634);
    // path_41.lineTo(size.width * 0.2818489, size.height * 0.6488634);
    // path_41.lineTo(size.width * 0.2818489, size.height * 0.6548119);
    // path_41.lineTo(size.width * 0.2882959, size.height * 0.6558929);
    // path_41.lineTo(size.width * 0.2882959, size.height * 0.6488634);
    // path_41.close();

    // Paint paint_41_fill = Paint()..style = PaintingStyle.fill;
    // paint_41_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_41, paint_41_fill);

    // Path path_42 = Path();
    // path_42.moveTo(size.width * 0.2976325, size.height * 0.6488634);
    // path_42.lineTo(size.width * 0.2896297, size.height * 0.6488634);
    // path_42.lineTo(size.width * 0.2896297, size.height * 0.6558929);
    // path_42.lineTo(size.width * 0.2976325, size.height * 0.6575154);
    // path_42.lineTo(size.width * 0.2976325, size.height * 0.6488634);
    // path_42.close();

    // Paint paint_42_fill = Paint()..style = PaintingStyle.fill;
    // paint_42_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_42, paint_42_fill);

    // Paint paint_43_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_43_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3475197, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_43_stroke);

    // Paint paint_43_fill = Paint()..style = PaintingStyle.fill;
    // paint_43_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3475197, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_43_fill);

    // Path path_44 = Path();
    // path_44.moveTo(size.width * 0.3684442, size.height * 0.4447495);
    // path_44.lineTo(size.width * 0.3698422, size.height * 0.4447495);
    // path_44.lineTo(size.width * 0.3698422, size.height * 0.4427042);
    // path_44.lineTo(size.width * 0.3709132, size.height * 0.4427042);
    // path_44.lineTo(size.width * 0.3709132, size.height * 0.4412354);
    // path_44.lineTo(size.width * 0.3698422, size.height * 0.4412354);
    // path_44.lineTo(size.width * 0.3698422, size.height * 0.4353191);
    // path_44.lineTo(size.width * 0.3681623, size.height * 0.4353191);
    // path_44.lineTo(size.width * 0.3644870, size.height * 0.4413727);
    // path_44.lineTo(size.width * 0.3646223, size.height * 0.4427042);
    // path_44.lineTo(size.width * 0.3684442, size.height * 0.4427042);
    // path_44.lineTo(size.width * 0.3684442, size.height * 0.4447495);
    // path_44.close();
    // path_44.moveTo(size.width * 0.3659865, size.height * 0.4412354);
    // path_44.lineTo(size.width * 0.3684442, size.height * 0.4371860);
    // path_44.lineTo(size.width * 0.3684442, size.height * 0.4412354);
    // path_44.lineTo(size.width * 0.3659865, size.height * 0.4412354);
    // path_44.close();

    // Paint paint_44_fill = Paint()..style = PaintingStyle.fill;
    // paint_44_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_44, paint_44_fill);

    // Paint paint_45_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_45_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3627396, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_45_stroke);

    // Paint paint_45_fill = Paint()..style = PaintingStyle.fill;
    // paint_45_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3627396, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_45_fill);

    // Path path_46 = Path();
    // path_46.moveTo(size.width * 0.3865051, size.height * 0.4962251);
    // path_46.lineTo(size.width * 0.3845660, size.height * 0.4928758);
    // path_46.cubicTo(
    //     size.width * 0.3856821,
    //     size.height * 0.4924502,
    //     size.width * 0.3864374,
    //     size.height * 0.4913521,
    //     size.width * 0.3864374,
    //     size.height * 0.4899245);
    // path_46.cubicTo(
    //     size.width * 0.3864374,
    //     size.height * 0.4880851,
    //     size.width * 0.3851973,
    //     size.height * 0.4867948,
    //     size.width * 0.3835400,
    //     size.height * 0.4867948);
    // path_46.lineTo(size.width * 0.3801691, size.height * 0.4867948);
    // path_46.lineTo(size.width * 0.3801691, size.height * 0.4962251);
    // path_46.lineTo(size.width * 0.3815784, size.height * 0.4962251);
    // path_46.lineTo(size.width * 0.3815784, size.height * 0.4930542);
    // path_46.lineTo(size.width * 0.3830778, size.height * 0.4930542);
    // path_46.lineTo(size.width * 0.3849042, size.height * 0.4962251);
    // path_46.lineTo(size.width * 0.3865051, size.height * 0.4962251);
    // path_46.close();
    // path_46.moveTo(size.width * 0.3815784, size.height * 0.4883734);
    // path_46.lineTo(size.width * 0.3833822, size.height * 0.4883734);
    // path_46.cubicTo(
    //     size.width * 0.3843405,
    //     size.height * 0.4883734,
    //     size.width * 0.3850056,
    //     size.height * 0.4889636,
    //     size.width * 0.3850056,
    //     size.height * 0.4899245);
    // path_46.cubicTo(
    //     size.width * 0.3850056,
    //     size.height * 0.4908854,
    //     size.width * 0.3843405,
    //     size.height * 0.4914756,
    //     size.width * 0.3833822,
    //     size.height * 0.4914756);
    // path_46.lineTo(size.width * 0.3815784, size.height * 0.4914756);
    // path_46.lineTo(size.width * 0.3815784, size.height * 0.4883734);
    // path_46.close();

    // Paint paint_46_fill = Paint()..style = PaintingStyle.fill;
    // paint_46_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_46, paint_46_fill);

    // Paint paint_47_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_47_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3785231, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_47_stroke);

    // Paint paint_47_fill = Paint()..style = PaintingStyle.fill;
    // paint_47_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3785231, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_47_fill);

    // Path path_48 = Path();
    // path_48.moveTo(size.width * 0.4017813, size.height * 0.5405216);
    // path_48.lineTo(size.width * 0.4017813, size.height * 0.5389568);
    // path_48.lineTo(size.width * 0.3959526, size.height * 0.5389568);
    // path_48.lineTo(size.width * 0.3959526, size.height * 0.5483871);
    // path_48.lineTo(size.width * 0.3973619, size.height * 0.5483871);
    // path_48.lineTo(size.width * 0.3973619, size.height * 0.5444749);
    // path_48.lineTo(size.width * 0.4013641, size.height * 0.5444749);
    // path_48.lineTo(size.width * 0.4013641, size.height * 0.5429101);
    // path_48.lineTo(size.width * 0.3973619, size.height * 0.5429101);
    // path_48.lineTo(size.width * 0.3973619, size.height * 0.5405216);
    // path_48.lineTo(size.width * 0.4017813, size.height * 0.5405216);
    // path_48.close();

    // Paint paint_48_fill = Paint()..style = PaintingStyle.fill;
    // paint_48_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_48, paint_48_fill);

    // Paint paint_49_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_49_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4021984, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_49_stroke);

    // Paint paint_49_fill = Paint()..style = PaintingStyle.fill;
    // paint_49_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4021984, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_49_fill);

    // Path path_50 = Path();
    // path_50.moveTo(size.width * 0.4255242, size.height * 0.5904324);
    // path_50.lineTo(size.width * 0.4230665, size.height * 0.5975841);
    // path_50.lineTo(size.width * 0.4206088, size.height * 0.5904324);
    // path_50.lineTo(size.width * 0.4190530, size.height * 0.5904324);
    // path_50.lineTo(size.width * 0.4222886, size.height * 0.5998627);
    // path_50.lineTo(size.width * 0.4238557, size.height * 0.5998627);
    // path_50.lineTo(size.width * 0.4270913, size.height * 0.5904324);
    // path_50.lineTo(size.width * 0.4255242, size.height * 0.5904324);
    // path_50.close();

    // Paint paint_50_fill = Paint()..style = PaintingStyle.fill;
    // paint_50_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_50, paint_50_fill);

    // Paint paint_51_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_51_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3125705, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_51_stroke);

    // Paint paint_51_fill = Paint()..style = PaintingStyle.fill;
    // paint_51_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3125705, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_51_fill);

    // Path path_52 = Path();
    // path_52.moveTo(size.width * 0.3296731, size.height * 0.6433905);
    // path_52.cubicTo(
    //     size.width * 0.3289402,
    //     size.height * 0.6433905,
    //     size.width * 0.3281736,
    //     size.height * 0.6436376,
    //     size.width * 0.3273506,
    //     size.height * 0.6441318);
    // path_52.lineTo(size.width * 0.3278241, size.height * 0.6452986);
    // path_52.cubicTo(
    //     size.width * 0.3283202,
    //     size.height * 0.6449966,
    //     size.width * 0.3288501,
    //     size.height * 0.6447632,
    //     size.width * 0.3294025,
    //     size.height * 0.6447632);
    // path_52.cubicTo(
    //     size.width * 0.3304622,
    //     size.height * 0.6447632,
    //     size.width * 0.3308343,
    //     size.height * 0.6455594,
    //     size.width * 0.3308343,
    //     size.height * 0.6463830);
    // path_52.lineTo(size.width * 0.3308343, size.height * 0.6465752);
    // path_52.cubicTo(
    //     size.width * 0.3303044,
    //     size.height * 0.6463281,
    //     size.width * 0.3297294,
    //     size.height * 0.6461908,
    //     size.width * 0.3291995,
    //     size.height * 0.6461908);
    // path_52.cubicTo(
    //     size.width * 0.3278918,
    //     size.height * 0.6461908,
    //     size.width * 0.3268207,
    //     size.height * 0.6471517,
    //     size.width * 0.3268207,
    //     size.height * 0.6485518);
    // path_52.cubicTo(
    //     size.width * 0.3268207,
    //     size.height * 0.6499245,
    //     size.width * 0.3277565,
    //     size.height * 0.6508167,
    //     size.width * 0.3289966,
    //     size.height * 0.6508167);
    // path_52.cubicTo(
    //     size.width * 0.3296731,
    //     size.height * 0.6508167,
    //     size.width * 0.3304059,
    //     size.height * 0.6504598,
    //     size.width * 0.3308343,
    //     size.height * 0.6498010);
    // path_52.lineTo(size.width * 0.3308343, size.height * 0.6506520);
    // path_52.lineTo(size.width * 0.3321759, size.height * 0.6506520);
    // path_52.lineTo(size.width * 0.3321759, size.height * 0.6463830);
    // path_52.cubicTo(
    //     size.width * 0.3321759,
    //     size.height * 0.6445848,
    //     size.width * 0.3312176,
    //     size.height * 0.6433905,
    //     size.width * 0.3296731,
    //     size.height * 0.6433905);
    // path_52.close();
    // path_52.moveTo(size.width * 0.3293010, size.height * 0.6495951);
    // path_52.cubicTo(
    //     size.width * 0.3286471,
    //     size.height * 0.6495951,
    //     size.width * 0.3281623,
    //     size.height * 0.6491695,
    //     size.width * 0.3281623,
    //     size.height * 0.6484969);
    // path_52.cubicTo(
    //     size.width * 0.3281623,
    //     size.height * 0.6478243,
    //     size.width * 0.3287148,
    //     size.height * 0.6473576,
    //     size.width * 0.3294025,
    //     size.height * 0.6473576);
    // path_52.cubicTo(
    //     size.width * 0.3299211,
    //     size.height * 0.6473576,
    //     size.width * 0.3304059,
    //     size.height * 0.6474537,
    //     size.width * 0.3308343,
    //     size.height * 0.6476321);
    // path_52.lineTo(size.width * 0.3308343, size.height * 0.6484283);
    // path_52.cubicTo(
    //     size.width * 0.3306764,
    //     size.height * 0.6491833,
    //     size.width * 0.3299662,
    //     size.height * 0.6495951,
    //     size.width * 0.3293010,
    //     size.height * 0.6495951);
    // path_52.close();
    // path_52.moveTo(size.width * 0.3336652, size.height * 0.6506520);
    // path_52.lineTo(size.width * 0.3350406, size.height * 0.6506520);
    // path_52.lineTo(size.width * 0.3350406, size.height * 0.6410570);
    // path_52.lineTo(size.width * 0.3336652, size.height * 0.6410570);
    // path_52.lineTo(size.width * 0.3336652, size.height * 0.6506520);
    // path_52.close();
    // path_52.moveTo(size.width * 0.3394696, size.height * 0.6491283);
    // path_52.cubicTo(
    //     size.width * 0.3393455,
    //     size.height * 0.6492793,
    //     size.width * 0.3391313,
    //     size.height * 0.6493892,
    //     size.width * 0.3388946,
    //     size.height * 0.6493892);
    // path_52.cubicTo(
    //     size.width * 0.3385676,
    //     size.height * 0.6493892,
    //     size.width * 0.3383196,
    //     size.height * 0.6490460,
    //     size.width * 0.3383196,
    //     size.height * 0.6485655);
    // path_52.lineTo(size.width * 0.3383196, size.height * 0.6449417);
    // path_52.lineTo(size.width * 0.3396387, size.height * 0.6449417);
    // path_52.lineTo(size.width * 0.3396387, size.height * 0.6435553);
    // path_52.lineTo(size.width * 0.3383196, size.height * 0.6435553);
    // path_52.lineTo(size.width * 0.3383196, size.height * 0.6416060);
    // path_52.lineTo(size.width * 0.3369780, size.height * 0.6416060);
    // path_52.lineTo(size.width * 0.3369780, size.height * 0.6435553);
    // path_52.lineTo(size.width * 0.3361325, size.height * 0.6435553);
    // path_52.lineTo(size.width * 0.3361325, size.height * 0.6449417);
    // path_52.lineTo(size.width * 0.3369780, size.height * 0.6449417);
    // path_52.lineTo(size.width * 0.3369780, size.height * 0.6487714);
    // path_52.cubicTo(
    //     size.width * 0.3369780,
    //     size.height * 0.6499657,
    //     size.width * 0.3376545,
    //     size.height * 0.6508167,
    //     size.width * 0.3386240,
    //     size.height * 0.6508167);
    // path_52.cubicTo(
    //     size.width * 0.3390637,
    //     size.height * 0.6508167,
    //     size.width * 0.3395372,
    //     size.height * 0.6505971,
    //     size.width * 0.3398641,
    //     size.height * 0.6502539);
    // path_52.lineTo(size.width * 0.3394696, size.height * 0.6491283);
    // path_52.close();

    // Paint paint_52_fill = Paint()..style = PaintingStyle.fill;
    // paint_52_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_52, paint_52_fill);

    // Paint paint_53_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_53_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3576663, size.height * 0.6228552,
    //             size.width * 0.2226607, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_53_stroke);

    // Paint paint_53_fill = Paint()..style = PaintingStyle.fill;
    // paint_53_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3576663, size.height * 0.6228552,
    //             size.width * 0.2226607, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_53_fill);

    // Paint paint_54_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_54_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3926156, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_54_stroke);

    // Paint paint_54_fill = Paint()..style = PaintingStyle.fill;
    // paint_54_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3926156, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_54_fill);

    // Path path_55 = Path();
    // path_55.moveTo(size.width * 0.4126268, size.height * 0.4449142);
    // path_55.cubicTo(
    //     size.width * 0.4143968,
    //     size.height * 0.4449142,
    //     size.width * 0.4156032,
    //     size.height * 0.4436513,
    //     size.width * 0.4156032,
    //     size.height * 0.4417021);
    // path_55.cubicTo(
    //     size.width * 0.4156032,
    //     size.height * 0.4398078,
    //     size.width * 0.4144194,
    //     size.height * 0.4387371,
    //     size.width * 0.4130440,
    //     size.height * 0.4387371);
    // path_55.cubicTo(
    //     size.width * 0.4123788,
    //     size.height * 0.4387371,
    //     size.width * 0.4118715,
    //     size.height * 0.4389842,
    //     size.width * 0.4114769,
    //     size.height * 0.4393137);
    // path_55.lineTo(size.width * 0.4115445, size.height * 0.4368840);
    // path_55.lineTo(size.width * 0.4151860, size.height * 0.4368840);
    // path_55.lineTo(size.width * 0.4151860, size.height * 0.4353191);
    // path_55.lineTo(size.width * 0.4102255, size.height * 0.4353191);
    // path_55.lineTo(size.width * 0.4101127, size.height * 0.4403294);
    // path_55.lineTo(size.width * 0.4110710, size.height * 0.4408236);
    // path_55.cubicTo(
    //     size.width * 0.4115107,
    //     size.height * 0.4404118,
    //     size.width * 0.4120406,
    //     size.height * 0.4401647,
    //     size.width * 0.4126494,
    //     size.height * 0.4401647);
    // path_55.cubicTo(
    //     size.width * 0.4135738,
    //     size.height * 0.4401647,
    //     size.width * 0.4141939,
    //     size.height * 0.4408099,
    //     size.width * 0.4141939,
    //     size.height * 0.4417708);
    // path_55.cubicTo(
    //     size.width * 0.4141939,
    //     size.height * 0.4426905,
    //     size.width * 0.4135964,
    //     size.height * 0.4434317,
    //     size.width * 0.4126494,
    //     size.height * 0.4434317);
    // path_55.cubicTo(
    //     size.width * 0.4118715,
    //     size.height * 0.4434317,
    //     size.width * 0.4111612,
    //     size.height * 0.4429513,
    //     size.width * 0.4105637,
    //     size.height * 0.4422375);
    // path_55.lineTo(size.width * 0.4097294, size.height * 0.4434592);
    // path_55.cubicTo(
    //     size.width * 0.4104171,
    //     size.height * 0.4443377,
    //     size.width * 0.4113641,
    //     size.height * 0.4449142,
    //     size.width * 0.4126268,
    //     size.height * 0.4449142);
    // path_55.close();

    // Paint paint_55_fill = Paint()..style = PaintingStyle.fill;
    // paint_55_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_55, paint_55_fill);

    // Paint paint_56_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_56_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4078354, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_56_stroke);

    // Paint paint_56_fill = Paint()..style = PaintingStyle.fill;
    // paint_56_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4078354, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_56_fill);

    // Path path_57 = Path();
    // path_57.moveTo(size.width * 0.4273506, size.height * 0.4962251);
    // path_57.lineTo(size.width * 0.4287486, size.height * 0.4962251);
    // path_57.lineTo(size.width * 0.4287486, size.height * 0.4883596);
    // path_57.lineTo(size.width * 0.4312289, size.height * 0.4883596);
    // path_57.lineTo(size.width * 0.4312289, size.height * 0.4867948);
    // path_57.lineTo(size.width * 0.4248703, size.height * 0.4867948);
    // path_57.lineTo(size.width * 0.4248703, size.height * 0.4883596);
    // path_57.lineTo(size.width * 0.4273506, size.height * 0.4883596);
    // path_57.lineTo(size.width * 0.4273506, size.height * 0.4962251);
    // path_57.close();

    // Paint paint_57_fill = Paint()..style = PaintingStyle.fill;
    // paint_57_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_57, paint_57_fill);

    // Paint paint_58_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_58_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4236189, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_58_stroke);

    // Paint paint_58_fill = Paint()..style = PaintingStyle.fill;
    // paint_58_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4236189, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_58_fill);

    // Path path_59 = Path();
    // path_59.moveTo(size.width * 0.4446223, size.height * 0.5445985);
    // path_59.lineTo(size.width * 0.4465502, size.height * 0.5445985);
    // path_59.lineTo(size.width * 0.4465502, size.height * 0.5463143);
    // path_59.cubicTo(
    //     size.width * 0.4460654,
    //     size.height * 0.5467399,
    //     size.width * 0.4454340,
    //     size.height * 0.5469870,
    //     size.width * 0.4448478,
    //     size.height * 0.5469870);
    // path_59.cubicTo(
    //     size.width * 0.4434047,
    //     size.height * 0.5469870,
    //     size.width * 0.4421871,
    //     size.height * 0.5454770,
    //     size.width * 0.4421871,
    //     size.height * 0.5436651);
    // path_59.cubicTo(
    //     size.width * 0.4421871,
    //     size.height * 0.5418668,
    //     size.width * 0.4434047,
    //     size.height * 0.5403569,
    //     size.width * 0.4448478,
    //     size.height * 0.5403569);
    // path_59.cubicTo(
    //     size.width * 0.4456032,
    //     size.height * 0.5403569,
    //     size.width * 0.4464374,
    //     size.height * 0.5407687,
    //     size.width * 0.4469222,
    //     size.height * 0.5414550);
    // path_59.lineTo(size.width * 0.4479256, size.height * 0.5403157);
    // path_59.cubicTo(
    //     size.width * 0.4471815,
    //     size.height * 0.5393686,
    //     size.width * 0.4459752,
    //     size.height * 0.5387920,
    //     size.width * 0.4448478,
    //     size.height * 0.5387920);
    // path_59.cubicTo(
    //     size.width * 0.4426268,
    //     size.height * 0.5387920,
    //     size.width * 0.4407554,
    //     size.height * 0.5410158,
    //     size.width * 0.4407554,
    //     size.height * 0.5436651);
    // path_59.cubicTo(
    //     size.width * 0.4407554,
    //     size.height * 0.5463143,
    //     size.width * 0.4426268,
    //     size.height * 0.5485518,
    //     size.width * 0.4448478,
    //     size.height * 0.5485518);
    // path_59.cubicTo(
    //     size.width * 0.4459752,
    //     size.height * 0.5485518,
    //     size.width * 0.4471815,
    //     size.height * 0.5479616,
    //     size.width * 0.4479256,
    //     size.height * 0.5470144);
    // path_59.lineTo(size.width * 0.4479256, size.height * 0.5431984);
    // path_59.lineTo(size.width * 0.4446223, size.height * 0.5431984);
    // path_59.lineTo(size.width * 0.4446223, size.height * 0.5445985);
    // path_59.close();

    // Paint paint_59_fill = Paint()..style = PaintingStyle.fill;
    // paint_59_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_59, paint_59_fill);

    // Paint paint_60_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_60_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4472943, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_60_stroke);

    // Paint paint_60_fill = Paint()..style = PaintingStyle.fill;
    // paint_60_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4472943, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_60_fill);

    // Path path_61 = Path();
    // path_61.moveTo(size.width * 0.4648253, size.height * 0.5998627);
    // path_61.lineTo(size.width * 0.4687711, size.height * 0.5998627);
    // path_61.cubicTo(
    //     size.width * 0.4702142,
    //     size.height * 0.5998627,
    //     size.width * 0.4712401,
    //     size.height * 0.5988058,
    //     size.width * 0.4712401,
    //     size.height * 0.5972958);
    // path_61.cubicTo(
    //     size.width * 0.4712401,
    //     size.height * 0.5962663,
    //     size.width * 0.4707103,
    //     size.height * 0.5954015,
    //     size.width * 0.4698196,
    //     size.height * 0.5948799);
    // path_61.cubicTo(
    //     size.width * 0.4705073,
    //     size.height * 0.5944269,
    //     size.width * 0.4709132,
    //     size.height * 0.5937543,
    //     size.width * 0.4709132,
    //     size.height * 0.5927934);
    // path_61.cubicTo(
    //     size.width * 0.4709132,
    //     size.height * 0.5914207,
    //     size.width * 0.4699662,
    //     size.height * 0.5904324,
    //     size.width * 0.4686246,
    //     size.height * 0.5904324);
    // path_61.lineTo(size.width * 0.4648253, size.height * 0.5904324);
    // path_61.lineTo(size.width * 0.4648253, size.height * 0.5998627);
    // path_61.close();
    // path_61.moveTo(size.width * 0.4662232, size.height * 0.5942896);
    // path_61.lineTo(size.width * 0.4662232, size.height * 0.5919149);
    // path_61.lineTo(size.width * 0.4682864, size.height * 0.5919149);
    // path_61.cubicTo(
    //     size.width * 0.4689741,
    //     size.height * 0.5919149,
    //     size.width * 0.4694701,
    //     size.height * 0.5924091,
    //     size.width * 0.4694701,
    //     size.height * 0.5931091);
    // path_61.cubicTo(
    //     size.width * 0.4694701,
    //     size.height * 0.5937955,
    //     size.width * 0.4689741,
    //     size.height * 0.5942896,
    //     size.width * 0.4682864,
    //     size.height * 0.5942896);
    // path_61.lineTo(size.width * 0.4662232, size.height * 0.5942896);
    // path_61.close();
    // path_61.moveTo(size.width * 0.4662232, size.height * 0.5983802);
    // path_61.lineTo(size.width * 0.4662232, size.height * 0.5956898);
    // path_61.lineTo(size.width * 0.4684893, size.height * 0.5956898);
    // path_61.cubicTo(
    //     size.width * 0.4692559,
    //     size.height * 0.5956898,
    //     size.width * 0.4697971,
    //     size.height * 0.5962526,
    //     size.width * 0.4697971,
    //     size.height * 0.5970350);
    // path_61.cubicTo(
    //     size.width * 0.4697971,
    //     size.height * 0.5978174,
    //     size.width * 0.4692559,
    //     size.height * 0.5983802,
    //     size.width * 0.4684893,
    //     size.height * 0.5983802);
    // path_61.lineTo(size.width * 0.4662232, size.height * 0.5983802);
    // path_61.close();

    // Paint paint_61_fill = Paint()..style = PaintingStyle.fill;
    // paint_61_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_61, paint_61_fill);

    // Paint paint_62_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_62_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4377114, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_62_stroke);

    // Paint paint_62_fill = Paint()..style = PaintingStyle.fill;
    // paint_62_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4377114, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_62_fill);

    // Path path_63 = Path();
    // path_63.moveTo(size.width * 0.4583427, size.height * 0.4387234);
    // path_63.cubicTo(
    //     size.width * 0.4575536,
    //     size.height * 0.4387234,
    //     size.width * 0.4568095,
    //     size.height * 0.4391215,
    //     size.width * 0.4563360,
    //     size.height * 0.4397941);
    // path_63.cubicTo(
    //     size.width * 0.4564262,
    //     size.height * 0.4379410,
    //     size.width * 0.4572041,
    //     size.height * 0.4366644,
    //     size.width * 0.4582976,
    //     size.height * 0.4366644);
    // path_63.cubicTo(
    //     size.width * 0.4589853,
    //     size.height * 0.4366644,
    //     size.width * 0.4594589,
    //     size.height * 0.4370075,
    //     size.width * 0.4599324,
    //     size.height * 0.4375154);
    // path_63.lineTo(size.width * 0.4606201, size.height * 0.4362114);
    // path_63.cubicTo(
    //     size.width * 0.4600000,
    //     size.height * 0.4355662,
    //     size.width * 0.4592672,
    //     size.height * 0.4351544,
    //     size.width * 0.4583089,
    //     size.height * 0.4351544);
    // path_63.cubicTo(
    //     size.width * 0.4562909,
    //     size.height * 0.4351544,
    //     size.width * 0.4548816,
    //     size.height * 0.4372821,
    //     size.width * 0.4548816,
    //     size.height * 0.4401922);
    // path_63.cubicTo(
    //     size.width * 0.4548816,
    //     size.height * 0.4429101,
    //     size.width * 0.4558625,
    //     size.height * 0.4449142,
    //     size.width * 0.4580609,
    //     size.height * 0.4449142);
    // path_63.cubicTo(
    //     size.width * 0.4597294,
    //     size.height * 0.4449142,
    //     size.width * 0.4609470,
    //     size.height * 0.4435690,
    //     size.width * 0.4609470,
    //     size.height * 0.4417021);
    // path_63.cubicTo(
    //     size.width * 0.4609470,
    //     size.height * 0.4398216,
    //     size.width * 0.4597632,
    //     size.height * 0.4387234,
    //     size.width * 0.4583427,
    //     size.height * 0.4387234);
    // path_63.close();
    // path_63.moveTo(size.width * 0.4579932, size.height * 0.4434592);
    // path_63.cubicTo(
    //     size.width * 0.4570575,
    //     size.height * 0.4434592,
    //     size.width * 0.4565727,
    //     size.height * 0.4426767,
    //     size.width * 0.4564036,
    //     size.height * 0.4414276);
    // path_63.cubicTo(
    //     size.width * 0.4566291,
    //     size.height * 0.4406314,
    //     size.width * 0.4572266,
    //     size.height * 0.4401235,
    //     size.width * 0.4579707,
    //     size.height * 0.4401235);
    // path_63.cubicTo(
    //     size.width * 0.4588162,
    //     size.height * 0.4401235,
    //     size.width * 0.4595152,
    //     size.height * 0.4407412,
    //     size.width * 0.4595152,
    //     size.height * 0.4417708);
    // path_63.cubicTo(
    //     size.width * 0.4595152,
    //     size.height * 0.4426356,
    //     size.width * 0.4589402,
    //     size.height * 0.4434592,
    //     size.width * 0.4579932,
    //     size.height * 0.4434592);
    // path_63.close();

    // Paint paint_63_fill = Paint()..style = PaintingStyle.fill;
    // paint_63_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_63, paint_63_fill);

    // Paint paint_64_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_64_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4529312, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_64_stroke);

    // Paint paint_64_fill = Paint()..style = PaintingStyle.fill;
    // paint_64_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4529312, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_64_fill);

    // Path path_65 = Path();
    // path_65.moveTo(size.width * 0.4727170, size.height * 0.4962251);
    // path_65.lineTo(size.width * 0.4741488, size.height * 0.4962251);
    // path_65.lineTo(size.width * 0.4741488, size.height * 0.4926836);
    // path_65.lineTo(size.width * 0.4772041, size.height * 0.4867948);
    // path_65.lineTo(size.width * 0.4756032, size.height * 0.4867948);
    // path_65.lineTo(size.width * 0.4734386, size.height * 0.4910638);
    // path_65.lineTo(size.width * 0.4713078, size.height * 0.4867948);
    // path_65.lineTo(size.width * 0.4696505, size.height * 0.4867948);
    // path_65.lineTo(size.width * 0.4727170, size.height * 0.4926836);
    // path_65.lineTo(size.width * 0.4727170, size.height * 0.4962251);
    // path_65.close();

    // Paint paint_65_fill = Paint()..style = PaintingStyle.fill;
    // paint_65_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_65, paint_65_fill);

    // Paint paint_66_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_66_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4687148, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_66_stroke);

    // Paint paint_66_fill = Paint()..style = PaintingStyle.fill;
    // paint_66_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4687148, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_66_fill);

    // Path path_67 = Path();
    // path_67.moveTo(size.width * 0.4914205, size.height * 0.5389568);
    // path_67.lineTo(size.width * 0.4914205, size.height * 0.5428003);
    // path_67.lineTo(size.width * 0.4875536, size.height * 0.5428003);
    // path_67.lineTo(size.width * 0.4875536, size.height * 0.5389568);
    // path_67.lineTo(size.width * 0.4861443, size.height * 0.5389568);
    // path_67.lineTo(size.width * 0.4861443, size.height * 0.5483871);
    // path_67.lineTo(size.width * 0.4875536, size.height * 0.5483871);
    // path_67.lineTo(size.width * 0.4875536, size.height * 0.5443651);
    // path_67.lineTo(size.width * 0.4914205, size.height * 0.5443651);
    // path_67.lineTo(size.width * 0.4914205, size.height * 0.5483871);
    // path_67.lineTo(size.width * 0.4928298, size.height * 0.5483871);
    // path_67.lineTo(size.width * 0.4928298, size.height * 0.5389568);
    // path_67.lineTo(size.width * 0.4914205, size.height * 0.5389568);
    // path_67.close();

    // Paint paint_67_fill = Paint()..style = PaintingStyle.fill;
    // paint_67_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_67, paint_67_fill);

    // Paint paint_68_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_68_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4923901, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_68_stroke);

    // Paint paint_68_fill = Paint()..style = PaintingStyle.fill;
    // paint_68_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4923901, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_68_fill);

    // Path path_69 = Path();
    // path_69.moveTo(size.width * 0.5099211, size.height * 0.5998627);
    // path_69.lineTo(size.width * 0.5113303, size.height * 0.5998627);
    // path_69.lineTo(size.width * 0.5113303, size.height * 0.5932327);
    // path_69.lineTo(size.width * 0.5154228, size.height * 0.5998627);
    // path_69.lineTo(size.width * 0.5168207, size.height * 0.5998627);
    // path_69.lineTo(size.width * 0.5168207, size.height * 0.5904324);
    // path_69.lineTo(size.width * 0.5154228, size.height * 0.5904324);
    // path_69.lineTo(size.width * 0.5154228, size.height * 0.5970625);
    // path_69.lineTo(size.width * 0.5113303, size.height * 0.5904324);
    // path_69.lineTo(size.width * 0.5099211, size.height * 0.5904324);
    // path_69.lineTo(size.width * 0.5099211, size.height * 0.5998627);
    // path_69.close();

    // Paint paint_69_fill = Paint()..style = PaintingStyle.fill;
    // paint_69_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_69, paint_69_fill);

    // Paint paint_70_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_70_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4828072, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_70_stroke);

    // Paint paint_70_fill = Paint()..style = PaintingStyle.fill;
    // paint_70_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4828072, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_70_fill);

    // Path path_71 = Path();
    // path_71.moveTo(size.width * 0.5008117, size.height * 0.4447495);
    // path_71.lineTo(size.width * 0.5024014, size.height * 0.4447495);
    // path_71.lineTo(size.width * 0.5056032, size.height * 0.4366095);
    // path_71.lineTo(size.width * 0.5056032, size.height * 0.4353191);
    // path_71.lineTo(size.width * 0.5000113, size.height * 0.4353191);
    // path_71.lineTo(size.width * 0.5000113, size.height * 0.4368840);
    // path_71.lineTo(size.width * 0.5039684, size.height * 0.4368840);
    // path_71.lineTo(size.width * 0.5008117, size.height * 0.4447495);
    // path_71.close();

    // Paint paint_71_fill = Paint()..style = PaintingStyle.fill;
    // paint_71_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_71, paint_71_fill);

    // Paint paint_72_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_72_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4980271, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_72_stroke);

    // Paint paint_72_fill = Paint()..style = PaintingStyle.fill;
    // paint_72_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4980271, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_72_fill);

    // Path path_73 = Path();
    // path_73.moveTo(size.width * 0.5188952, size.height * 0.4963898);
    // path_73.cubicTo(
    //     size.width * 0.5209019,
    //     size.height * 0.4963898,
    //     size.width * 0.5223112,
    //     size.height * 0.4946603,
    //     size.width * 0.5223112,
    //     size.height * 0.4922032);
    // path_73.lineTo(size.width * 0.5223112, size.height * 0.4867948);
    // path_73.lineTo(size.width * 0.5209132, size.height * 0.4867948);
    // path_73.lineTo(size.width * 0.5209132, size.height * 0.4921482);
    // path_73.cubicTo(
    //     size.width * 0.5209132,
    //     size.height * 0.4937131,
    //     size.width * 0.5200789,
    //     size.height * 0.4948387,
    //     size.width * 0.5188952,
    //     size.height * 0.4948387);
    // path_73.cubicTo(
    //     size.width * 0.5177227,
    //     size.height * 0.4948387,
    //     size.width * 0.5168884,
    //     size.height * 0.4937131,
    //     size.width * 0.5168884,
    //     size.height * 0.4921482);
    // path_73.lineTo(size.width * 0.5168884, size.height * 0.4867948);
    // path_73.lineTo(size.width * 0.5154791, size.height * 0.4867948);
    // path_73.lineTo(size.width * 0.5154791, size.height * 0.4922032);
    // path_73.cubicTo(
    //     size.width * 0.5154791,
    //     size.height * 0.4946603,
    //     size.width * 0.5168997,
    //     size.height * 0.4963898,
    //     size.width * 0.5188952,
    //     size.height * 0.4963898);
    // path_73.close();

    // Paint paint_73_fill = Paint()..style = PaintingStyle.fill;
    // paint_73_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_73, paint_73_fill);

    // Paint paint_74_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_74_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5138106, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_74_stroke);

    // Paint paint_74_fill = Paint()..style = PaintingStyle.fill;
    // paint_74_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5138106, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_74_fill);

    // Path path_75 = Path();
    // path_75.moveTo(size.width * 0.5331567, size.height * 0.5485518);
    // path_75.cubicTo(
    //     size.width * 0.5346674,
    //     size.height * 0.5485518,
    //     size.width * 0.5357384,
    //     size.height * 0.5472066,
    //     size.width * 0.5357384,
    //     size.height * 0.5453123);
    // path_75.lineTo(size.width * 0.5357384, size.height * 0.5389568);
    // path_75.lineTo(size.width * 0.5343405, size.height * 0.5389568);
    // path_75.lineTo(size.width * 0.5343405, size.height * 0.5452025);
    // path_75.cubicTo(
    //     size.width * 0.5343405,
    //     size.height * 0.5462594,
    //     size.width * 0.5337993,
    //     size.height * 0.5470007,
    //     size.width * 0.5330327,
    //     size.height * 0.5470007);
    // path_75.cubicTo(
    //     size.width * 0.5324464,
    //     size.height * 0.5470007,
    //     size.width * 0.5318489,
    //     size.height * 0.5465202,
    //     size.width * 0.5315784,
    //     size.height * 0.5458614);
    // path_75.lineTo(size.width * 0.5306313, size.height * 0.5469870);
    // path_75.cubicTo(
    //     size.width * 0.5311387,
    //     size.height * 0.5479067,
    //     size.width * 0.5321871,
    //     size.height * 0.5485518,
    //     size.width * 0.5331567,
    //     size.height * 0.5485518);
    // path_75.close();

    // Paint paint_75_fill = Paint()..style = PaintingStyle.fill;
    // paint_75_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_75, paint_75_fill);

    // Paint paint_76_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_76_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5374859, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_76_stroke);

    // Paint paint_76_fill = Paint()..style = PaintingStyle.fill;
    // paint_76_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5374859, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_76_fill);

    // Path path_77 = Path();
    // path_77.moveTo(size.width * 0.5550169, size.height * 0.5998627);
    // path_77.lineTo(size.width * 0.5564262, size.height * 0.5998627);
    // path_77.lineTo(size.width * 0.5564262, size.height * 0.5935621);
    // path_77.lineTo(size.width * 0.5589741, size.height * 0.5993137);
    // path_77.lineTo(size.width * 0.5615333, size.height * 0.5935621);
    // path_77.lineTo(size.width * 0.5615333, size.height * 0.5998627);
    // path_77.lineTo(size.width * 0.5629312, size.height * 0.5998627);
    // path_77.lineTo(size.width * 0.5629312, size.height * 0.5904324);
    // path_77.lineTo(size.width * 0.5615333, size.height * 0.5904324);
    // path_77.lineTo(size.width * 0.5589741, size.height * 0.5961839);
    // path_77.lineTo(size.width * 0.5564262, size.height * 0.5904324);
    // path_77.lineTo(size.width * 0.5550169, size.height * 0.5904324);
    // path_77.lineTo(size.width * 0.5550169, size.height * 0.5998627);
    // path_77.close();

    // Paint paint_77_fill = Paint()..style = PaintingStyle.fill;
    // paint_77_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_77, paint_77_fill);

    // Paint paint_78_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_78_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5279030, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_78_stroke);

    // Paint paint_78_fill = Paint()..style = PaintingStyle.fill;
    // paint_78_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5279030, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_78_fill);

    // Path path_79 = Path();
    // path_79.moveTo(size.width * 0.5480158, size.height * 0.4449142);
    // path_79.cubicTo(
    //     size.width * 0.5496843,
    //     size.height * 0.4449142,
    //     size.width * 0.5510372,
    //     size.height * 0.4439259,
    //     size.width * 0.5510372,
    //     size.height * 0.4422375);
    // path_79.cubicTo(
    //     size.width * 0.5510372,
    //     size.height * 0.4411256,
    //     size.width * 0.5503720,
    //     size.height * 0.4403020,
    //     size.width * 0.5494589,
    //     size.height * 0.4398765);
    // path_79.cubicTo(
    //     size.width * 0.5502368,
    //     size.height * 0.4394921,
    //     size.width * 0.5508343,
    //     size.height * 0.4387920,
    //     size.width * 0.5508343,
    //     size.height * 0.4376939);
    // path_79.cubicTo(
    //     size.width * 0.5508343,
    //     size.height * 0.4361016,
    //     size.width * 0.5495152,
    //     size.height * 0.4351544,
    //     size.width * 0.5480158,
    //     size.height * 0.4351544);
    // path_79.cubicTo(
    //     size.width * 0.5465614,
    //     size.height * 0.4351544,
    //     size.width * 0.5452086,
    //     size.height * 0.4360741,
    //     size.width * 0.5452086,
    //     size.height * 0.4376939);
    // path_79.cubicTo(
    //     size.width * 0.5452086,
    //     size.height * 0.4387646,
    //     size.width * 0.5457835,
    //     size.height * 0.4394647,
    //     size.width * 0.5465840,
    //     size.height * 0.4398765);
    // path_79.cubicTo(
    //     size.width * 0.5456821,
    //     size.height * 0.4402745,
    //     size.width * 0.5450056,
    //     size.height * 0.4410981,
    //     size.width * 0.5450056,
    //     size.height * 0.4422375);
    // path_79.cubicTo(
    //     size.width * 0.5450056,
    //     size.height * 0.4439121,
    //     size.width * 0.5463360,
    //     size.height * 0.4449142,
    //     size.width * 0.5480158,
    //     size.height * 0.4449142);
    // path_79.close();
    // path_79.moveTo(size.width * 0.5480158, size.height * 0.4392588);
    // path_79.cubicTo(
    //     size.width * 0.5473732,
    //     size.height * 0.4392176,
    //     size.width * 0.5465953,
    //     size.height * 0.4387509,
    //     size.width * 0.5465953,
    //     size.height * 0.4379135);
    // path_79.cubicTo(
    //     size.width * 0.5465953,
    //     size.height * 0.4371723,
    //     size.width * 0.5472041,
    //     size.height * 0.4366095,
    //     size.width * 0.5480158,
    //     size.height * 0.4366095);
    // path_79.cubicTo(
    //     size.width * 0.5488275,
    //     size.height * 0.4366095,
    //     size.width * 0.5494476,
    //     size.height * 0.4371723,
    //     size.width * 0.5494476,
    //     size.height * 0.4379135);
    // path_79.cubicTo(
    //     size.width * 0.5494476,
    //     size.height * 0.4387371,
    //     size.width * 0.5486809,
    //     size.height * 0.4392176,
    //     size.width * 0.5480158,
    //     size.height * 0.4392588);
    // path_79.close();
    // path_79.moveTo(size.width * 0.5480158, size.height * 0.4434454);
    // path_79.cubicTo(
    //     size.width * 0.5471026,
    //     size.height * 0.4434454,
    //     size.width * 0.5464149,
    //     size.height * 0.4428964,
    //     size.width * 0.5464149,
    //     size.height * 0.4420728);
    // path_79.cubicTo(
    //     size.width * 0.5464149,
    //     size.height * 0.4411942,
    //     size.width * 0.5473055,
    //     size.height * 0.4406726,
    //     size.width * 0.5480158,
    //     size.height * 0.4406314);
    // path_79.cubicTo(
    //     size.width * 0.5487373,
    //     size.height * 0.4406726,
    //     size.width * 0.5496167,
    //     size.height * 0.4411942,
    //     size.width * 0.5496167,
    //     size.height * 0.4420728);
    // path_79.cubicTo(
    //     size.width * 0.5496167,
    //     size.height * 0.4428964,
    //     size.width * 0.5489177,
    //     size.height * 0.4434454,
    //     size.width * 0.5480158,
    //     size.height * 0.4434454);
    // path_79.close();

    // Paint paint_79_fill = Paint()..style = PaintingStyle.fill;
    // paint_79_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_79, paint_79_fill);

    // Paint paint_80_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_80_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5431229, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_80_stroke);

    // Paint paint_80_fill = Paint()..style = PaintingStyle.fill;
    // paint_80_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5431229, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_80_fill);

    // Path path_81 = Path();
    // path_81.moveTo(size.width * 0.5633935, size.height * 0.4962251);
    // path_81.lineTo(size.width * 0.5647914, size.height * 0.4962251);
    // path_81.lineTo(size.width * 0.5647914, size.height * 0.4867948);
    // path_81.lineTo(size.width * 0.5633935, size.height * 0.4867948);
    // path_81.lineTo(size.width * 0.5633935, size.height * 0.4962251);
    // path_81.close();

    // Paint paint_81_fill = Paint()..style = PaintingStyle.fill;
    // paint_81_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_81, paint_81_fill);

    // Paint paint_82_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_82_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5589064, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_82_stroke);

    // Paint paint_82_fill = Paint()..style = PaintingStyle.fill;
    // paint_82_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5589064, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_82_fill);

    // Path path_83 = Path();
    // path_83.moveTo(size.width * 0.5776663, size.height * 0.5468222);
    // path_83.lineTo(size.width * 0.5776663, size.height * 0.5389568);
    // path_83.lineTo(size.width * 0.5762683, size.height * 0.5389568);
    // path_83.lineTo(size.width * 0.5762683, size.height * 0.5483871);
    // path_83.lineTo(size.width * 0.5816460, size.height * 0.5483871);
    // path_83.lineTo(size.width * 0.5816460, size.height * 0.5468222);
    // path_83.lineTo(size.width * 0.5776663, size.height * 0.5468222);
    // path_83.close();

    // Paint paint_83_fill = Paint()..style = PaintingStyle.fill;
    // paint_83_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_83, paint_83_fill);

    // Paint paint_84_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_84_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5825817, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_84_stroke);

    // Paint paint_84_fill = Paint()..style = PaintingStyle.fill;
    // paint_84_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5825817, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_84_fill);

    // Path path_85 = Path();
    // path_85.moveTo(size.width * 0.6006652, size.height * 0.6018119);
    // path_85.cubicTo(
    //     size.width * 0.6014205,
    //     size.height * 0.6008236,
    //     size.width * 0.6017475,
    //     size.height * 0.6001098,
    //     size.width * 0.6017475,
    //     size.height * 0.5993686);
    // path_85.cubicTo(
    //     size.width * 0.6017475,
    //     size.height * 0.5985038,
    //     size.width * 0.6013754,
    //     size.height * 0.5978723,
    //     size.width * 0.6008005,
    //     size.height * 0.5978723);
    // path_85.cubicTo(
    //     size.width * 0.6003157,
    //     size.height * 0.5978723,
    //     size.width * 0.5999211,
    //     size.height * 0.5983665,
    //     size.width * 0.5999211,
    //     size.height * 0.5989430);
    // path_85.cubicTo(
    //     size.width * 0.5999211,
    //     size.height * 0.5995333,
    //     size.width * 0.6003044,
    //     size.height * 0.6000275,
    //     size.width * 0.6007779,
    //     size.height * 0.6000275);
    // path_85.cubicTo(
    //     size.width * 0.6006877,
    //     size.height * 0.6004667,
    //     size.width * 0.6004622,
    //     size.height * 0.6009060,
    //     size.width * 0.6001240,
    //     size.height * 0.6013178);
    // path_85.lineTo(size.width * 0.6006652, size.height * 0.6018119);
    // path_85.close();

    // Paint paint_85_fill = Paint()..style = PaintingStyle.fill;
    // paint_85_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_85, paint_85_fill);

    // Paint paint_86_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_86_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5837091, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_86_stroke);

    // Paint paint_86_fill = Paint()..style = PaintingStyle.fill;
    // paint_86_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5837091, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_86_fill);

    // Path path_87 = Path();
    // path_87.moveTo(size.width * 0.6008117, size.height * 0.6433905);
    // path_87.cubicTo(
    //     size.width * 0.6000789,
    //     size.height * 0.6433905,
    //     size.width * 0.5993123,
    //     size.height * 0.6436376,
    //     size.width * 0.5984893,
    //     size.height * 0.6441318);
    // path_87.lineTo(size.width * 0.5989628, size.height * 0.6452986);
    // path_87.cubicTo(
    //     size.width * 0.5994589,
    //     size.height * 0.6449966,
    //     size.width * 0.5999887,
    //     size.height * 0.6447632,
    //     size.width * 0.6005411,
    //     size.height * 0.6447632);
    // path_87.cubicTo(
    //     size.width * 0.6016009,
    //     size.height * 0.6447632,
    //     size.width * 0.6019729,
    //     size.height * 0.6455594,
    //     size.width * 0.6019729,
    //     size.height * 0.6463830);
    // path_87.lineTo(size.width * 0.6019729, size.height * 0.6465752);
    // path_87.cubicTo(
    //     size.width * 0.6014431,
    //     size.height * 0.6463281,
    //     size.width * 0.6008681,
    //     size.height * 0.6461908,
    //     size.width * 0.6003382,
    //     size.height * 0.6461908);
    // path_87.cubicTo(
    //     size.width * 0.5990304,
    //     size.height * 0.6461908,
    //     size.width * 0.5979594,
    //     size.height * 0.6471517,
    //     size.width * 0.5979594,
    //     size.height * 0.6485518);
    // path_87.cubicTo(
    //     size.width * 0.5979594,
    //     size.height * 0.6499245,
    //     size.width * 0.5988952,
    //     size.height * 0.6508167,
    //     size.width * 0.6001353,
    //     size.height * 0.6508167);
    // path_87.cubicTo(
    //     size.width * 0.6008117,
    //     size.height * 0.6508167,
    //     size.width * 0.6015445,
    //     size.height * 0.6504598,
    //     size.width * 0.6019729,
    //     size.height * 0.6498010);
    // path_87.lineTo(size.width * 0.6019729, size.height * 0.6506520);
    // path_87.lineTo(size.width * 0.6033145, size.height * 0.6506520);
    // path_87.lineTo(size.width * 0.6033145, size.height * 0.6463830);
    // path_87.cubicTo(
    //     size.width * 0.6033145,
    //     size.height * 0.6445848,
    //     size.width * 0.6023563,
    //     size.height * 0.6433905,
    //     size.width * 0.6008117,
    //     size.height * 0.6433905);
    // path_87.close();
    // path_87.moveTo(size.width * 0.6004397, size.height * 0.6495951);
    // path_87.cubicTo(
    //     size.width * 0.5997858,
    //     size.height * 0.6495951,
    //     size.width * 0.5993010,
    //     size.height * 0.6491695,
    //     size.width * 0.5993010,
    //     size.height * 0.6484969);
    // path_87.cubicTo(
    //     size.width * 0.5993010,
    //     size.height * 0.6478243,
    //     size.width * 0.5998534,
    //     size.height * 0.6473576,
    //     size.width * 0.6005411,
    //     size.height * 0.6473576);
    // path_87.cubicTo(
    //     size.width * 0.6010598,
    //     size.height * 0.6473576,
    //     size.width * 0.6015445,
    //     size.height * 0.6474537,
    //     size.width * 0.6019729,
    //     size.height * 0.6476321);
    // path_87.lineTo(size.width * 0.6019729, size.height * 0.6484283);
    // path_87.cubicTo(
    //     size.width * 0.6018151,
    //     size.height * 0.6491833,
    //     size.width * 0.6011048,
    //     size.height * 0.6495951,
    //     size.width * 0.6004397,
    //     size.height * 0.6495951);
    // path_87.close();
    // path_87.moveTo(size.width * 0.6048027, size.height * 0.6506520);
    // path_87.lineTo(size.width * 0.6061781, size.height * 0.6506520);
    // path_87.lineTo(size.width * 0.6061781, size.height * 0.6410570);
    // path_87.lineTo(size.width * 0.6048027, size.height * 0.6410570);
    // path_87.lineTo(size.width * 0.6048027, size.height * 0.6506520);
    // path_87.close();
    // path_87.moveTo(size.width * 0.6106088, size.height * 0.6491283);
    // path_87.cubicTo(
    //     size.width * 0.6104848,
    //     size.height * 0.6492793,
    //     size.width * 0.6102706,
    //     size.height * 0.6493892,
    //     size.width * 0.6100338,
    //     size.height * 0.6493892);
    // path_87.cubicTo(
    //     size.width * 0.6097069,
    //     size.height * 0.6493892,
    //     size.width * 0.6094589,
    //     size.height * 0.6490460,
    //     size.width * 0.6094589,
    //     size.height * 0.6485655);
    // path_87.lineTo(size.width * 0.6094589, size.height * 0.6449417);
    // path_87.lineTo(size.width * 0.6107779, size.height * 0.6449417);
    // path_87.lineTo(size.width * 0.6107779, size.height * 0.6435553);
    // path_87.lineTo(size.width * 0.6094589, size.height * 0.6435553);
    // path_87.lineTo(size.width * 0.6094589, size.height * 0.6416060);
    // path_87.lineTo(size.width * 0.6081172, size.height * 0.6416060);
    // path_87.lineTo(size.width * 0.6081172, size.height * 0.6435553);
    // path_87.lineTo(size.width * 0.6072717, size.height * 0.6435553);
    // path_87.lineTo(size.width * 0.6072717, size.height * 0.6449417);
    // path_87.lineTo(size.width * 0.6081172, size.height * 0.6449417);
    // path_87.lineTo(size.width * 0.6081172, size.height * 0.6487714);
    // path_87.cubicTo(
    //     size.width * 0.6081172,
    //     size.height * 0.6499657,
    //     size.width * 0.6087937,
    //     size.height * 0.6508167,
    //     size.width * 0.6097632,
    //     size.height * 0.6508167);
    // path_87.cubicTo(
    //     size.width * 0.6102029,
    //     size.height * 0.6508167,
    //     size.width * 0.6106764,
    //     size.height * 0.6505971,
    //     size.width * 0.6110034,
    //     size.height * 0.6502539);
    // path_87.lineTo(size.width * 0.6106088, size.height * 0.6491283);
    // path_87.close();

    // Paint paint_87_fill = Paint()..style = PaintingStyle.fill;
    // paint_87_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_87, paint_87_fill);

    // Paint paint_88_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_88_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5729989, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_88_stroke);

    // Paint paint_88_fill = Paint()..style = PaintingStyle.fill;
    // paint_88_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5729989, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_88_fill);

    // Path path_89 = Path();
    // path_89.moveTo(size.width * 0.5930778, size.height * 0.4351544);
    // path_89.cubicTo(
    //     size.width * 0.5914092,
    //     size.height * 0.4351544,
    //     size.width * 0.5901917,
    //     size.height * 0.4364997,
    //     size.width * 0.5901917,
    //     size.height * 0.4383665);
    // path_89.cubicTo(
    //     size.width * 0.5901917,
    //     size.height * 0.4402471,
    //     size.width * 0.5913754,
    //     size.height * 0.4413452,
    //     size.width * 0.5927959,
    //     size.height * 0.4413452);
    // path_89.cubicTo(
    //     size.width * 0.5935851,
    //     size.height * 0.4413452,
    //     size.width * 0.5943292,
    //     size.height * 0.4409472,
    //     size.width * 0.5948027,
    //     size.height * 0.4402745);
    // path_89.cubicTo(
    //     size.width * 0.5947125,
    //     size.height * 0.4421277,
    //     size.width * 0.5939346,
    //     size.height * 0.4434043,
    //     size.width * 0.5928410,
    //     size.height * 0.4434043);
    // path_89.cubicTo(
    //     size.width * 0.5921533,
    //     size.height * 0.4434043,
    //     size.width * 0.5916798,
    //     size.height * 0.4430611,
    //     size.width * 0.5912063,
    //     size.height * 0.4425532);
    // path_89.lineTo(size.width * 0.5905186, size.height * 0.4438572);
    // path_89.cubicTo(
    //     size.width * 0.5911387,
    //     size.height * 0.4445024,
    //     size.width * 0.5918715,
    //     size.height * 0.4449142,
    //     size.width * 0.5928298,
    //     size.height * 0.4449142);
    // path_89.cubicTo(
    //     size.width * 0.5948478,
    //     size.height * 0.4449142,
    //     size.width * 0.5962570,
    //     size.height * 0.4427865,
    //     size.width * 0.5962570,
    //     size.height * 0.4398765);
    // path_89.cubicTo(
    //     size.width * 0.5962570,
    //     size.height * 0.4371585,
    //     size.width * 0.5952762,
    //     size.height * 0.4351544,
    //     size.width * 0.5930778,
    //     size.height * 0.4351544);
    // path_89.close();
    // path_89.moveTo(size.width * 0.5931680, size.height * 0.4399451);
    // path_89.cubicTo(
    //     size.width * 0.5923224,
    //     size.height * 0.4399451,
    //     size.width * 0.5916234,
    //     size.height * 0.4393274,
    //     size.width * 0.5916234,
    //     size.height * 0.4382979);
    // path_89.cubicTo(
    //     size.width * 0.5916234,
    //     size.height * 0.4374331,
    //     size.width * 0.5921984,
    //     size.height * 0.4366095,
    //     size.width * 0.5931454,
    //     size.height * 0.4366095);
    // path_89.cubicTo(
    //     size.width * 0.5940812,
    //     size.height * 0.4366095,
    //     size.width * 0.5945660,
    //     size.height * 0.4373919,
    //     size.width * 0.5947351,
    //     size.height * 0.4386410);
    // path_89.cubicTo(
    //     size.width * 0.5945096,
    //     size.height * 0.4394372,
    //     size.width * 0.5939121,
    //     size.height * 0.4399451,
    //     size.width * 0.5931680,
    //     size.height * 0.4399451);
    // path_89.close();

    // Paint paint_89_fill = Paint()..style = PaintingStyle.fill;
    // paint_89_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_89, paint_89_fill);

    // Paint paint_90_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_90_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5882187, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_90_stroke);

    // Paint paint_90_fill = Paint()..style = PaintingStyle.fill;
    // paint_90_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5882187, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_90_fill);

    // Path path_91 = Path();
    // path_91.moveTo(size.width * 0.6088613, size.height * 0.4963898);
    // path_91.cubicTo(
    //     size.width * 0.6110598,
    //     size.height * 0.4963898,
    //     size.width * 0.6129200,
    //     size.height * 0.4941524,
    //     size.width * 0.6129200,
    //     size.height * 0.4915031);
    // path_91.cubicTo(
    //     size.width * 0.6129200,
    //     size.height * 0.4888538,
    //     size.width * 0.6110598,
    //     size.height * 0.4866301,
    //     size.width * 0.6088613,
    //     size.height * 0.4866301);
    // path_91.cubicTo(
    //     size.width * 0.6066516,
    //     size.height * 0.4866301,
    //     size.width * 0.6047914,
    //     size.height * 0.4888538,
    //     size.width * 0.6047914,
    //     size.height * 0.4915031);
    // path_91.cubicTo(
    //     size.width * 0.6047914,
    //     size.height * 0.4941524,
    //     size.width * 0.6066516,
    //     size.height * 0.4963898,
    //     size.width * 0.6088613,
    //     size.height * 0.4963898);
    // path_91.close();
    // path_91.moveTo(size.width * 0.6088613, size.height * 0.4948250);
    // path_91.cubicTo(
    //     size.width * 0.6074295,
    //     size.height * 0.4948250,
    //     size.width * 0.6062232,
    //     size.height * 0.4933150,
    //     size.width * 0.6062232,
    //     size.height * 0.4915031);
    // path_91.cubicTo(
    //     size.width * 0.6062232,
    //     size.height * 0.4897049,
    //     size.width * 0.6074295,
    //     size.height * 0.4881949,
    //     size.width * 0.6088613,
    //     size.height * 0.4881949);
    // path_91.cubicTo(
    //     size.width * 0.6102818,
    //     size.height * 0.4881949,
    //     size.width * 0.6114769,
    //     size.height * 0.4897049,
    //     size.width * 0.6114769,
    //     size.height * 0.4915031);
    // path_91.cubicTo(
    //     size.width * 0.6114769,
    //     size.height * 0.4933150,
    //     size.width * 0.6102818,
    //     size.height * 0.4948250,
    //     size.width * 0.6088613,
    //     size.height * 0.4948250);
    // path_91.close();

    // Paint paint_91_fill = Paint()..style = PaintingStyle.fill;
    // paint_91_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_91, paint_91_fill);

    // Paint paint_92_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_92_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6040023, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_92_stroke);

    // Paint paint_92_fill = Paint()..style = PaintingStyle.fill;
    // paint_92_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6040023, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_92_fill);

    // Path path_93 = Path();
    // path_93.moveTo(size.width * 0.6227396, size.height * 0.5483871);
    // path_93.lineTo(size.width * 0.6241375, size.height * 0.5483871);
    // path_93.lineTo(size.width * 0.6241375, size.height * 0.5389568);
    // path_93.lineTo(size.width * 0.6230101, size.height * 0.5389568);
    // path_93.lineTo(size.width * 0.6208343, size.height * 0.5407550);
    // path_93.lineTo(size.width * 0.6214092, size.height * 0.5419629);
    // path_93.lineTo(size.width * 0.6227396, size.height * 0.5409334);
    // path_93.lineTo(size.width * 0.6227396, size.height * 0.5483871);
    // path_93.close();

    // Paint paint_93_fill = Paint()..style = PaintingStyle.fill;
    // paint_93_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_93, paint_93_fill);

    // Paint paint_94_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_94_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6276776, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_94_stroke);

    // Paint paint_94_fill = Paint()..style = PaintingStyle.fill;
    // paint_94_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6276776, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_94_fill);

    // Path path_95 = Path();
    // path_95.moveTo(size.width * 0.6458963, size.height * 0.6000275);
    // path_95.cubicTo(
    //     size.width * 0.6463698,
    //     size.height * 0.6000275,
    //     size.width * 0.6467644,
    //     size.height * 0.5995333,
    //     size.width * 0.6467644,
    //     size.height * 0.5989293);
    // path_95.cubicTo(
    //     size.width * 0.6467644,
    //     size.height * 0.5983665,
    //     size.width * 0.6463698,
    //     size.height * 0.5978723,
    //     size.width * 0.6458963,
    //     size.height * 0.5978723);
    // path_95.cubicTo(
    //     size.width * 0.6453777,
    //     size.height * 0.5978723,
    //     size.width * 0.6449944,
    //     size.height * 0.5983665,
    //     size.width * 0.6449944,
    //     size.height * 0.5989293);
    // path_95.cubicTo(
    //     size.width * 0.6449944,
    //     size.height * 0.5995333,
    //     size.width * 0.6453777,
    //     size.height * 0.6000275,
    //     size.width * 0.6458963,
    //     size.height * 0.6000275);
    // path_95.close();

    // Paint paint_95_fill = Paint()..style = PaintingStyle.fill;
    // paint_95_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_95, paint_95_fill);

    // Paint paint_96_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_96_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6288050, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_96_stroke);

    // Paint paint_96_fill = Paint()..style = PaintingStyle.fill;
    // paint_96_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6288050, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_96_fill);

    // Path path_97 = Path();
    // path_97.moveTo(size.width * 0.6444870, size.height * 0.6508167);
    // path_97.cubicTo(
    //     size.width * 0.6454115,
    //     size.height * 0.6508167,
    //     size.width * 0.6461894,
    //     size.height * 0.6503500,
    //     size.width * 0.6467531,
    //     size.height * 0.6496225);
    // path_97.lineTo(size.width * 0.6458286, size.height * 0.6486479);
    // path_97.cubicTo(
    //     size.width * 0.6455017,
    //     size.height * 0.6491009,
    //     size.width * 0.6450056,
    //     size.height * 0.6493892,
    //     size.width * 0.6444983,
    //     size.height * 0.6493892);
    // path_97.cubicTo(
    //     size.width * 0.6435400,
    //     size.height * 0.6493892,
    //     size.width * 0.6427396,
    //     size.height * 0.6483459,
    //     size.width * 0.6427396,
    //     size.height * 0.6470968);
    // path_97.cubicTo(
    //     size.width * 0.6427396,
    //     size.height * 0.6458614,
    //     size.width * 0.6435400,
    //     size.height * 0.6448181,
    //     size.width * 0.6444983,
    //     size.height * 0.6448181);
    // path_97.cubicTo(
    //     size.width * 0.6449944,
    //     size.height * 0.6448181,
    //     size.width * 0.6454791,
    //     size.height * 0.6451064,
    //     size.width * 0.6457948,
    //     size.height * 0.6455319);
    // path_97.lineTo(size.width * 0.6467193, size.height * 0.6445436);
    // path_97.cubicTo(
    //     size.width * 0.6461669,
    //     size.height * 0.6438435,
    //     size.width * 0.6453890,
    //     size.height * 0.6433905,
    //     size.width * 0.6445096,
    //     size.height * 0.6433905);
    // path_97.cubicTo(
    //     size.width * 0.6428072,
    //     size.height * 0.6433905,
    //     size.width * 0.6413754,
    //     size.height * 0.6450789,
    //     size.width * 0.6413754,
    //     size.height * 0.6470968);
    // path_97.cubicTo(
    //     size.width * 0.6413754,
    //     size.height * 0.6491146,
    //     size.width * 0.6428072,
    //     size.height * 0.6508167,
    //     size.width * 0.6444870,
    //     size.height * 0.6508167);
    // path_97.close();
    // path_97.moveTo(size.width * 0.6507441, size.height * 0.6491283);
    // path_97.cubicTo(
    //     size.width * 0.6506201,
    //     size.height * 0.6492793,
    //     size.width * 0.6504059,
    //     size.height * 0.6493892,
    //     size.width * 0.6501691,
    //     size.height * 0.6493892);
    // path_97.cubicTo(
    //     size.width * 0.6498422,
    //     size.height * 0.6493892,
    //     size.width * 0.6495941,
    //     size.height * 0.6490460,
    //     size.width * 0.6495941,
    //     size.height * 0.6485655);
    // path_97.lineTo(size.width * 0.6495941, size.height * 0.6449417);
    // path_97.lineTo(size.width * 0.6509132, size.height * 0.6449417);
    // path_97.lineTo(size.width * 0.6509132, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6495941, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6495941, size.height * 0.6416060);
    // path_97.lineTo(size.width * 0.6482525, size.height * 0.6416060);
    // path_97.lineTo(size.width * 0.6482525, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6474070, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6474070, size.height * 0.6449417);
    // path_97.lineTo(size.width * 0.6482525, size.height * 0.6449417);
    // path_97.lineTo(size.width * 0.6482525, size.height * 0.6487714);
    // path_97.cubicTo(
    //     size.width * 0.6482525,
    //     size.height * 0.6499657,
    //     size.width * 0.6489290,
    //     size.height * 0.6508167,
    //     size.width * 0.6498985,
    //     size.height * 0.6508167);
    // path_97.cubicTo(
    //     size.width * 0.6503382,
    //     size.height * 0.6508167,
    //     size.width * 0.6508117,
    //     size.height * 0.6505971,
    //     size.width * 0.6511387,
    //     size.height * 0.6502539);
    // path_97.lineTo(size.width * 0.6507441, size.height * 0.6491283);
    // path_97.close();
    // path_97.moveTo(size.width * 0.6536133, size.height * 0.6449279);
    // path_97.lineTo(size.width * 0.6536133, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6522379, size.height * 0.6435553);
    // path_97.lineTo(size.width * 0.6522379, size.height * 0.6506520);
    // path_97.lineTo(size.width * 0.6536133, size.height * 0.6506520);
    // path_97.lineTo(size.width * 0.6536133, size.height * 0.6470693);
    // path_97.cubicTo(
    //     size.width * 0.6536133,
    //     size.height * 0.6457241,
    //     size.width * 0.6544476,
    //     size.height * 0.6448181,
    //     size.width * 0.6556990,
    //     size.height * 0.6448181);
    // path_97.lineTo(size.width * 0.6556990, size.height * 0.6433905);
    // path_97.cubicTo(
    //     size.width * 0.6547407,
    //     size.height * 0.6433905,
    //     size.width * 0.6539853,
    //     size.height * 0.6439808,
    //     size.width * 0.6536133,
    //     size.height * 0.6449279);
    // path_97.close();
    // path_97.moveTo(size.width * 0.6567193, size.height * 0.6506520);
    // path_97.lineTo(size.width * 0.6580947, size.height * 0.6506520);
    // path_97.lineTo(size.width * 0.6580947, size.height * 0.6410570);
    // path_97.lineTo(size.width * 0.6567193, size.height * 0.6410570);
    // path_97.lineTo(size.width * 0.6567193, size.height * 0.6506520);
    // path_97.close();

    // Paint paint_97_fill = Paint()..style = PaintingStyle.fill;
    // paint_97_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_97, paint_97_fill);

    // Paint paint_98_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_98_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6180947, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_98_stroke);

    // Paint paint_98_fill = Paint()..style = PaintingStyle.fill;
    // paint_98_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6180947, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_98_fill);

    // Path path_99 = Path();
    // path_99.moveTo(size.width * 0.6386809, size.height * 0.4449142);
    // path_99.cubicTo(
    //     size.width * 0.6406652,
    //     size.height * 0.4449142,
    //     size.width * 0.6420631,
    //     size.height * 0.4428964,
    //     size.width * 0.6420631,
    //     size.height * 0.4400275);
    // path_99.cubicTo(
    //     size.width * 0.6420631,
    //     size.height * 0.4371723,
    //     size.width * 0.6406652,
    //     size.height * 0.4351544,
    //     size.width * 0.6386809,
    //     size.height * 0.4351544);
    // path_99.cubicTo(
    //     size.width * 0.6366855,
    //     size.height * 0.4351544,
    //     size.width * 0.6352762,
    //     size.height * 0.4371723,
    //     size.width * 0.6352762,
    //     size.height * 0.4400275);
    // path_99.cubicTo(
    //     size.width * 0.6352762,
    //     size.height * 0.4428964,
    //     size.width * 0.6366855,
    //     size.height * 0.4449142,
    //     size.width * 0.6386809,
    //     size.height * 0.4449142);
    // path_99.close();
    // path_99.moveTo(size.width * 0.6386809, size.height * 0.4433493);
    // path_99.cubicTo(
    //     size.width * 0.6375310,
    //     size.height * 0.4433493,
    //     size.width * 0.6367193,
    //     size.height * 0.4419767,
    //     size.width * 0.6367193,
    //     size.height * 0.4400275);
    // path_99.cubicTo(
    //     size.width * 0.6367193,
    //     size.height * 0.4380782,
    //     size.width * 0.6375310,
    //     size.height * 0.4367193,
    //     size.width * 0.6386809,
    //     size.height * 0.4367193);
    // path_99.cubicTo(
    //     size.width * 0.6398196,
    //     size.height * 0.4367193,
    //     size.width * 0.6406313,
    //     size.height * 0.4380782,
    //     size.width * 0.6406313,
    //     size.height * 0.4400275);
    // path_99.cubicTo(
    //     size.width * 0.6406313,
    //     size.height * 0.4419767,
    //     size.width * 0.6398196,
    //     size.height * 0.4433493,
    //     size.width * 0.6386809,
    //     size.height * 0.4433493);
    // path_99.close();

    // Paint paint_99_fill = Paint()..style = PaintingStyle.fill;
    // paint_99_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_99, paint_99_fill);

    // Paint paint_100_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_100_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6333145, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_100_stroke);

    // Paint paint_100_fill = Paint()..style = PaintingStyle.fill;
    // paint_100_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6333145, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_100_fill);

    // Path path_101 = Path();
    // path_101.moveTo(size.width * 0.6513078, size.height * 0.4962251);
    // path_101.lineTo(size.width * 0.6527170, size.height * 0.4962251);
    // path_101.lineTo(size.width * 0.6527170, size.height * 0.4930542);
    // path_101.lineTo(size.width * 0.6546787, size.height * 0.4930542);
    // path_101.cubicTo(
    //     size.width * 0.6563360,
    //     size.height * 0.4930542,
    //     size.width * 0.6575761,
    //     size.height * 0.4917639,
    //     size.width * 0.6575761,
    //     size.height * 0.4899245);
    // path_101.cubicTo(
    //     size.width * 0.6575761,
    //     size.height * 0.4880851,
    //     size.width * 0.6563360,
    //     size.height * 0.4867948,
    //     size.width * 0.6546787,
    //     size.height * 0.4867948);
    // path_101.lineTo(size.width * 0.6513078, size.height * 0.4867948);
    // path_101.lineTo(size.width * 0.6513078, size.height * 0.4962251);
    // path_101.close();
    // path_101.moveTo(size.width * 0.6527170, size.height * 0.4914756);
    // path_101.lineTo(size.width * 0.6527170, size.height * 0.4883734);
    // path_101.lineTo(size.width * 0.6545209, size.height * 0.4883734);
    // path_101.cubicTo(
    //     size.width * 0.6554791,
    //     size.height * 0.4883734,
    //     size.width * 0.6561443,
    //     size.height * 0.4889636,
    //     size.width * 0.6561443,
    //     size.height * 0.4899245);
    // path_101.cubicTo(
    //     size.width * 0.6561443,
    //     size.height * 0.4908854,
    //     size.width * 0.6554791,
    //     size.height * 0.4914756,
    //     size.width * 0.6545209,
    //     size.height * 0.4914756);
    // path_101.lineTo(size.width * 0.6527170, size.height * 0.4914756);
    // path_101.close();

    // Paint paint_101_fill = Paint()..style = PaintingStyle.fill;
    // paint_101_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_101, paint_101_fill);

    // Paint paint_102_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_102_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6490981, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_102_stroke);

    // Paint paint_102_fill = Paint()..style = PaintingStyle.fill;
    // paint_102_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6490981, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_102_fill);

    // Path path_103 = Path();
    // path_103.moveTo(size.width * 0.6678354, size.height * 0.5483871);
    // path_103.lineTo(size.width * 0.6692334, size.height * 0.5483871);
    // path_103.lineTo(size.width * 0.6692334, size.height * 0.5389568);
    // path_103.lineTo(size.width * 0.6681060, size.height * 0.5389568);
    // path_103.lineTo(size.width * 0.6659301, size.height * 0.5407550);
    // path_103.lineTo(size.width * 0.6665051, size.height * 0.5419629);
    // path_103.lineTo(size.width * 0.6678354, size.height * 0.5409334);
    // path_103.lineTo(size.width * 0.6678354, size.height * 0.5483871);
    // path_103.close();

    // Paint paint_103_fill = Paint()..style = PaintingStyle.fill;
    // paint_103_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_103, paint_103_fill);

    // Paint paint_104_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_104_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6727734, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_104_stroke);

    // Paint paint_104_fill = Paint()..style = PaintingStyle.fill;
    // paint_104_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6727734, size.height * 0.5720659,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_104_fill);

    // Path path_105 = Path();
    // path_105.moveTo(size.width * 0.6891657, size.height * 0.6008785);
    // path_105.lineTo(size.width * 0.6906426, size.height * 0.6008785);
    // path_105.lineTo(size.width * 0.6945434, size.height * 0.5896637);
    // path_105.lineTo(size.width * 0.6930665, size.height * 0.5896637);
    // path_105.lineTo(size.width * 0.6891657, size.height * 0.6008785);
    // path_105.close();

    // Paint paint_105_fill = Paint()..style = PaintingStyle.fill;
    // paint_105_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_105, paint_105_fill);

    // Paint paint_106_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_106_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6739008, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_106_stroke);

    // Paint paint_106_fill = Paint()..style = PaintingStyle.fill;
    // paint_106_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6739008, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_106_fill);

    // Path path_107 = Path();
    // path_107.moveTo(size.width * 0.6963698, size.height * 0.6494990);
    // path_107.lineTo(size.width * 0.6963698, size.height * 0.6480851);
    // path_107.lineTo(size.width * 0.6922999, size.height * 0.6459300);
    // path_107.lineTo(size.width * 0.6963698, size.height * 0.6437749);
    // path_107.lineTo(size.width * 0.6963698, size.height * 0.6423747);
    // path_107.lineTo(size.width * 0.6911499, size.height * 0.6452711);
    // path_107.lineTo(size.width * 0.6911499, size.height * 0.6466026);
    // path_107.lineTo(size.width * 0.6963698, size.height * 0.6494990);
    // path_107.close();

    // Paint paint_107_fill = Paint()..style = PaintingStyle.fill;
    // paint_107_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_107, paint_107_fill);

    // Paint paint_108_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_108_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7860767, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_108_stroke);

    // Paint paint_108_fill = Paint()..style = PaintingStyle.fill;
    // paint_108_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7860767, size.height * 0.6228552,
    //             size.width * 0.04171364, size.height * 0.04735758),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_108_fill);

    // Path path_109 = Path();
    // path_109.moveTo(size.width * 0.8035175, size.height * 0.6494990);
    // path_109.lineTo(size.width * 0.8087373, size.height * 0.6466026);
    // path_109.lineTo(size.width * 0.8087373, size.height * 0.6452711);
    // path_109.lineTo(size.width * 0.8035175, size.height * 0.6423747);
    // path_109.lineTo(size.width * 0.8035175, size.height * 0.6437749);
    // path_109.lineTo(size.width * 0.8075874, size.height * 0.6459300);
    // path_109.lineTo(size.width * 0.8035175, size.height * 0.6480851);
    // path_109.lineTo(size.width * 0.8035175, size.height * 0.6494990);
    // path_109.close();

    // Paint paint_109_fill = Paint()..style = PaintingStyle.fill;
    // paint_109_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_109, paint_109_fill);

    // Paint paint_110_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_110_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7178692, size.height * 0.6228552,
    //             size.width * 0.06482525, size.height * 0.02196294),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_110_stroke);

    // Paint paint_110_fill = Paint()..style = PaintingStyle.fill;
    // paint_110_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7178692, size.height * 0.6228552,
    //             size.width * 0.06482525, size.height * 0.02196294),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_110_fill);

    // Path path_111 = Path();
    // path_111.moveTo(size.width * 0.7478467, size.height * 0.6371723);
    // path_111.lineTo(size.width * 0.7490079, size.height * 0.6371723);
    // path_111.lineTo(size.width * 0.7507779, size.height * 0.6322169);
    // path_111.lineTo(size.width * 0.7525479, size.height * 0.6371723);
    // path_111.lineTo(size.width * 0.7536979, size.height * 0.6371723);
    // path_111.lineTo(size.width * 0.7513191, size.height * 0.6308167);
    // path_111.lineTo(size.width * 0.7502255, size.height * 0.6308167);
    // path_111.lineTo(size.width * 0.7478467, size.height * 0.6371723);
    // path_111.close();

    // Paint paint_111_fill = Paint()..style = PaintingStyle.fill;
    // paint_111_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_111, paint_111_fill);

    // Paint paint_112_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_112_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7184329, size.height * 0.6489362,
    //             size.width * 0.06482525, size.height * 0.02196294),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_112_stroke);

    // Paint paint_112_fill = Paint()..style = PaintingStyle.fill;
    // paint_112_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7184329, size.height * 0.6489362,
    //             size.width * 0.06482525, size.height * 0.02196294),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_112_fill);

    // Path path_113 = Path();
    // path_113.moveTo(size.width * 0.7532807, size.height * 0.6572684);
    // path_113.lineTo(size.width * 0.7521195, size.height * 0.6572684);
    // path_113.lineTo(size.width * 0.7503495, size.height * 0.6622237);
    // path_113.lineTo(size.width * 0.7485795, size.height * 0.6572684);
    // path_113.lineTo(size.width * 0.7474295, size.height * 0.6572684);
    // path_113.lineTo(size.width * 0.7498083, size.height * 0.6636239);
    // path_113.lineTo(size.width * 0.7509019, size.height * 0.6636239);
    // path_113.lineTo(size.width * 0.7532807, size.height * 0.6572684);
    // path_113.close();

    // Paint paint_113_fill = Paint()..style = PaintingStyle.fill;
    // paint_113_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_113, paint_113_fill);

    // Paint paint_114_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_114_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6631905, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_114_stroke);

    // Paint paint_114_fill = Paint()..style = PaintingStyle.fill;
    // paint_114_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6631905, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_114_fill);

    // Path path_115 = Path();
    // path_115.moveTo(size.width * 0.6803720, size.height * 0.4417159);
    // path_115.lineTo(size.width * 0.6834047, size.height * 0.4417159);
    // path_115.lineTo(size.width * 0.6834047, size.height * 0.4402471);
    // path_115.lineTo(size.width * 0.6803720, size.height * 0.4402471);
    // path_115.lineTo(size.width * 0.6803720, size.height * 0.4417159);
    // path_115.close();

    // Paint paint_115_fill = Paint()..style = PaintingStyle.fill;
    // paint_115_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_115, paint_115_fill);

    // Paint paint_116_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_116_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6784104, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_116_stroke);

    // Paint paint_116_fill = Paint()..style = PaintingStyle.fill;
    // paint_116_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6784104, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_116_fill);

    // Path path_117 = Path();
    // path_117.moveTo(size.width * 0.6981285, size.height * 0.4980508);
    // path_117.lineTo(size.width * 0.7010598, size.height * 0.4980508);
    // path_117.lineTo(size.width * 0.7010598, size.height * 0.4969115);
    // path_117.lineTo(size.width * 0.6992446, size.height * 0.4969115);
    // path_117.lineTo(size.width * 0.6992446, size.height * 0.4875360);
    // path_117.lineTo(size.width * 0.7010598, size.height * 0.4875360);
    // path_117.lineTo(size.width * 0.7010598, size.height * 0.4863967);
    // path_117.lineTo(size.width * 0.6981285, size.height * 0.4863967);
    // path_117.lineTo(size.width * 0.6981285, size.height * 0.4980508);
    // path_117.close();

    // Paint paint_117_fill = Paint()..style = PaintingStyle.fill;
    // paint_117_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_117, paint_117_fill);

    // Paint paint_118_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_118_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6941939, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_118_stroke);

    // Paint paint_118_fill = Paint()..style = PaintingStyle.fill;
    // paint_118_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6941939, size.height * 0.5205903,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_118_fill);

    // Path path_119 = Path();
    // path_119.moveTo(size.width * 0.7129312, size.height * 0.5483871);
    // path_119.lineTo(size.width * 0.7143292, size.height * 0.5483871);
    // path_119.lineTo(size.width * 0.7143292, size.height * 0.5389568);
    // path_119.lineTo(size.width * 0.7132018, size.height * 0.5389568);
    // path_119.lineTo(size.width * 0.7110259, size.height * 0.5407550);
    // path_119.lineTo(size.width * 0.7116009, size.height * 0.5419629);
    // path_119.lineTo(size.width * 0.7129312, size.height * 0.5409334);
    // path_119.lineTo(size.width * 0.7129312, size.height * 0.5483871);
    // path_119.close();

    // Paint paint_119_fill = Paint()..style = PaintingStyle.fill;
    // paint_119_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_119, paint_119_fill);

    // Paint paint_120_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_120_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7178692, size.height * 0.5720659,
    //             size.width * 0.1087937, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_120_stroke);

    // Paint paint_120_fill = Paint()..style = PaintingStyle.fill;
    // paint_120_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7178692, size.height * 0.5720659,
    //             size.width * 0.1087937, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_120_fill);

    // Path path_121 = Path();
    // path_121.moveTo(size.width * 0.7615953, size.height * 0.5940769);
    // path_121.lineTo(size.width * 0.7581736, size.height * 0.5899108);
    // path_121.lineTo(size.width * 0.7547520, size.height * 0.5940769);

    // Paint paint_121_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_121_stroke.color = Colors.white.withOpacity(1.0);
    // paint_121_stroke.strokeCap = StrokeCap.round;
    // paint_121_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_121, paint_121_stroke);

    // Paint paint_121_fill = Paint()..style = PaintingStyle.fill;
    // paint_121_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_121, paint_121_fill);

    // Path path_122 = Path();
    // path_122.moveTo(size.width * 0.7581736, size.height * 0.6015786);
    // path_122.lineTo(size.width * 0.7581736, size.height * 0.5900275);

    // Paint paint_122_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_122_stroke.color = Colors.white.withOpacity(1.0);
    // paint_122_stroke.strokeCap = StrokeCap.round;
    // paint_122_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_122, paint_122_stroke);

    // Paint paint_122_fill = Paint()..style = PaintingStyle.fill;
    // paint_122_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_122, paint_122_fill);

    // Path path_123 = Path();
    // path_123.moveTo(size.width * 0.7723563, size.height * 0.6000275);
    // path_123.cubicTo(
    //     size.width * 0.7737204,
    //     size.height * 0.6000275,
    //     size.width * 0.7746449,
    //     size.height * 0.5991489,
    //     size.width * 0.7746449,
    //     size.height * 0.5977900);
    // path_123.cubicTo(
    //     size.width * 0.7746449,
    //     size.height * 0.5963075,
    //     size.width * 0.7735851,
    //     size.height * 0.5958957,
    //     size.width * 0.7726043,
    //     size.height * 0.5955662);
    // path_123.cubicTo(
    //     size.width * 0.7717136,
    //     size.height * 0.5952505,
    //     size.width * 0.7714092,
    //     size.height * 0.5951132,
    //     size.width * 0.7714092,
    //     size.height * 0.5946603);
    // path_123.cubicTo(
    //     size.width * 0.7714092,
    //     size.height * 0.5942622,
    //     size.width * 0.7717813,
    //     size.height * 0.5940288,
    //     size.width * 0.7722661,
    //     size.height * 0.5940288);
    // path_123.cubicTo(
    //     size.width * 0.7727734,
    //     size.height * 0.5940288,
    //     size.width * 0.7733709,
    //     size.height * 0.5942485,
    //     size.width * 0.7739233,
    //     size.height * 0.5946740);
    // path_123.lineTo(size.width * 0.7744983, size.height * 0.5934523);
    // path_123.cubicTo(
    //     size.width * 0.7738670,
    //     size.height * 0.5929444,
    //     size.width * 0.7730665,
    //     size.height * 0.5926012,
    //     size.width * 0.7722661,
    //     size.height * 0.5926012);
    // path_123.cubicTo(
    //     size.width * 0.7709696,
    //     size.height * 0.5926012,
    //     size.width * 0.7700676,
    //     size.height * 0.5935072,
    //     size.width * 0.7700676,
    //     size.height * 0.5948387);
    // path_123.cubicTo(
    //     size.width * 0.7700789,
    //     size.height * 0.5961016,
    //     size.width * 0.7708794,
    //     size.height * 0.5965408,
    //     size.width * 0.7721421,
    //     size.height * 0.5969389);
    // path_123.cubicTo(
    //     size.width * 0.7728072,
    //     size.height * 0.5971585,
    //     size.width * 0.7733145,
    //     size.height * 0.5973370,
    //     size.width * 0.7733145,
    //     size.height * 0.5978861);
    // path_123.cubicTo(
    //     size.width * 0.7733145,
    //     size.height * 0.5983253,
    //     size.width * 0.7729312,
    //     size.height * 0.5986136,
    //     size.width * 0.7723788,
    //     size.height * 0.5986136);
    // path_123.cubicTo(
    //     size.width * 0.7716460,
    //     size.height * 0.5986136,
    //     size.width * 0.7709921,
    //     size.height * 0.5982841,
    //     size.width * 0.7704284,
    //     size.height * 0.5977900);
    // path_123.lineTo(size.width * 0.7698083, size.height * 0.5989568);
    // path_123.cubicTo(
    //     size.width * 0.7705073,
    //     size.height * 0.5996431,
    //     size.width * 0.7714656,
    //     size.height * 0.6000275,
    //     size.width * 0.7723563,
    //     size.height * 0.6000275);
    // path_123.close();
    // path_123.moveTo(size.width * 0.7790192, size.height * 0.5926012);
    // path_123.cubicTo(
    //     size.width * 0.7782413,
    //     size.height * 0.5926012,
    //     size.width * 0.7775536,
    //     size.height * 0.5930542,
    //     size.width * 0.7772041,
    //     size.height * 0.5937406);
    // path_123.lineTo(size.width * 0.7772041, size.height * 0.5902677);
    // path_123.lineTo(size.width * 0.7758286, size.height * 0.5902677);
    // path_123.lineTo(size.width * 0.7758286, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7772041, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7772041, size.height * 0.5955662);
    // path_123.cubicTo(
    //     size.width * 0.7772041,
    //     size.height * 0.5947152,
    //     size.width * 0.7778467,
    //     size.height * 0.5940288,
    //     size.width * 0.7786246,
    //     size.height * 0.5940288);
    // path_123.cubicTo(
    //     size.width * 0.7793461,
    //     size.height * 0.5940288,
    //     size.width * 0.7798534,
    //     size.height * 0.5947152,
    //     size.width * 0.7798534,
    //     size.height * 0.5956760);
    // path_123.lineTo(size.width * 0.7798534, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7811838, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7811838, size.height * 0.5953466);
    // path_123.cubicTo(
    //     size.width * 0.7811838,
    //     size.height * 0.5937406,
    //     size.width * 0.7802931,
    //     size.height * 0.5926012,
    //     size.width * 0.7790192,
    //     size.height * 0.5926012);
    // path_123.close();
    // path_123.moveTo(size.width * 0.7833766, size.height * 0.5916953);
    // path_123.cubicTo(
    //     size.width * 0.7838050,
    //     size.height * 0.5916953,
    //     size.width * 0.7841545,
    //     size.height * 0.5912423,
    //     size.width * 0.7841545,
    //     size.height * 0.5907344);
    // path_123.cubicTo(
    //     size.width * 0.7841545,
    //     size.height * 0.5902265,
    //     size.width * 0.7838050,
    //     size.height * 0.5897872,
    //     size.width * 0.7833766,
    //     size.height * 0.5897872);
    // path_123.cubicTo(
    //     size.width * 0.7829369,
    //     size.height * 0.5897872,
    //     size.width * 0.7825874,
    //     size.height * 0.5902265,
    //     size.width * 0.7825874,
    //     size.height * 0.5907344);
    // path_123.cubicTo(
    //     size.width * 0.7825874,
    //     size.height * 0.5912423,
    //     size.width * 0.7829369,
    //     size.height * 0.5916953,
    //     size.width * 0.7833766,
    //     size.height * 0.5916953);
    // path_123.close();
    // path_123.moveTo(size.width * 0.7826776, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7840530, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7840530, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7826776, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7826776, size.height * 0.5998627);
    // path_123.close();
    // path_123.moveTo(size.width * 0.7873337, size.height * 0.5921757);
    // path_123.cubicTo(
    //     size.width * 0.7873337,
    //     size.height * 0.5916953,
    //     size.width * 0.7875817,
    //     size.height * 0.5913521,
    //     size.width * 0.7879087,
    //     size.height * 0.5913521);
    // path_123.cubicTo(
    //     size.width * 0.7881454,
    //     size.height * 0.5913521,
    //     size.width * 0.7883596,
    //     size.height * 0.5914619,
    //     size.width * 0.7884837,
    //     size.height * 0.5916129);
    // path_123.lineTo(size.width * 0.7888782, size.height * 0.5905422);
    // path_123.cubicTo(
    //     size.width * 0.7885513,
    //     size.height * 0.5901990,
    //     size.width * 0.7880778,
    //     size.height * 0.5899794,
    //     size.width * 0.7876381,
    //     size.height * 0.5899794);
    // path_123.cubicTo(
    //     size.width * 0.7866685,
    //     size.height * 0.5899794,
    //     size.width * 0.7859921,
    //     size.height * 0.5908305,
    //     size.width * 0.7859921,
    //     size.height * 0.5920247);
    // path_123.lineTo(size.width * 0.7859921, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7851466, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7851466, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7859921, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7859921, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7873337, size.height * 0.5998627);
    // path_123.lineTo(size.width * 0.7873337, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7886528, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7886528, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7873337, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7873337, size.height * 0.5921757);
    // path_123.close();
    // path_123.moveTo(size.width * 0.7926550, size.height * 0.5983391);
    // path_123.cubicTo(
    //     size.width * 0.7925310,
    //     size.height * 0.5984900,
    //     size.width * 0.7923168,
    //     size.height * 0.5985999,
    //     size.width * 0.7920800,
    //     size.height * 0.5985999);
    // path_123.cubicTo(
    //     size.width * 0.7917531,
    //     size.height * 0.5985999,
    //     size.width * 0.7915051,
    //     size.height * 0.5982567,
    //     size.width * 0.7915051,
    //     size.height * 0.5977763);
    // path_123.lineTo(size.width * 0.7915051, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7928241, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7928241, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7915051, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7915051, size.height * 0.5908167);
    // path_123.lineTo(size.width * 0.7901635, size.height * 0.5908167);
    // path_123.lineTo(size.width * 0.7901635, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7893179, size.height * 0.5927660);
    // path_123.lineTo(size.width * 0.7893179, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7901635, size.height * 0.5941524);
    // path_123.lineTo(size.width * 0.7901635, size.height * 0.5979822);
    // path_123.cubicTo(
    //     size.width * 0.7901635,
    //     size.height * 0.5991764,
    //     size.width * 0.7908399,
    //     size.height * 0.6000275,
    //     size.width * 0.7918095,
    //     size.height * 0.6000275);
    // path_123.cubicTo(
    //     size.width * 0.7922492,
    //     size.height * 0.6000275,
    //     size.width * 0.7927227,
    //     size.height * 0.5998078,
    //     size.width * 0.7930496,
    //     size.height * 0.5994647);
    // path_123.lineTo(size.width * 0.7926550, size.height * 0.5983391);
    // path_123.close();

    // Paint paint_123_fill = Paint()..style = PaintingStyle.fill;
    // paint_123_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_123, paint_123_fill);

    // Paint paint_124_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_124_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7082864, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_124_stroke);

    // Paint paint_124_fill = Paint()..style = PaintingStyle.fill;
    // paint_124_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7082864, size.height * 0.4169526,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_124_fill);

    // Path path_125 = Path();
    // path_125.moveTo(size.width * 0.7267418, size.height * 0.4392999);
    // path_125.lineTo(size.width * 0.7320970, size.height * 0.4392999);
    // path_125.lineTo(size.width * 0.7320970, size.height * 0.4378723);
    // path_125.lineTo(size.width * 0.7267418, size.height * 0.4378723);
    // path_125.lineTo(size.width * 0.7267418, size.height * 0.4392999);
    // path_125.close();
    // path_125.moveTo(size.width * 0.7267418, size.height * 0.4424022);
    // path_125.lineTo(size.width * 0.7320970, size.height * 0.4424022);
    // path_125.lineTo(size.width * 0.7320970, size.height * 0.4409746);
    // path_125.lineTo(size.width * 0.7267418, size.height * 0.4409746);
    // path_125.lineTo(size.width * 0.7267418, size.height * 0.4424022);
    // path_125.close();

    // Paint paint_125_fill = Paint()..style = PaintingStyle.fill;
    // paint_125_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_125, paint_125_fill);

    // Paint paint_126_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_126_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7235062, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_126_stroke);

    // Paint paint_126_fill = Paint()..style = PaintingStyle.fill;
    // paint_126_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7235062, size.height * 0.4684283,
    //             size.width * 0.04171364, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_126_fill);

    // Path path_127 = Path();
    // path_127.moveTo(size.width * 0.7406426, size.height * 0.4980508);
    // path_127.lineTo(size.width * 0.7435738, size.height * 0.4980508);
    // path_127.lineTo(size.width * 0.7435738, size.height * 0.4863967);
    // path_127.lineTo(size.width * 0.7406426, size.height * 0.4863967);
    // path_127.lineTo(size.width * 0.7406426, size.height * 0.4875360);
    // path_127.lineTo(size.width * 0.7424577, size.height * 0.4875360);
    // path_127.lineTo(size.width * 0.7424577, size.height * 0.4969115);
    // path_127.lineTo(size.width * 0.7406426, size.height * 0.4969115);
    // path_127.lineTo(size.width * 0.7406426, size.height * 0.4980508);
    // path_127.close();

    // Paint paint_127_fill = Paint()..style = PaintingStyle.fill;
    // paint_127_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_127, paint_127_fill);

    // Paint paint_128_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_128_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7392897, size.height * 0.5205903,
    //             size.width * 0.08737317, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_128_stroke);

    // Paint paint_128_fill = Paint()..style = PaintingStyle.fill;
    // paint_128_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7392897, size.height * 0.5205903,
    //             size.width * 0.08737317, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_128_fill);

    // Path path_129 = Path();
    // path_129.moveTo(size.width * 0.7580271, size.height * 0.5483871);
    // path_129.lineTo(size.width * 0.7594250, size.height * 0.5483871);
    // path_129.lineTo(size.width * 0.7594250, size.height * 0.5389568);
    // path_129.lineTo(size.width * 0.7582976, size.height * 0.5389568);
    // path_129.lineTo(size.width * 0.7561218, size.height * 0.5407550);
    // path_129.lineTo(size.width * 0.7566967, size.height * 0.5419629);
    // path_129.lineTo(size.width * 0.7580271, size.height * 0.5409334);
    // path_129.lineTo(size.width * 0.7580271, size.height * 0.5483871);
    // path_129.close();

    // Paint paint_129_fill = Paint()..style = PaintingStyle.fill;
    // paint_129_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_129, paint_129_fill);

    // Paint paint_130_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_130_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7533822, size.height * 0.4169526,
    //             size.width * 0.07271702, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_130_stroke);

    // Paint paint_130_fill = Paint()..style = PaintingStyle.fill;
    // paint_130_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7533822, size.height * 0.4169526,
    //             size.width * 0.07271702, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_130_fill);

    // Path path_131 = Path();
    // path_131.moveTo(size.width * 0.7883709, size.height * 0.4364653);
    // path_131.lineTo(size.width * 0.7849493, size.height * 0.4406314);
    // path_131.lineTo(size.width * 0.7883709, size.height * 0.4447975);

    // Paint paint_131_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_131_stroke.color = Colors.white.withOpacity(1.0);
    // paint_131_stroke.strokeCap = StrokeCap.round;
    // paint_131_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_131, paint_131_stroke);

    // Paint paint_131_fill = Paint()..style = PaintingStyle.fill;
    // paint_131_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_131, paint_131_fill);

    // Path path_132 = Path();
    // path_132.moveTo(size.width * 0.7945321, size.height * 0.4406314);
    // path_132.lineTo(size.width * 0.7850451, size.height * 0.4406314);

    // Paint paint_132_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.0008455468;
    // paint_132_stroke.color = Colors.white.withOpacity(1.0);
    // paint_132_stroke.strokeCap = StrokeCap.round;
    // paint_132_stroke.strokeJoin = StrokeJoin.round;
    // canvas.drawPath(path_132, paint_132_stroke);

    // Paint paint_132_fill = Paint()..style = PaintingStyle.fill;
    // paint_132_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_132, paint_132_fill);

    // Paint paint_133_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_133_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7680383, size.height * 0.4684283,
    //             size.width * 0.05862458, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_133_stroke);

    // Paint paint_133_fill = Paint()..style = PaintingStyle.fill;
    // paint_133_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7680383, size.height * 0.4684283,
    //             size.width * 0.05862458, size.height * 0.04667124),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_133_fill);

    // Path path_134 = Path();
    // path_134.moveTo(size.width * 0.7986020, size.height * 0.4972409);
    // path_134.lineTo(size.width * 0.8000789, size.height * 0.4972409);
    // path_134.lineTo(size.width * 0.7961781, size.height * 0.4860261);
    // path_134.lineTo(size.width * 0.7947012, size.height * 0.4860261);
    // path_134.lineTo(size.width * 0.7986020, size.height * 0.4972409);
    // path_134.close();

    // Paint paint_134_fill = Paint()..style = PaintingStyle.fill;
    // paint_134_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_134, paint_134_fill);

    // Paint paint_135_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_135_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2161781, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_135_stroke);

    // Paint paint_135_fill = Paint()..style = PaintingStyle.fill;
    // paint_135_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2161781, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_135_fill);

    // Path path_136 = Path();
    // path_136.moveTo(size.width * 0.2333788, size.height * 0.3897872);
    // path_136.cubicTo(
    //     size.width * 0.2333788,
    //     size.height * 0.3893548,
    //     size.width * 0.2336020,
    //     size.height * 0.3890460,
    //     size.width * 0.2338963,
    //     size.height * 0.3890460);
    // path_136.cubicTo(
    //     size.width * 0.2341094,
    //     size.height * 0.3890460,
    //     size.width * 0.2343021,
    //     size.height * 0.3891448,
    //     size.width * 0.2344138,
    //     size.height * 0.3892807);
    // path_136.lineTo(size.width * 0.2347689, size.height * 0.3883171);
    // path_136.cubicTo(
    //     size.width * 0.2344746,
    //     size.height * 0.3880082,
    //     size.width * 0.2340485,
    //     size.height * 0.3878106,
    //     size.width * 0.2336528,
    //     size.height * 0.3878106);
    // path_136.cubicTo(
    //     size.width * 0.2327802,
    //     size.height * 0.3878106,
    //     size.width * 0.2321714,
    //     size.height * 0.3885765,
    //     size.width * 0.2321714,
    //     size.height * 0.3896513);
    // path_136.lineTo(size.width * 0.2321714, size.height * 0.3903185);
    // path_136.lineTo(size.width * 0.2314104, size.height * 0.3903185);
    // path_136.lineTo(size.width * 0.2314104, size.height * 0.3915662);
    // path_136.lineTo(size.width * 0.2321714, size.height * 0.3915662);
    // path_136.lineTo(size.width * 0.2321714, size.height * 0.3967056);
    // path_136.lineTo(size.width * 0.2333788, size.height * 0.3967056);
    // path_136.lineTo(size.width * 0.2333788, size.height * 0.3915662);
    // path_136.lineTo(size.width * 0.2345660, size.height * 0.3915662);
    // path_136.lineTo(size.width * 0.2345660, size.height * 0.3903185);
    // path_136.lineTo(size.width * 0.2333788, size.height * 0.3903185);
    // path_136.lineTo(size.width * 0.2333788, size.height * 0.3897872);
    // path_136.close();
    // path_136.moveTo(size.width * 0.2367689, size.height * 0.3967056);
    // path_136.lineTo(size.width * 0.2380271, size.height * 0.3967056);
    // path_136.lineTo(size.width * 0.2380271, size.height * 0.3882183);
    // path_136.lineTo(size.width * 0.2370124, size.height * 0.3882183);
    // path_136.lineTo(size.width * 0.2350541, size.height * 0.3898367);
    // path_136.lineTo(size.width * 0.2355716, size.height * 0.3909238);
    // path_136.lineTo(size.width * 0.2367689, size.height * 0.3899973);
    // path_136.lineTo(size.width * 0.2367689, size.height * 0.3967056);
    // path_136.close();

    // Paint paint_136_fill = Paint()..style = PaintingStyle.fill;
    // paint_136_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_136, paint_136_fill);

    // Paint paint_137_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_137_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2567644, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_137_stroke);

    // Paint paint_137_fill = Paint()..style = PaintingStyle.fill;
    // paint_137_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2567644, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_137_fill);

    // Path path_138 = Path();
    // path_138.moveTo(size.width * 0.2694555, size.height * 0.3897872);
    // path_138.cubicTo(
    //     size.width * 0.2694555,
    //     size.height * 0.3893548,
    //     size.width * 0.2696787,
    //     size.height * 0.3890460,
    //     size.width * 0.2699729,
    //     size.height * 0.3890460);
    // path_138.cubicTo(
    //     size.width * 0.2701860,
    //     size.height * 0.3890460,
    //     size.width * 0.2703788,
    //     size.height * 0.3891448,
    //     size.width * 0.2704904,
    //     size.height * 0.3892807);
    // path_138.lineTo(size.width * 0.2708455, size.height * 0.3883171);
    // path_138.cubicTo(
    //     size.width * 0.2705513,
    //     size.height * 0.3880082,
    //     size.width * 0.2701251,
    //     size.height * 0.3878106,
    //     size.width * 0.2697294,
    //     size.height * 0.3878106);
    // path_138.cubicTo(
    //     size.width * 0.2688568,
    //     size.height * 0.3878106,
    //     size.width * 0.2682480,
    //     size.height * 0.3885765,
    //     size.width * 0.2682480,
    //     size.height * 0.3896513);
    // path_138.lineTo(size.width * 0.2682480, size.height * 0.3903185);
    // path_138.lineTo(size.width * 0.2674870, size.height * 0.3903185);
    // path_138.lineTo(size.width * 0.2674870, size.height * 0.3915662);
    // path_138.lineTo(size.width * 0.2682480, size.height * 0.3915662);
    // path_138.lineTo(size.width * 0.2682480, size.height * 0.3967056);
    // path_138.lineTo(size.width * 0.2694555, size.height * 0.3967056);
    // path_138.lineTo(size.width * 0.2694555, size.height * 0.3915662);
    // path_138.lineTo(size.width * 0.2706426, size.height * 0.3915662);
    // path_138.lineTo(size.width * 0.2706426, size.height * 0.3903185);
    // path_138.lineTo(size.width * 0.2694555, size.height * 0.3903185);
    // path_138.lineTo(size.width * 0.2694555, size.height * 0.3897872);
    // path_138.close();
    // path_138.moveTo(size.width * 0.2714047, size.height * 0.3967056);
    // path_138.lineTo(size.width * 0.2765287, size.height * 0.3967056);
    // path_138.lineTo(size.width * 0.2765287, size.height * 0.3952972);
    // path_138.lineTo(size.width * 0.2733732, size.height * 0.3952972);
    // path_138.lineTo(size.width * 0.2748343, size.height * 0.3938641);
    // path_138.cubicTo(
    //     size.width * 0.2760316,
    //     size.height * 0.3927399,
    //     size.width * 0.2764577,
    //     size.height * 0.3918380,
    //     size.width * 0.2764577,
    //     size.height * 0.3907138);
    // path_138.cubicTo(
    //     size.width * 0.2764577,
    //     size.height * 0.3891448,
    //     size.width * 0.2754025,
    //     size.height * 0.3880700,
    //     size.width * 0.2740225,
    //     size.height * 0.3880700);
    // path_138.cubicTo(
    //     size.width * 0.2728963,
    //     size.height * 0.3880700,
    //     size.width * 0.2720541,
    //     size.height * 0.3886754,
    //     size.width * 0.2713946,
    //     size.height * 0.3897255);
    // path_138.lineTo(size.width * 0.2722165, size.height * 0.3906520);
    // path_138.cubicTo(
    //     size.width * 0.2727238,
    //     size.height * 0.3899108,
    //     size.width * 0.2732514,
    //     size.height * 0.3894537,
    //     size.width * 0.2739820,
    //     size.height * 0.3894537);
    // path_138.cubicTo(
    //     size.width * 0.2746110,
    //     size.height * 0.3894537,
    //     size.width * 0.2751691,
    //     size.height * 0.3899478,
    //     size.width * 0.2751691,
    //     size.height * 0.3907509);
    // path_138.cubicTo(
    //     size.width * 0.2751691,
    //     size.height * 0.3914427,
    //     size.width * 0.2748546,
    //     size.height * 0.3920851,
    //     size.width * 0.2739718,
    //     size.height * 0.3929499);
    // path_138.lineTo(size.width * 0.2714047, size.height * 0.3954454);
    // path_138.lineTo(size.width * 0.2714047, size.height * 0.3967056);
    // path_138.close();

    // Paint paint_138_fill = Paint()..style = PaintingStyle.fill;
    // paint_138_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_138, paint_138_fill);

    // Paint paint_139_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_139_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2979143, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_139_stroke);

    // Paint paint_139_fill = Paint()..style = PaintingStyle.fill;
    // paint_139_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.2979143, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_139_fill);

    // Path path_140 = Path();
    // path_140.moveTo(size.width * 0.3151150, size.height * 0.3897872);
    // path_140.cubicTo(
    //     size.width * 0.3151150,
    //     size.height * 0.3893548,
    //     size.width * 0.3153382,
    //     size.height * 0.3890460,
    //     size.width * 0.3156325,
    //     size.height * 0.3890460);
    // path_140.cubicTo(
    //     size.width * 0.3158455,
    //     size.height * 0.3890460,
    //     size.width * 0.3160383,
    //     size.height * 0.3891448,
    //     size.width * 0.3161499,
    //     size.height * 0.3892807);
    // path_140.lineTo(size.width * 0.3165051, size.height * 0.3883171);
    // path_140.cubicTo(
    //     size.width * 0.3162108,
    //     size.height * 0.3880082,
    //     size.width * 0.3157847,
    //     size.height * 0.3878106,
    //     size.width * 0.3153890,
    //     size.height * 0.3878106);
    // path_140.cubicTo(
    //     size.width * 0.3145163,
    //     size.height * 0.3878106,
    //     size.width * 0.3139076,
    //     size.height * 0.3885765,
    //     size.width * 0.3139076,
    //     size.height * 0.3896513);
    // path_140.lineTo(size.width * 0.3139076, size.height * 0.3903185);
    // path_140.lineTo(size.width * 0.3131466, size.height * 0.3903185);
    // path_140.lineTo(size.width * 0.3131466, size.height * 0.3915662);
    // path_140.lineTo(size.width * 0.3139076, size.height * 0.3915662);
    // path_140.lineTo(size.width * 0.3139076, size.height * 0.3967056);
    // path_140.lineTo(size.width * 0.3151150, size.height * 0.3967056);
    // path_140.lineTo(size.width * 0.3151150, size.height * 0.3915662);
    // path_140.lineTo(size.width * 0.3163021, size.height * 0.3915662);
    // path_140.lineTo(size.width * 0.3163021, size.height * 0.3903185);
    // path_140.lineTo(size.width * 0.3151150, size.height * 0.3903185);
    // path_140.lineTo(size.width * 0.3151150, size.height * 0.3897872);
    // path_140.close();
    // path_140.moveTo(size.width * 0.3196313, size.height * 0.3968538);
    // path_140.cubicTo(
    //     size.width * 0.3212041,
    //     size.height * 0.3968538,
    //     size.width * 0.3222289,
    //     size.height * 0.3958161,
    //     size.width * 0.3222289,
    //     size.height * 0.3943583);
    // path_140.cubicTo(
    //     size.width * 0.3222289,
    //     size.height * 0.3932093,
    //     size.width * 0.3214983,
    //     size.height * 0.3925546,
    //     size.width * 0.3207576,
    //     size.height * 0.3923445);
    // path_140.cubicTo(
    //     size.width * 0.3215085,
    //     size.height * 0.3920728,
    //     size.width * 0.3220767,
    //     size.height * 0.3914056,
    //     size.width * 0.3220767,
    //     size.height * 0.3903802);
    // path_140.cubicTo(
    //     size.width * 0.3220767,
    //     size.height * 0.3890336,
    //     size.width * 0.3210924,
    //     size.height * 0.3880700,
    //     size.width * 0.3196110,
    //     size.height * 0.3880700);
    // path_140.cubicTo(
    //     size.width * 0.3184239,
    //     size.height * 0.3880700,
    //     size.width * 0.3176122,
    //     size.height * 0.3887124,
    //     size.width * 0.3170541,
    //     size.height * 0.3895649);
    // path_140.lineTo(size.width * 0.3178050, size.height * 0.3905038);
    // path_140.cubicTo(
    //     size.width * 0.3182818,
    //     size.height * 0.3898614,
    //     size.width * 0.3188095,
    //     size.height * 0.3894537,
    //     size.width * 0.3194994,
    //     size.height * 0.3894537);
    // path_140.cubicTo(
    //     size.width * 0.3202503,
    //     size.height * 0.3894537,
    //     size.width * 0.3207982,
    //     size.height * 0.3899355,
    //     size.width * 0.3207982,
    //     size.height * 0.3906273);
    // path_140.cubicTo(
    //     size.width * 0.3207982,
    //     size.height * 0.3913686,
    //     size.width * 0.3202604,
    //     size.height * 0.3917763,
    //     size.width * 0.3194386,
    //     size.height * 0.3917639);
    // path_140.lineTo(size.width * 0.3186573, size.height * 0.3917639);
    // path_140.lineTo(size.width * 0.3186573, size.height * 0.3930981);
    // path_140.lineTo(size.width * 0.3194386, size.height * 0.3930858);
    // path_140.cubicTo(
    //     size.width * 0.3204228,
    //     size.height * 0.3930858,
    //     size.width * 0.3209402,
    //     size.height * 0.3934811,
    //     size.width * 0.3209402,
    //     size.height * 0.3942347);
    // path_140.cubicTo(
    //     size.width * 0.3209402,
    //     size.height * 0.3949760,
    //     size.width * 0.3204228,
    //     size.height * 0.3954825,
    //     size.width * 0.3195908,
    //     size.height * 0.3954825);
    // path_140.cubicTo(
    //     size.width * 0.3188399,
    //     size.height * 0.3954825,
    //     size.width * 0.3181702,
    //     size.height * 0.3950748,
    //     size.width * 0.3176832,
    //     size.height * 0.3944077);
    // path_140.lineTo(size.width * 0.3169121, size.height * 0.3954207);
    // path_140.cubicTo(
    //     size.width * 0.3174803,
    //     size.height * 0.3962485,
    //     size.width * 0.3184138,
    //     size.height * 0.3968538,
    //     size.width * 0.3196313,
    //     size.height * 0.3968538);
    // path_140.close();

    // Paint paint_140_fill = Paint()..style = PaintingStyle.fill;
    // paint_140_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_140, paint_140_fill);

    // Paint paint_141_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_141_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3385006, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_141_stroke);

    // Paint paint_141_fill = Paint()..style = PaintingStyle.fill;
    // paint_141_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3385006, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_141_fill);

    // Path path_142 = Path();
    // path_142.moveTo(size.width * 0.3557012, size.height * 0.3897872);
    // path_142.cubicTo(
    //     size.width * 0.3557012,
    //     size.height * 0.3893548,
    //     size.width * 0.3559245,
    //     size.height * 0.3890460,
    //     size.width * 0.3562187,
    //     size.height * 0.3890460);
    // path_142.cubicTo(
    //     size.width * 0.3564318,
    //     size.height * 0.3890460,
    //     size.width * 0.3566246,
    //     size.height * 0.3891448,
    //     size.width * 0.3567362,
    //     size.height * 0.3892807);
    // path_142.lineTo(size.width * 0.3570913, size.height * 0.3883171);
    // path_142.cubicTo(
    //     size.width * 0.3567971,
    //     size.height * 0.3880082,
    //     size.width * 0.3563709,
    //     size.height * 0.3878106,
    //     size.width * 0.3559752,
    //     size.height * 0.3878106);
    // path_142.cubicTo(
    //     size.width * 0.3551026,
    //     size.height * 0.3878106,
    //     size.width * 0.3544938,
    //     size.height * 0.3885765,
    //     size.width * 0.3544938,
    //     size.height * 0.3896513);
    // path_142.lineTo(size.width * 0.3544938, size.height * 0.3903185);
    // path_142.lineTo(size.width * 0.3537328, size.height * 0.3903185);
    // path_142.lineTo(size.width * 0.3537328, size.height * 0.3915662);
    // path_142.lineTo(size.width * 0.3544938, size.height * 0.3915662);
    // path_142.lineTo(size.width * 0.3544938, size.height * 0.3967056);
    // path_142.lineTo(size.width * 0.3557012, size.height * 0.3967056);
    // path_142.lineTo(size.width * 0.3557012, size.height * 0.3915662);
    // path_142.lineTo(size.width * 0.3568884, size.height * 0.3915662);
    // path_142.lineTo(size.width * 0.3568884, size.height * 0.3903185);
    // path_142.lineTo(size.width * 0.3557012, size.height * 0.3903185);
    // path_142.lineTo(size.width * 0.3557012, size.height * 0.3897872);
    // path_142.close();
    // path_142.moveTo(size.width * 0.3610598, size.height * 0.3967056);
    // path_142.lineTo(size.width * 0.3623179, size.height * 0.3967056);
    // path_142.lineTo(size.width * 0.3623179, size.height * 0.3948648);
    // path_142.lineTo(size.width * 0.3632818, size.height * 0.3948648);
    // path_142.lineTo(size.width * 0.3632818, size.height * 0.3935429);
    // path_142.lineTo(size.width * 0.3623179, size.height * 0.3935429);
    // path_142.lineTo(size.width * 0.3623179, size.height * 0.3882183);
    // path_142.lineTo(size.width * 0.3608061, size.height * 0.3882183);
    // path_142.lineTo(size.width * 0.3574983, size.height * 0.3936664);
    // path_142.lineTo(size.width * 0.3576201, size.height * 0.3948648);
    // path_142.lineTo(size.width * 0.3610598, size.height * 0.3948648);
    // path_142.lineTo(size.width * 0.3610598, size.height * 0.3967056);
    // path_142.close();
    // path_142.moveTo(size.width * 0.3588478, size.height * 0.3935429);
    // path_142.lineTo(size.width * 0.3610598, size.height * 0.3898984);
    // path_142.lineTo(size.width * 0.3610598, size.height * 0.3935429);
    // path_142.lineTo(size.width * 0.3588478, size.height * 0.3935429);
    // path_142.close();

    // Paint paint_142_fill = Paint()..style = PaintingStyle.fill;
    // paint_142_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_142, paint_142_fill);

    // Paint paint_143_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_143_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3790868, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_143_stroke);

    // Paint paint_143_fill = Paint()..style = PaintingStyle.fill;
    // paint_143_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.3790868, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_143_fill);

    // Path path_144 = Path();
    // path_144.moveTo(size.width * 0.3962875, size.height * 0.3897872);
    // path_144.cubicTo(
    //     size.width * 0.3962875,
    //     size.height * 0.3893548,
    //     size.width * 0.3965107,
    //     size.height * 0.3890460,
    //     size.width * 0.3968050,
    //     size.height * 0.3890460);
    // path_144.cubicTo(
    //     size.width * 0.3970180,
    //     size.height * 0.3890460,
    //     size.width * 0.3972108,
    //     size.height * 0.3891448,
    //     size.width * 0.3973224,
    //     size.height * 0.3892807);
    // path_144.lineTo(size.width * 0.3976776, size.height * 0.3883171);
    // path_144.cubicTo(
    //     size.width * 0.3973833,
    //     size.height * 0.3880082,
    //     size.width * 0.3969572,
    //     size.height * 0.3878106,
    //     size.width * 0.3965614,
    //     size.height * 0.3878106);
    // path_144.cubicTo(
    //     size.width * 0.3956888,
    //     size.height * 0.3878106,
    //     size.width * 0.3950800,
    //     size.height * 0.3885765,
    //     size.width * 0.3950800,
    //     size.height * 0.3896513);
    // path_144.lineTo(size.width * 0.3950800, size.height * 0.3903185);
    // path_144.lineTo(size.width * 0.3943191, size.height * 0.3903185);
    // path_144.lineTo(size.width * 0.3943191, size.height * 0.3915662);
    // path_144.lineTo(size.width * 0.3950800, size.height * 0.3915662);
    // path_144.lineTo(size.width * 0.3950800, size.height * 0.3967056);
    // path_144.lineTo(size.width * 0.3962875, size.height * 0.3967056);
    // path_144.lineTo(size.width * 0.3962875, size.height * 0.3915662);
    // path_144.lineTo(size.width * 0.3974746, size.height * 0.3915662);
    // path_144.lineTo(size.width * 0.3974746, size.height * 0.3903185);
    // path_144.lineTo(size.width * 0.3962875, size.height * 0.3903185);
    // path_144.lineTo(size.width * 0.3962875, size.height * 0.3897872);
    // path_144.close();
    // path_144.moveTo(size.width * 0.4008241, size.height * 0.3968538);
    // path_144.cubicTo(
    //     size.width * 0.4024171,
    //     size.height * 0.3968538,
    //     size.width * 0.4035028,
    //     size.height * 0.3957172,
    //     size.width * 0.4035028,
    //     size.height * 0.3939629);
    // path_144.cubicTo(
    //     size.width * 0.4035028,
    //     size.height * 0.3922581,
    //     size.width * 0.4024374,
    //     size.height * 0.3912944,
    //     size.width * 0.4011995,
    //     size.height * 0.3912944);
    // path_144.cubicTo(
    //     size.width * 0.4006009,
    //     size.height * 0.3912944,
    //     size.width * 0.4001443,
    //     size.height * 0.3915168,
    //     size.width * 0.3997892,
    //     size.height * 0.3918133);
    // path_144.lineTo(size.width * 0.3998501, size.height * 0.3896266);
    // path_144.lineTo(size.width * 0.4031274, size.height * 0.3896266);
    // path_144.lineTo(size.width * 0.4031274, size.height * 0.3882183);
    // path_144.lineTo(size.width * 0.3986629, size.height * 0.3882183);
    // path_144.lineTo(size.width * 0.3985614, size.height * 0.3927275);
    // path_144.lineTo(size.width * 0.3994239, size.height * 0.3931723);
    // path_144.cubicTo(
    //     size.width * 0.3998196,
    //     size.height * 0.3928016,
    //     size.width * 0.4002965,
    //     size.height * 0.3925793,
    //     size.width * 0.4008444,
    //     size.height * 0.3925793);
    // path_144.cubicTo(
    //     size.width * 0.4016764,
    //     size.height * 0.3925793,
    //     size.width * 0.4022345,
    //     size.height * 0.3931599,
    //     size.width * 0.4022345,
    //     size.height * 0.3940247);
    // path_144.cubicTo(
    //     size.width * 0.4022345,
    //     size.height * 0.3948524,
    //     size.width * 0.4016967,
    //     size.height * 0.3955196,
    //     size.width * 0.4008444,
    //     size.height * 0.3955196);
    // path_144.cubicTo(
    //     size.width * 0.4001443,
    //     size.height * 0.3955196,
    //     size.width * 0.3995051,
    //     size.height * 0.3950872,
    //     size.width * 0.3989673,
    //     size.height * 0.3944447);
    // path_144.lineTo(size.width * 0.3982165, size.height * 0.3955443);
    // path_144.cubicTo(
    //     size.width * 0.3988354,
    //     size.height * 0.3963349,
    //     size.width * 0.3996877,
    //     size.height * 0.3968538,
    //     size.width * 0.4008241,
    //     size.height * 0.3968538);
    // path_144.close();

    // Paint paint_144_fill = Paint()..style = PaintingStyle.fill;
    // paint_144_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_144, paint_144_fill);

    // Paint paint_145_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_145_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4208005, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_145_stroke);

    // Paint paint_145_fill = Paint()..style = PaintingStyle.fill;
    // paint_145_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4208005, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_145_fill);

    // Path path_146 = Path();
    // path_146.moveTo(size.width * 0.4380011, size.height * 0.3897872);
    // path_146.cubicTo(
    //     size.width * 0.4380011,
    //     size.height * 0.3893548,
    //     size.width * 0.4382244,
    //     size.height * 0.3890460,
    //     size.width * 0.4385186,
    //     size.height * 0.3890460);
    // path_146.cubicTo(
    //     size.width * 0.4387317,
    //     size.height * 0.3890460,
    //     size.width * 0.4389245,
    //     size.height * 0.3891448,
    //     size.width * 0.4390361,
    //     size.height * 0.3892807);
    // path_146.lineTo(size.width * 0.4393912, size.height * 0.3883171);
    // path_146.cubicTo(
    //     size.width * 0.4390970,
    //     size.height * 0.3880082,
    //     size.width * 0.4386708,
    //     size.height * 0.3878106,
    //     size.width * 0.4382751,
    //     size.height * 0.3878106);
    // path_146.cubicTo(
    //     size.width * 0.4374025,
    //     size.height * 0.3878106,
    //     size.width * 0.4367937,
    //     size.height * 0.3885765,
    //     size.width * 0.4367937,
    //     size.height * 0.3896513);
    // path_146.lineTo(size.width * 0.4367937, size.height * 0.3903185);
    // path_146.lineTo(size.width * 0.4360327, size.height * 0.3903185);
    // path_146.lineTo(size.width * 0.4360327, size.height * 0.3915662);
    // path_146.lineTo(size.width * 0.4367937, size.height * 0.3915662);
    // path_146.lineTo(size.width * 0.4367937, size.height * 0.3967056);
    // path_146.lineTo(size.width * 0.4380011, size.height * 0.3967056);
    // path_146.lineTo(size.width * 0.4380011, size.height * 0.3915662);
    // path_146.lineTo(size.width * 0.4391883, size.height * 0.3915662);
    // path_146.lineTo(size.width * 0.4391883, size.height * 0.3903185);
    // path_146.lineTo(size.width * 0.4380011, size.height * 0.3903185);
    // path_146.lineTo(size.width * 0.4380011, size.height * 0.3897872);
    // path_146.close();
    // path_146.moveTo(size.width * 0.4430958, size.height * 0.3912821);
    // path_146.cubicTo(
    //     size.width * 0.4423856,
    //     size.height * 0.3912821,
    //     size.width * 0.4417159,
    //     size.height * 0.3916404,
    //     size.width * 0.4412897,
    //     size.height * 0.3922457);
    // path_146.cubicTo(
    //     size.width * 0.4413709,
    //     size.height * 0.3905779,
    //     size.width * 0.4420710,
    //     size.height * 0.3894290,
    //     size.width * 0.4430552,
    //     size.height * 0.3894290);
    // path_146.cubicTo(
    //     size.width * 0.4436742,
    //     size.height * 0.3894290,
    //     size.width * 0.4441003,
    //     size.height * 0.3897378,
    //     size.width * 0.4445265,
    //     size.height * 0.3901949);
    // path_146.lineTo(size.width * 0.4451454, size.height * 0.3890213);
    // path_146.cubicTo(
    //     size.width * 0.4445874,
    //     size.height * 0.3884406,
    //     size.width * 0.4439278,
    //     size.height * 0.3880700,
    //     size.width * 0.4430654,
    //     size.height * 0.3880700);
    // path_146.cubicTo(
    //     size.width * 0.4412492,
    //     size.height * 0.3880700,
    //     size.width * 0.4399808,
    //     size.height * 0.3899849,
    //     size.width * 0.4399808,
    //     size.height * 0.3926040);
    // path_146.cubicTo(
    //     size.width * 0.4399808,
    //     size.height * 0.3950501,
    //     size.width * 0.4408636,
    //     size.height * 0.3968538,
    //     size.width * 0.4428422,
    //     size.height * 0.3968538);
    // path_146.cubicTo(
    //     size.width * 0.4443439,
    //     size.height * 0.3968538,
    //     size.width * 0.4454397,
    //     size.height * 0.3956431,
    //     size.width * 0.4454397,
    //     size.height * 0.3939629);
    // path_146.cubicTo(
    //     size.width * 0.4454397,
    //     size.height * 0.3922704,
    //     size.width * 0.4443743,
    //     size.height * 0.3912821,
    //     size.width * 0.4430958,
    //     size.height * 0.3912821);
    // path_146.close();
    // path_146.moveTo(size.width * 0.4427813, size.height * 0.3955443);
    // path_146.cubicTo(
    //     size.width * 0.4419391,
    //     size.height * 0.3955443,
    //     size.width * 0.4415028,
    //     size.height * 0.3948401,
    //     size.width * 0.4413506,
    //     size.height * 0.3937159);
    // path_146.cubicTo(
    //     size.width * 0.4415536,
    //     size.height * 0.3929993,
    //     size.width * 0.4420913,
    //     size.height * 0.3925422,
    //     size.width * 0.4427610,
    //     size.height * 0.3925422);
    // path_146.cubicTo(
    //     size.width * 0.4435220,
    //     size.height * 0.3925422,
    //     size.width * 0.4441511,
    //     size.height * 0.3930981,
    //     size.width * 0.4441511,
    //     size.height * 0.3940247);
    // path_146.cubicTo(
    //     size.width * 0.4441511,
    //     size.height * 0.3948030,
    //     size.width * 0.4436336,
    //     size.height * 0.3955443,
    //     size.width * 0.4427813,
    //     size.height * 0.3955443);
    // path_146.close();

    // Paint paint_146_fill = Paint()..style = PaintingStyle.fill;
    // paint_146_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_146, paint_146_fill);

    // Paint paint_147_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_147_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4613867, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_147_stroke);

    // Paint paint_147_fill = Paint()..style = PaintingStyle.fill;
    // paint_147_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.4613867, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_147_fill);

    // Path path_148 = Path();
    // path_148.moveTo(size.width * 0.4785874, size.height * 0.3897872);
    // path_148.cubicTo(
    //     size.width * 0.4785874,
    //     size.height * 0.3893548,
    //     size.width * 0.4788106,
    //     size.height * 0.3890460,
    //     size.width * 0.4791048,
    //     size.height * 0.3890460);
    // path_148.cubicTo(
    //     size.width * 0.4793179,
    //     size.height * 0.3890460,
    //     size.width * 0.4795107,
    //     size.height * 0.3891448,
    //     size.width * 0.4796223,
    //     size.height * 0.3892807);
    // path_148.lineTo(size.width * 0.4799775, size.height * 0.3883171);
    // path_148.cubicTo(
    //     size.width * 0.4796832,
    //     size.height * 0.3880082,
    //     size.width * 0.4792570,
    //     size.height * 0.3878106,
    //     size.width * 0.4788613,
    //     size.height * 0.3878106);
    // path_148.cubicTo(
    //     size.width * 0.4779887,
    //     size.height * 0.3878106,
    //     size.width * 0.4773799,
    //     size.height * 0.3885765,
    //     size.width * 0.4773799,
    //     size.height * 0.3896513);
    // path_148.lineTo(size.width * 0.4773799, size.height * 0.3903185);
    // path_148.lineTo(size.width * 0.4766189, size.height * 0.3903185);
    // path_148.lineTo(size.width * 0.4766189, size.height * 0.3915662);
    // path_148.lineTo(size.width * 0.4773799, size.height * 0.3915662);
    // path_148.lineTo(size.width * 0.4773799, size.height * 0.3967056);
    // path_148.lineTo(size.width * 0.4785874, size.height * 0.3967056);
    // path_148.lineTo(size.width * 0.4785874, size.height * 0.3915662);
    // path_148.lineTo(size.width * 0.4797745, size.height * 0.3915662);
    // path_148.lineTo(size.width * 0.4797745, size.height * 0.3903185);
    // path_148.lineTo(size.width * 0.4785874, size.height * 0.3903185);
    // path_148.lineTo(size.width * 0.4785874, size.height * 0.3897872);
    // path_148.close();
    // path_148.moveTo(size.width * 0.4813179, size.height * 0.3967056);
    // path_148.lineTo(size.width * 0.4827486, size.height * 0.3967056);
    // path_148.lineTo(size.width * 0.4856302, size.height * 0.3893795);
    // path_148.lineTo(size.width * 0.4856302, size.height * 0.3882183);
    // path_148.lineTo(size.width * 0.4805975, size.height * 0.3882183);
    // path_148.lineTo(size.width * 0.4805975, size.height * 0.3896266);
    // path_148.lineTo(size.width * 0.4841590, size.height * 0.3896266);
    // path_148.lineTo(size.width * 0.4813179, size.height * 0.3967056);
    // path_148.close();

    // Paint paint_148_fill = Paint()..style = PaintingStyle.fill;
    // paint_148_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_148, paint_148_fill);

    // Paint paint_149_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_149_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5019729, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_149_stroke);

    // Paint paint_149_fill = Paint()..style = PaintingStyle.fill;
    // paint_149_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5019729, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_149_fill);

    // Path path_150 = Path();
    // path_150.moveTo(size.width * 0.5191736, size.height * 0.3897872);
    // path_150.cubicTo(
    //     size.width * 0.5191736,
    //     size.height * 0.3893548,
    //     size.width * 0.5193968,
    //     size.height * 0.3890460,
    //     size.width * 0.5196911,
    //     size.height * 0.3890460);
    // path_150.cubicTo(
    //     size.width * 0.5199042,
    //     size.height * 0.3890460,
    //     size.width * 0.5200970,
    //     size.height * 0.3891448,
    //     size.width * 0.5202086,
    //     size.height * 0.3892807);
    // path_150.lineTo(size.width * 0.5205637, size.height * 0.3883171);
    // path_150.cubicTo(
    //     size.width * 0.5202694,
    //     size.height * 0.3880082,
    //     size.width * 0.5198433,
    //     size.height * 0.3878106,
    //     size.width * 0.5194476,
    //     size.height * 0.3878106);
    // path_150.cubicTo(
    //     size.width * 0.5185750,
    //     size.height * 0.3878106,
    //     size.width * 0.5179662,
    //     size.height * 0.3885765,
    //     size.width * 0.5179662,
    //     size.height * 0.3896513);
    // path_150.lineTo(size.width * 0.5179662, size.height * 0.3903185);
    // path_150.lineTo(size.width * 0.5172052, size.height * 0.3903185);
    // path_150.lineTo(size.width * 0.5172052, size.height * 0.3915662);
    // path_150.lineTo(size.width * 0.5179662, size.height * 0.3915662);
    // path_150.lineTo(size.width * 0.5179662, size.height * 0.3967056);
    // path_150.lineTo(size.width * 0.5191736, size.height * 0.3967056);
    // path_150.lineTo(size.width * 0.5191736, size.height * 0.3915662);
    // path_150.lineTo(size.width * 0.5203608, size.height * 0.3915662);
    // path_150.lineTo(size.width * 0.5203608, size.height * 0.3903185);
    // path_150.lineTo(size.width * 0.5191736, size.height * 0.3903185);
    // path_150.lineTo(size.width * 0.5191736, size.height * 0.3897872);
    // path_150.close();
    // path_150.moveTo(size.width * 0.5238016, size.height * 0.3968538);
    // path_150.cubicTo(
    //     size.width * 0.5253033,
    //     size.height * 0.3968538,
    //     size.width * 0.5265209,
    //     size.height * 0.3959643,
    //     size.width * 0.5265209,
    //     size.height * 0.3944447);
    // path_150.cubicTo(
    //     size.width * 0.5265209,
    //     size.height * 0.3934441,
    //     size.width * 0.5259222,
    //     size.height * 0.3927028,
    //     size.width * 0.5251003,
    //     size.height * 0.3923198);
    // path_150.cubicTo(
    //     size.width * 0.5258005,
    //     size.height * 0.3919739,
    //     size.width * 0.5263382,
    //     size.height * 0.3913439,
    //     size.width * 0.5263382,
    //     size.height * 0.3903555);
    // path_150.cubicTo(
    //     size.width * 0.5263382,
    //     size.height * 0.3889224,
    //     size.width * 0.5251511,
    //     size.height * 0.3880700,
    //     size.width * 0.5238016,
    //     size.height * 0.3880700);
    // path_150.cubicTo(
    //     size.width * 0.5224927,
    //     size.height * 0.3880700,
    //     size.width * 0.5212751,
    //     size.height * 0.3888977,
    //     size.width * 0.5212751,
    //     size.height * 0.3903555);
    // path_150.cubicTo(
    //     size.width * 0.5212751,
    //     size.height * 0.3913191,
    //     size.width * 0.5217926,
    //     size.height * 0.3919492,
    //     size.width * 0.5225130,
    //     size.height * 0.3923198);
    // path_150.cubicTo(
    //     size.width * 0.5217012,
    //     size.height * 0.3926781,
    //     size.width * 0.5210924,
    //     size.height * 0.3934194,
    //     size.width * 0.5210924,
    //     size.height * 0.3944447);
    // path_150.cubicTo(
    //     size.width * 0.5210924,
    //     size.height * 0.3959520,
    //     size.width * 0.5222897,
    //     size.height * 0.3968538,
    //     size.width * 0.5238016,
    //     size.height * 0.3968538);
    // path_150.close();
    // path_150.moveTo(size.width * 0.5238016, size.height * 0.3917639);
    // path_150.cubicTo(
    //     size.width * 0.5232232,
    //     size.height * 0.3917268,
    //     size.width * 0.5225231,
    //     size.height * 0.3913068,
    //     size.width * 0.5225231,
    //     size.height * 0.3905532);
    // path_150.cubicTo(
    //     size.width * 0.5225231,
    //     size.height * 0.3898861,
    //     size.width * 0.5230710,
    //     size.height * 0.3893795,
    //     size.width * 0.5238016,
    //     size.height * 0.3893795);
    // path_150.cubicTo(
    //     size.width * 0.5245321,
    //     size.height * 0.3893795,
    //     size.width * 0.5250902,
    //     size.height * 0.3898861,
    //     size.width * 0.5250902,
    //     size.height * 0.3905532);
    // path_150.cubicTo(
    //     size.width * 0.5250902,
    //     size.height * 0.3912944,
    //     size.width * 0.5244002,
    //     size.height * 0.3917268,
    //     size.width * 0.5238016,
    //     size.height * 0.3917639);
    // path_150.close();
    // path_150.moveTo(size.width * 0.5238016, size.height * 0.3955319);
    // path_150.cubicTo(
    //     size.width * 0.5229797,
    //     size.height * 0.3955319,
    //     size.width * 0.5223608,
    //     size.height * 0.3950377,
    //     size.width * 0.5223608,
    //     size.height * 0.3942965);
    // path_150.cubicTo(
    //     size.width * 0.5223608,
    //     size.height * 0.3935058,
    //     size.width * 0.5231623,
    //     size.height * 0.3930364,
    //     size.width * 0.5238016,
    //     size.height * 0.3929993);
    // path_150.cubicTo(
    //     size.width * 0.5244510,
    //     size.height * 0.3930364,
    //     size.width * 0.5252424,
    //     size.height * 0.3935058,
    //     size.width * 0.5252424,
    //     size.height * 0.3942965);
    // path_150.cubicTo(
    //     size.width * 0.5252424,
    //     size.height * 0.3950377,
    //     size.width * 0.5246133,
    //     size.height * 0.3955319,
    //     size.width * 0.5238016,
    //     size.height * 0.3955319);
    // path_150.close();

    // Paint paint_150_fill = Paint()..style = PaintingStyle.fill;
    // paint_150_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_150, paint_150_fill);

    // Paint paint_151_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_151_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5431229, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_151_stroke);

    // Paint paint_151_fill = Paint()..style = PaintingStyle.fill;
    // paint_151_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5431229, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_151_fill);

    // Path path_152 = Path();
    // path_152.moveTo(size.width * 0.5603236, size.height * 0.3897872);
    // path_152.cubicTo(
    //     size.width * 0.5603236,
    //     size.height * 0.3893548,
    //     size.width * 0.5605468,
    //     size.height * 0.3890460,
    //     size.width * 0.5608410,
    //     size.height * 0.3890460);
    // path_152.cubicTo(
    //     size.width * 0.5610541,
    //     size.height * 0.3890460,
    //     size.width * 0.5612469,
    //     size.height * 0.3891448,
    //     size.width * 0.5613585,
    //     size.height * 0.3892807);
    // path_152.lineTo(size.width * 0.5617136, size.height * 0.3883171);
    // path_152.cubicTo(
    //     size.width * 0.5614194,
    //     size.height * 0.3880082,
    //     size.width * 0.5609932,
    //     size.height * 0.3878106,
    //     size.width * 0.5605975,
    //     size.height * 0.3878106);
    // path_152.cubicTo(
    //     size.width * 0.5597249,
    //     size.height * 0.3878106,
    //     size.width * 0.5591161,
    //     size.height * 0.3885765,
    //     size.width * 0.5591161,
    //     size.height * 0.3896513);
    // path_152.lineTo(size.width * 0.5591161, size.height * 0.3903185);
    // path_152.lineTo(size.width * 0.5583551, size.height * 0.3903185);
    // path_152.lineTo(size.width * 0.5583551, size.height * 0.3915662);
    // path_152.lineTo(size.width * 0.5591161, size.height * 0.3915662);
    // path_152.lineTo(size.width * 0.5591161, size.height * 0.3967056);
    // path_152.lineTo(size.width * 0.5603236, size.height * 0.3967056);
    // path_152.lineTo(size.width * 0.5603236, size.height * 0.3915662);
    // path_152.lineTo(size.width * 0.5615107, size.height * 0.3915662);
    // path_152.lineTo(size.width * 0.5615107, size.height * 0.3903185);
    // path_152.lineTo(size.width * 0.5603236, size.height * 0.3903185);
    // path_152.lineTo(size.width * 0.5603236, size.height * 0.3897872);
    // path_152.close();
    // path_152.moveTo(size.width * 0.5649211, size.height * 0.3880700);
    // path_152.cubicTo(
    //     size.width * 0.5634194,
    //     size.height * 0.3880700,
    //     size.width * 0.5623236,
    //     size.height * 0.3892807,
    //     size.width * 0.5623236,
    //     size.height * 0.3909609);
    // path_152.cubicTo(
    //     size.width * 0.5623236,
    //     size.height * 0.3926534,
    //     size.width * 0.5633890,
    //     size.height * 0.3936417,
    //     size.width * 0.5646674,
    //     size.height * 0.3936417);
    // path_152.cubicTo(
    //     size.width * 0.5653777,
    //     size.height * 0.3936417,
    //     size.width * 0.5660485,
    //     size.height * 0.3932835,
    //     size.width * 0.5664713,
    //     size.height * 0.3926781);
    // path_152.cubicTo(
    //     size.width * 0.5663923,
    //     size.height * 0.3943459,
    //     size.width * 0.5656933,
    //     size.height * 0.3954949,
    //     size.width * 0.5647069,
    //     size.height * 0.3954949);
    // path_152.cubicTo(
    //     size.width * 0.5640868,
    //     size.height * 0.3954949,
    //     size.width * 0.5636629,
    //     size.height * 0.3951860,
    //     size.width * 0.5632368,
    //     size.height * 0.3947289);
    // path_152.lineTo(size.width * 0.5626178, size.height * 0.3959025);
    // path_152.cubicTo(
    //     size.width * 0.5631759,
    //     size.height * 0.3964832,
    //     size.width * 0.5638331,
    //     size.height * 0.3968538,
    //     size.width * 0.5646956,
    //     size.height * 0.3968538);
    // path_152.cubicTo(
    //     size.width * 0.5665163,
    //     size.height * 0.3968538,
    //     size.width * 0.5677847,
    //     size.height * 0.3949389,
    //     size.width * 0.5677847,
    //     size.height * 0.3923198);
    // path_152.cubicTo(
    //     size.width * 0.5677847,
    //     size.height * 0.3898737,
    //     size.width * 0.5668997,
    //     size.height * 0.3880700,
    //     size.width * 0.5649211,
    //     size.height * 0.3880700);
    // path_152.close();
    // path_152.moveTo(size.width * 0.5650000, size.height * 0.3923816);
    // path_152.cubicTo(
    //     size.width * 0.5642390,
    //     size.height * 0.3923816,
    //     size.width * 0.5636122,
    //     size.height * 0.3918257,
    //     size.width * 0.5636122,
    //     size.height * 0.3908991);
    // path_152.cubicTo(
    //     size.width * 0.5636122,
    //     size.height * 0.3901208,
    //     size.width * 0.5641319,
    //     size.height * 0.3893795,
    //     size.width * 0.5649831,
    //     size.height * 0.3893795);
    // path_152.cubicTo(
    //     size.width * 0.5658230,
    //     size.height * 0.3893795,
    //     size.width * 0.5662627,
    //     size.height * 0.3900837,
    //     size.width * 0.5664149,
    //     size.height * 0.3912080);
    // path_152.cubicTo(
    //     size.width * 0.5662120,
    //     size.height * 0.3919245,
    //     size.width * 0.5656708,
    //     size.height * 0.3923816,
    //     size.width * 0.5650000,
    //     size.height * 0.3923816);
    // path_152.close();

    // Paint paint_152_fill = Paint()..style = PaintingStyle.fill;
    // paint_152_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_152, paint_152_fill);

    // Paint paint_153_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_153_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5837091, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_153_stroke);

    // Paint paint_153_fill = Paint()..style = PaintingStyle.fill;
    // paint_153_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.5837091, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_153_fill);

    // Path path_154 = Path();
    // path_154.moveTo(size.width * 0.5975254, size.height * 0.3897872);
    // path_154.cubicTo(
    //     size.width * 0.5975254,
    //     size.height * 0.3893548,
    //     size.width * 0.5977508,
    //     size.height * 0.3890460,
    //     size.width * 0.5980440,
    //     size.height * 0.3890460);
    // path_154.cubicTo(
    //     size.width * 0.5982582,
    //     size.height * 0.3890460,
    //     size.width * 0.5984498,
    //     size.height * 0.3891448,
    //     size.width * 0.5985626,
    //     size.height * 0.3892807);
    // path_154.lineTo(size.width * 0.5989177, size.height * 0.3883171);
    // path_154.cubicTo(
    //     size.width * 0.5986246,
    //     size.height * 0.3880082,
    //     size.width * 0.5981962,
    //     size.height * 0.3878106,
    //     size.width * 0.5978016,
    //     size.height * 0.3878106);
    // path_154.cubicTo(
    //     size.width * 0.5969278,
    //     size.height * 0.3878106,
    //     size.width * 0.5963191,
    //     size.height * 0.3885765,
    //     size.width * 0.5963191,
    //     size.height * 0.3896513);
    // path_154.lineTo(size.width * 0.5963191, size.height * 0.3903185);
    // path_154.lineTo(size.width * 0.5955581, size.height * 0.3903185);
    // path_154.lineTo(size.width * 0.5955581, size.height * 0.3915662);
    // path_154.lineTo(size.width * 0.5963191, size.height * 0.3915662);
    // path_154.lineTo(size.width * 0.5963191, size.height * 0.3967056);
    // path_154.lineTo(size.width * 0.5975254, size.height * 0.3967056);
    // path_154.lineTo(size.width * 0.5975254, size.height * 0.3915662);
    // path_154.lineTo(size.width * 0.5987148, size.height * 0.3915662);
    // path_154.lineTo(size.width * 0.5987148, size.height * 0.3903185);
    // path_154.lineTo(size.width * 0.5975254, size.height * 0.3903185);
    // path_154.lineTo(size.width * 0.5975254, size.height * 0.3897872);
    // path_154.close();
    // path_154.moveTo(size.width * 0.6009188, size.height * 0.3967056);
    // path_154.lineTo(size.width * 0.6021759, size.height * 0.3967056);
    // path_154.lineTo(size.width * 0.6021759, size.height * 0.3882183);
    // path_154.lineTo(size.width * 0.6011612, size.height * 0.3882183);
    // path_154.lineTo(size.width * 0.5992052, size.height * 0.3898367);
    // path_154.lineTo(size.width * 0.5997182, size.height * 0.3909238);
    // path_154.lineTo(size.width * 0.6009188, size.height * 0.3899973);
    // path_154.lineTo(size.width * 0.6009188, size.height * 0.3967056);
    // path_154.close();
    // path_154.moveTo(size.width * 0.6065727, size.height * 0.3968538);
    // path_154.cubicTo(
    //     size.width * 0.6083596,
    //     size.height * 0.3968538,
    //     size.width * 0.6096167,
    //     size.height * 0.3950377,
    //     size.width * 0.6096167,
    //     size.height * 0.3924557);
    // path_154.cubicTo(
    //     size.width * 0.6096167,
    //     size.height * 0.3898861,
    //     size.width * 0.6083596,
    //     size.height * 0.3880700,
    //     size.width * 0.6065727,
    //     size.height * 0.3880700);
    // path_154.cubicTo(
    //     size.width * 0.6047802,
    //     size.height * 0.3880700,
    //     size.width * 0.6035118,
    //     size.height * 0.3898861,
    //     size.width * 0.6035118,
    //     size.height * 0.3924557);
    // path_154.cubicTo(
    //     size.width * 0.6035118,
    //     size.height * 0.3950377,
    //     size.width * 0.6047802,
    //     size.height * 0.3968538,
    //     size.width * 0.6065727,
    //     size.height * 0.3968538);
    // path_154.close();
    // path_154.moveTo(size.width * 0.6065727, size.height * 0.3954454);
    // path_154.cubicTo(
    //     size.width * 0.6055411,
    //     size.height * 0.3954454,
    //     size.width * 0.6048083,
    //     size.height * 0.3942100,
    //     size.width * 0.6048083,
    //     size.height * 0.3924557);
    // path_154.cubicTo(
    //     size.width * 0.6048083,
    //     size.height * 0.3907014,
    //     size.width * 0.6055411,
    //     size.height * 0.3894784,
    //     size.width * 0.6065727,
    //     size.height * 0.3894784);
    // path_154.cubicTo(
    //     size.width * 0.6075986,
    //     size.height * 0.3894784,
    //     size.width * 0.6083315,
    //     size.height * 0.3907014,
    //     size.width * 0.6083315,
    //     size.height * 0.3924557);
    // path_154.cubicTo(
    //     size.width * 0.6083315,
    //     size.height * 0.3942100,
    //     size.width * 0.6075986,
    //     size.height * 0.3954454,
    //     size.width * 0.6065727,
    //     size.height * 0.3954454);
    // path_154.close();

    // Paint paint_154_fill = Paint()..style = PaintingStyle.fill;
    // paint_154_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_154, paint_154_fill);

    // Paint paint_155_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_155_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6248591, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_155_stroke);

    // Paint paint_155_fill = Paint()..style = PaintingStyle.fill;
    // paint_155_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6248591, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_155_fill);

    // Path path_156 = Path();
    // path_156.moveTo(size.width * 0.6403664, size.height * 0.3897872);
    // path_156.cubicTo(
    //     size.width * 0.6403664,
    //     size.height * 0.3893548,
    //     size.width * 0.6405919,
    //     size.height * 0.3890460,
    //     size.width * 0.6408850,
    //     size.height * 0.3890460);
    // path_156.cubicTo(
    //     size.width * 0.6410992,
    //     size.height * 0.3890460,
    //     size.width * 0.6412909,
    //     size.height * 0.3891448,
    //     size.width * 0.6414036,
    //     size.height * 0.3892807);
    // path_156.lineTo(size.width * 0.6417587, size.height * 0.3883171);
    // path_156.cubicTo(
    //     size.width * 0.6414656,
    //     size.height * 0.3880082,
    //     size.width * 0.6410372,
    //     size.height * 0.3878106,
    //     size.width * 0.6406426,
    //     size.height * 0.3878106);
    // path_156.cubicTo(
    //     size.width * 0.6397689,
    //     size.height * 0.3878106,
    //     size.width * 0.6391601,
    //     size.height * 0.3885765,
    //     size.width * 0.6391601,
    //     size.height * 0.3896513);
    // path_156.lineTo(size.width * 0.6391601, size.height * 0.3903185);
    // path_156.lineTo(size.width * 0.6383991, size.height * 0.3903185);
    // path_156.lineTo(size.width * 0.6383991, size.height * 0.3915662);
    // path_156.lineTo(size.width * 0.6391601, size.height * 0.3915662);
    // path_156.lineTo(size.width * 0.6391601, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6403664, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6403664, size.height * 0.3915662);
    // path_156.lineTo(size.width * 0.6415558, size.height * 0.3915662);
    // path_156.lineTo(size.width * 0.6415558, size.height * 0.3903185);
    // path_156.lineTo(size.width * 0.6403664, size.height * 0.3903185);
    // path_156.lineTo(size.width * 0.6403664, size.height * 0.3897872);
    // path_156.close();
    // path_156.moveTo(size.width * 0.6437599, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6450169, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6450169, size.height * 0.3882183);
    // path_156.lineTo(size.width * 0.6440023, size.height * 0.3882183);
    // path_156.lineTo(size.width * 0.6420462, size.height * 0.3898367);
    // path_156.lineTo(size.width * 0.6425592, size.height * 0.3909238);
    // path_156.lineTo(size.width * 0.6437599, size.height * 0.3899973);
    // path_156.lineTo(size.width * 0.6437599, size.height * 0.3967056);
    // path_156.close();
    // path_156.moveTo(size.width * 0.6477508, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6490079, size.height * 0.3967056);
    // path_156.lineTo(size.width * 0.6490079, size.height * 0.3882183);
    // path_156.lineTo(size.width * 0.6479932, size.height * 0.3882183);
    // path_156.lineTo(size.width * 0.6460372, size.height * 0.3898367);
    // path_156.lineTo(size.width * 0.6465558, size.height * 0.3909238);
    // path_156.lineTo(size.width * 0.6477508, size.height * 0.3899973);
    // path_156.lineTo(size.width * 0.6477508, size.height * 0.3967056);
    // path_156.close();

    // Paint paint_156_fill = Paint()..style = PaintingStyle.fill;
    // paint_156_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_156, paint_156_fill);

    // Paint paint_157_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_157_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6654453, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_157_stroke);

    // Paint paint_157_fill = Paint()..style = PaintingStyle.fill;
    // paint_157_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.6654453, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_157_fill);

    // Path path_158 = Path();
    // path_158.moveTo(size.width * 0.6798253, size.height * 0.3897872);
    // path_158.cubicTo(
    //     size.width * 0.6798253,
    //     size.height * 0.3893548,
    //     size.width * 0.6800507,
    //     size.height * 0.3890460,
    //     size.width * 0.6803439,
    //     size.height * 0.3890460);
    // path_158.cubicTo(
    //     size.width * 0.6805581,
    //     size.height * 0.3890460,
    //     size.width * 0.6807497,
    //     size.height * 0.3891448,
    //     size.width * 0.6808625,
    //     size.height * 0.3892807);
    // path_158.lineTo(size.width * 0.6812176, size.height * 0.3883171);
    // path_158.cubicTo(
    //     size.width * 0.6809245,
    //     size.height * 0.3880082,
    //     size.width * 0.6804961,
    //     size.height * 0.3878106,
    //     size.width * 0.6801015,
    //     size.height * 0.3878106);
    // path_158.cubicTo(
    //     size.width * 0.6792277,
    //     size.height * 0.3878106,
    //     size.width * 0.6786189,
    //     size.height * 0.3885765,
    //     size.width * 0.6786189,
    //     size.height * 0.3896513);
    // path_158.lineTo(size.width * 0.6786189, size.height * 0.3903185);
    // path_158.lineTo(size.width * 0.6778579, size.height * 0.3903185);
    // path_158.lineTo(size.width * 0.6778579, size.height * 0.3915662);
    // path_158.lineTo(size.width * 0.6786189, size.height * 0.3915662);
    // path_158.lineTo(size.width * 0.6786189, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6798253, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6798253, size.height * 0.3915662);
    // path_158.lineTo(size.width * 0.6810147, size.height * 0.3915662);
    // path_158.lineTo(size.width * 0.6810147, size.height * 0.3903185);
    // path_158.lineTo(size.width * 0.6798253, size.height * 0.3903185);
    // path_158.lineTo(size.width * 0.6798253, size.height * 0.3897872);
    // path_158.close();
    // path_158.moveTo(size.width * 0.6832187, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6844758, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6844758, size.height * 0.3882183);
    // path_158.lineTo(size.width * 0.6834611, size.height * 0.3882183);
    // path_158.lineTo(size.width * 0.6815051, size.height * 0.3898367);
    // path_158.lineTo(size.width * 0.6820180, size.height * 0.3909238);
    // path_158.lineTo(size.width * 0.6832187, size.height * 0.3899973);
    // path_158.lineTo(size.width * 0.6832187, size.height * 0.3967056);
    // path_158.close();
    // path_158.moveTo(size.width * 0.6857723, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6908963, size.height * 0.3967056);
    // path_158.lineTo(size.width * 0.6908963, size.height * 0.3952972);
    // path_158.lineTo(size.width * 0.6877396, size.height * 0.3952972);
    // path_158.lineTo(size.width * 0.6891995, size.height * 0.3938641);
    // path_158.cubicTo(
    //     size.width * 0.6903946,
    //     size.height * 0.3927399,
    //     size.width * 0.6908230,
    //     size.height * 0.3918380,
    //     size.width * 0.6908230,
    //     size.height * 0.3907138);
    // path_158.cubicTo(
    //     size.width * 0.6908230,
    //     size.height * 0.3891448,
    //     size.width * 0.6897689,
    //     size.height * 0.3880700,
    //     size.width * 0.6883878,
    //     size.height * 0.3880700);
    // path_158.cubicTo(
    //     size.width * 0.6872604,
    //     size.height * 0.3880700,
    //     size.width * 0.6864205,
    //     size.height * 0.3886754,
    //     size.width * 0.6857610,
    //     size.height * 0.3897255);
    // path_158.lineTo(size.width * 0.6865840, size.height * 0.3906520);
    // path_158.cubicTo(
    //     size.width * 0.6870913,
    //     size.height * 0.3899108,
    //     size.width * 0.6876156,
    //     size.height * 0.3894537,
    //     size.width * 0.6883484,
    //     size.height * 0.3894537);
    // path_158.cubicTo(
    //     size.width * 0.6889741,
    //     size.height * 0.3894537,
    //     size.width * 0.6895321,
    //     size.height * 0.3899478,
    //     size.width * 0.6895321,
    //     size.height * 0.3907509);
    // path_158.cubicTo(
    //     size.width * 0.6895321,
    //     size.height * 0.3914427,
    //     size.width * 0.6892221,
    //     size.height * 0.3920851,
    //     size.width * 0.6883371,
    //     size.height * 0.3929499);
    // path_158.lineTo(size.width * 0.6857723, size.height * 0.3954454);
    // path_158.lineTo(size.width * 0.6857723, size.height * 0.3967056);
    // path_158.close();

    // Paint paint_158_fill = Paint()..style = PaintingStyle.fill;
    // paint_158_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_158, paint_158_fill);

    // Paint paint_159_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_159_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7060316, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_159_stroke);

    // Paint paint_159_fill = Paint()..style = PaintingStyle.fill;
    // paint_159_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7060316, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_159_fill);

    // Path path_160 = Path();
    // path_160.moveTo(size.width * 0.7179763, size.height * 0.3968538);
    // path_160.cubicTo(
    //     size.width * 0.7188050,
    //     size.height * 0.3968538,
    //     size.width * 0.7195096,
    //     size.height * 0.3964338,
    //     size.width * 0.7200169,
    //     size.height * 0.3957790);
    // path_160.lineTo(size.width * 0.7191826, size.height * 0.3949019);
    // path_160.cubicTo(
    //     size.width * 0.7188895,
    //     size.height * 0.3953095,
    //     size.width * 0.7184442,
    //     size.height * 0.3955690,
    //     size.width * 0.7179876,
    //     size.height * 0.3955690);
    // path_160.cubicTo(
    //     size.width * 0.7171251,
    //     size.height * 0.3955690,
    //     size.width * 0.7164036,
    //     size.height * 0.3946301,
    //     size.width * 0.7164036,
    //     size.height * 0.3935058);
    // path_160.cubicTo(
    //     size.width * 0.7164036,
    //     size.height * 0.3923940,
    //     size.width * 0.7171251,
    //     size.height * 0.3914550,
    //     size.width * 0.7179876,
    //     size.height * 0.3914550);
    // path_160.cubicTo(
    //     size.width * 0.7184329,
    //     size.height * 0.3914550,
    //     size.width * 0.7188670,
    //     size.height * 0.3917145,
    //     size.width * 0.7191545,
    //     size.height * 0.3920975);
    // path_160.lineTo(size.width * 0.7199831, size.height * 0.3912080);
    // path_160.cubicTo(
    //     size.width * 0.7194870,
    //     size.height * 0.3905779,
    //     size.width * 0.7187880,
    //     size.height * 0.3901702,
    //     size.width * 0.7179932,
    //     size.height * 0.3901702);
    // path_160.cubicTo(
    //     size.width * 0.7164656,
    //     size.height * 0.3901702,
    //     size.width * 0.7151747,
    //     size.height * 0.3916898,
    //     size.width * 0.7151747,
    //     size.height * 0.3935058);
    // path_160.cubicTo(
    //     size.width * 0.7151747,
    //     size.height * 0.3953219,
    //     size.width * 0.7164656,
    //     size.height * 0.3968538,
    //     size.width * 0.7179763,
    //     size.height * 0.3968538);
    // path_160.close();
    // path_160.moveTo(size.width * 0.7232694, size.height * 0.3901702);
    // path_160.cubicTo(
    //     size.width * 0.7226099,
    //     size.height * 0.3901702,
    //     size.width * 0.7219222,
    //     size.height * 0.3903926,
    //     size.width * 0.7211781,
    //     size.height * 0.3908373);
    // path_160.lineTo(size.width * 0.7216065, size.height * 0.3918874);
    // path_160.cubicTo(
    //     size.width * 0.7220519,
    //     size.height * 0.3916156,
    //     size.width * 0.7225310,
    //     size.height * 0.3914056,
    //     size.width * 0.7230271,
    //     size.height * 0.3914056);
    // path_160.cubicTo(
    //     size.width * 0.7239797,
    //     size.height * 0.3914056,
    //     size.width * 0.7243179,
    //     size.height * 0.3921222,
    //     size.width * 0.7243179,
    //     size.height * 0.3928634);
    // path_160.lineTo(size.width * 0.7243179, size.height * 0.3930364);
    // path_160.cubicTo(
    //     size.width * 0.7238388,
    //     size.height * 0.3928140,
    //     size.width * 0.7233202,
    //     size.height * 0.3926905,
    //     size.width * 0.7228467,
    //     size.height * 0.3926905);
    // path_160.cubicTo(
    //     size.width * 0.7216685,
    //     size.height * 0.3926905,
    //     size.width * 0.7207046,
    //     size.height * 0.3935553,
    //     size.width * 0.7207046,
    //     size.height * 0.3948154);
    // path_160.cubicTo(
    //     size.width * 0.7207046,
    //     size.height * 0.3960508,
    //     size.width * 0.7215445,
    //     size.height * 0.3968538,
    //     size.width * 0.7226607,
    //     size.height * 0.3968538);
    // path_160.cubicTo(
    //     size.width * 0.7232694,
    //     size.height * 0.3968538,
    //     size.width * 0.7239290,
    //     size.height * 0.3965326,
    //     size.width * 0.7243179,
    //     size.height * 0.3959396);
    // path_160.lineTo(size.width * 0.7243179, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7255242, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7255242, size.height * 0.3928634);
    // path_160.cubicTo(
    //     size.width * 0.7255242,
    //     size.height * 0.3912450,
    //     size.width * 0.7246618,
    //     size.height * 0.3901702,
    //     size.width * 0.7232694,
    //     size.height * 0.3901702);
    // path_160.close();
    // path_160.moveTo(size.width * 0.7229369, size.height * 0.3957543);
    // path_160.cubicTo(
    //     size.width * 0.7223450,
    //     size.height * 0.3957543,
    //     size.width * 0.7219109,
    //     size.height * 0.3953713,
    //     size.width * 0.7219109,
    //     size.height * 0.3947660);
    // path_160.cubicTo(
    //     size.width * 0.7219109,
    //     size.height * 0.3941606,
    //     size.width * 0.7224070,
    //     size.height * 0.3937406,
    //     size.width * 0.7230271,
    //     size.height * 0.3937406);
    // path_160.cubicTo(
    //     size.width * 0.7234949,
    //     size.height * 0.3937406,
    //     size.width * 0.7239290,
    //     size.height * 0.3938270,
    //     size.width * 0.7243179,
    //     size.height * 0.3939876);
    // path_160.lineTo(size.width * 0.7243179, size.height * 0.3947042);
    // path_160.cubicTo(
    //     size.width * 0.7241714,
    //     size.height * 0.3953837,
    //     size.width * 0.7235344,
    //     size.height * 0.3957543,
    //     size.width * 0.7229369,
    //     size.height * 0.3957543);
    // path_160.close();
    // path_160.moveTo(size.width * 0.7329200, size.height * 0.3901702);
    // path_160.cubicTo(
    //     size.width * 0.7321421,
    //     size.height * 0.3901702,
    //     size.width * 0.7314825,
    //     size.height * 0.3906397,
    //     size.width * 0.7312289,
    //     size.height * 0.3913809);
    // path_160.cubicTo(
    //     size.width * 0.7309019,
    //     size.height * 0.3906273,
    //     size.width * 0.7302931,
    //     size.height * 0.3901702,
    //     size.width * 0.7295547,
    //     size.height * 0.3901702);
    // path_160.cubicTo(
    //     size.width * 0.7288952,
    //     size.height * 0.3901702,
    //     size.width * 0.7283540,
    //     size.height * 0.3905655,
    //     size.width * 0.7280891,
    //     size.height * 0.3911833);
    // path_160.lineTo(size.width * 0.7280891, size.height * 0.3903185);
    // path_160.lineTo(size.width * 0.7268546, size.height * 0.3903185);
    // path_160.lineTo(size.width * 0.7268546, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7280891, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7280891, size.height * 0.3927893);
    // path_160.cubicTo(
    //     size.width * 0.7280891,
    //     size.height * 0.3920110,
    //     size.width * 0.7285682,
    //     size.height * 0.3914550,
    //     size.width * 0.7292390,
    //     size.height * 0.3914550);
    // path_160.cubicTo(
    //     size.width * 0.7298478,
    //     size.height * 0.3914550,
    //     size.width * 0.7302649,
    //     size.height * 0.3920480,
    //     size.width * 0.7302649,
    //     size.height * 0.3928881);
    // path_160.lineTo(size.width * 0.7302649, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7314713, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7314713, size.height * 0.3927893);
    // path_160.cubicTo(
    //     size.width * 0.7314713,
    //     size.height * 0.3920110,
    //     size.width * 0.7319391,
    //     size.height * 0.3914550,
    //     size.width * 0.7326156,
    //     size.height * 0.3914550);
    // path_160.cubicTo(
    //     size.width * 0.7332131,
    //     size.height * 0.3914550,
    //     size.width * 0.7336302,
    //     size.height * 0.3920480,
    //     size.width * 0.7336302,
    //     size.height * 0.3928881);
    // path_160.lineTo(size.width * 0.7336302, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7348365, size.height * 0.3967056);
    // path_160.lineTo(size.width * 0.7348365, size.height * 0.3926410);
    // path_160.cubicTo(
    //     size.width * 0.7348365,
    //     size.height * 0.3911956,
    //     size.width * 0.7340192,
    //     size.height * 0.3901702,
    //     size.width * 0.7329200,
    //     size.height * 0.3901702);
    // path_160.close();

    // Paint paint_160_fill = Paint()..style = PaintingStyle.fill;
    // paint_160_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_160, paint_160_fill);

    // Paint paint_161_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_161_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7466178, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_161_stroke);

    // Paint paint_161_fill = Paint()..style = PaintingStyle.fill;
    // paint_161_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7466178, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_161_fill);

    // Path path_162 = Path();
    // path_162.moveTo(size.width * 0.7596956, size.height * 0.3901702);
    // path_162.cubicTo(
    //     size.width * 0.7589121,
    //     size.height * 0.3901702,
    //     size.width * 0.7582807,
    //     size.height * 0.3906026,
    //     size.width * 0.7578692,
    //     size.height * 0.3913315);
    // path_162.lineTo(size.width * 0.7578692, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7566291, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7566291, size.height * 0.3988305);
    // path_162.lineTo(size.width * 0.7578692, size.height * 0.3988305);
    // path_162.lineTo(size.width * 0.7578692, size.height * 0.3956925);
    // path_162.cubicTo(
    //     size.width * 0.7582807,
    //     size.height * 0.3964214,
    //     size.width * 0.7589121,
    //     size.height * 0.3968538,
    //     size.width * 0.7596956,
    //     size.height * 0.3968538);
    // path_162.cubicTo(
    //     size.width * 0.7610823,
    //     size.height * 0.3968538,
    //     size.width * 0.7620970,
    //     size.height * 0.3954701,
    //     size.width * 0.7620970,
    //     size.height * 0.3935058);
    // path_162.cubicTo(
    //     size.width * 0.7620970,
    //     size.height * 0.3915539,
    //     size.width * 0.7610823,
    //     size.height * 0.3901702,
    //     size.width * 0.7596956,
    //     size.height * 0.3901702);
    // path_162.close();
    // path_162.moveTo(size.width * 0.7593574, size.height * 0.3955690);
    // path_162.cubicTo(
    //     size.width * 0.7584837,
    //     size.height * 0.3955690,
    //     size.width * 0.7578749,
    //     size.height * 0.3947042,
    //     size.width * 0.7578749,
    //     size.height * 0.3935058);
    // path_162.cubicTo(
    //     size.width * 0.7578749,
    //     size.height * 0.3923075,
    //     size.width * 0.7584837,
    //     size.height * 0.3914550,
    //     size.width * 0.7593574,
    //     size.height * 0.3914550);
    // path_162.cubicTo(
    //     size.width * 0.7602424,
    //     size.height * 0.3914550,
    //     size.width * 0.7608681,
    //     size.height * 0.3923075,
    //     size.width * 0.7608681,
    //     size.height * 0.3935058);
    // path_162.cubicTo(
    //     size.width * 0.7608681,
    //     size.height * 0.3947042,
    //     size.width * 0.7602424,
    //     size.height * 0.3955690,
    //     size.width * 0.7593574,
    //     size.height * 0.3955690);
    // path_162.close();
    // path_162.moveTo(size.width * 0.7645547, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7656821, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7667982, size.height * 0.3923322);
    // path_162.lineTo(size.width * 0.7679256, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7690530, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7708174, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7695772, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7684949, size.height * 0.3946795);
    // path_162.lineTo(size.width * 0.7673168, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7662796, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7651127, size.height * 0.3946795);
    // path_162.lineTo(size.width * 0.7640192, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7627790, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7645547, size.height * 0.3967056);
    // path_162.close();
    // path_162.moveTo(size.width * 0.7729989, size.height * 0.3915539);
    // path_162.lineTo(size.width * 0.7729989, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7717587, size.height * 0.3903185);
    // path_162.lineTo(size.width * 0.7717587, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7729989, size.height * 0.3967056);
    // path_162.lineTo(size.width * 0.7729989, size.height * 0.3934811);
    // path_162.cubicTo(
    //     size.width * 0.7729989,
    //     size.height * 0.3922704,
    //     size.width * 0.7737486,
    //     size.height * 0.3914550,
    //     size.width * 0.7748760,
    //     size.height * 0.3914550);
    // path_162.lineTo(size.width * 0.7748760, size.height * 0.3901702);
    // path_162.cubicTo(
    //     size.width * 0.7740135,
    //     size.height * 0.3901702,
    //     size.width * 0.7733315,
    //     size.height * 0.3907014,
    //     size.width * 0.7729989,
    //     size.height * 0.3915539);
    // path_162.close();

    // Paint paint_162_fill = Paint()..style = PaintingStyle.fill;
    // paint_162_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_162, paint_162_fill);

    // Paint paint_163_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_163_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7877678, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_163_stroke);

    // Paint paint_163_fill = Paint()..style = PaintingStyle.fill;
    // paint_163_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.7877678, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_163_fill);

    // Path path_164 = Path();
    // path_164.moveTo(size.width * 0.7967080, size.height * 0.3890295);
    // path_164.lineTo(size.width * 0.7967080, size.height * 0.3919067);
    // path_164.cubicTo(
    //     size.width * 0.7963360,
    //     size.height * 0.3912697,
    //     size.width * 0.7957779,
    //     size.height * 0.3908964,
    //     size.width * 0.7950958,
    //     size.height * 0.3908964);
    // path_164.cubicTo(
    //     size.width * 0.7938557,
    //     size.height * 0.3908964,
    //     size.width * 0.7929538,
    //     size.height * 0.3921263,
    //     size.width * 0.7929538,
    //     size.height * 0.3938614);
    // path_164.cubicTo(
    //     size.width * 0.7929538,
    //     size.height * 0.3956074,
    //     size.width * 0.7938557,
    //     size.height * 0.3968373,
    //     size.width * 0.7950958,
    //     size.height * 0.3968373);
    // path_164.cubicTo(
    //     size.width * 0.7957779,
    //     size.height * 0.3968373,
    //     size.width * 0.7963360,
    //     size.height * 0.3964640,
    //     size.width * 0.7967080,
    //     size.height * 0.3958270);
    // path_164.lineTo(size.width * 0.7967080, size.height * 0.3967056);
    // path_164.lineTo(size.width * 0.7978072, size.height * 0.3967056);
    // path_164.lineTo(size.width * 0.7978072, size.height * 0.3890295);
    // path_164.lineTo(size.width * 0.7967080, size.height * 0.3890295);
    // path_164.close();
    // path_164.moveTo(size.width * 0.7953890, size.height * 0.3956953);
    // path_164.cubicTo(
    //     size.width * 0.7946054,
    //     size.height * 0.3956953,
    //     size.width * 0.7940474,
    //     size.height * 0.3949266,
    //     size.width * 0.7940474,
    //     size.height * 0.3938614);
    // path_164.cubicTo(
    //     size.width * 0.7940474,
    //     size.height * 0.3927962,
    //     size.width * 0.7946054,
    //     size.height * 0.3920384,
    //     size.width * 0.7953890,
    //     size.height * 0.3920384);
    // path_164.cubicTo(
    //     size.width * 0.7961669,
    //     size.height * 0.3920384,
    //     size.width * 0.7967080,
    //     size.height * 0.3927962,
    //     size.width * 0.7967080,
    //     size.height * 0.3938614);
    // path_164.cubicTo(
    //     size.width * 0.7967080,
    //     size.height * 0.3949266,
    //     size.width * 0.7961669,
    //     size.height * 0.3956953,
    //     size.width * 0.7953890,
    //     size.height * 0.3956953);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8012232, size.height * 0.3956513);
    // path_164.cubicTo(
    //     size.width * 0.8005524,
    //     size.height * 0.3956513,
    //     size.width * 0.8000676,
    //     size.height * 0.3951023,
    //     size.width * 0.7999324,
    //     size.height * 0.3943226);
    // path_164.lineTo(size.width * 0.8034498, size.height * 0.3943226);
    // path_164.cubicTo(
    //     size.width * 0.8034498,
    //     size.height * 0.3922251,
    //     size.width * 0.8026099,
    //     size.height * 0.3908964,
    //     size.width * 0.8011669,
    //     size.height * 0.3908964);
    // path_164.cubicTo(
    //     size.width * 0.7998422,
    //     size.height * 0.3908964,
    //     size.width * 0.7987937,
    //     size.height * 0.3921482,
    //     size.width * 0.7987937,
    //     size.height * 0.3938504);
    // path_164.cubicTo(
    //     size.width * 0.7987937,
    //     size.height * 0.3955964,
    //     size.width * 0.7998929,
    //     size.height * 0.3968373,
    //     size.width * 0.8012289,
    //     size.height * 0.3968373);
    // path_164.cubicTo(
    //     size.width * 0.8019053,
    //     size.height * 0.3968373,
    //     size.width * 0.8027170,
    //     size.height * 0.3964859,
    //     size.width * 0.8031229,
    //     size.height * 0.3959588);
    // path_164.lineTo(size.width * 0.8024295, size.height * 0.3950803);
    // path_164.cubicTo(
    //     size.width * 0.8021702,
    //     size.height * 0.3954097,
    //     size.width * 0.8016516,
    //     size.height * 0.3956513,
    //     size.width * 0.8012232,
    //     size.height * 0.3956513);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8012120, size.height * 0.3920824);
    // path_164.cubicTo(
    //     size.width * 0.8018715,
    //     size.height * 0.3920824,
    //     size.width * 0.8022661,
    //     size.height * 0.3925875,
    //     size.width * 0.8023957,
    //     size.height * 0.3933013);
    // path_164.lineTo(size.width * 0.7999380, size.height * 0.3933013);
    // path_164.cubicTo(
    //     size.width * 0.8001015,
    //     size.height * 0.3925546,
    //     size.width * 0.8005975,
    //     size.height * 0.3920824,
    //     size.width * 0.8012120,
    //     size.height * 0.3920824);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8044025, size.height * 0.3967056);
    // path_164.lineTo(size.width * 0.8055017, size.height * 0.3967056);
    // path_164.lineTo(size.width * 0.8055017, size.height * 0.3890295);
    // path_164.lineTo(size.width * 0.8044025, size.height * 0.3890295);
    // path_164.lineTo(size.width * 0.8044025, size.height * 0.3967056);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8088895, size.height * 0.3956513);
    // path_164.cubicTo(
    //     size.width * 0.8082244,
    //     size.height * 0.3956513,
    //     size.width * 0.8077396,
    //     size.height * 0.3951023,
    //     size.width * 0.8076043,
    //     size.height * 0.3943226);
    // path_164.lineTo(size.width * 0.8111218, size.height * 0.3943226);
    // path_164.cubicTo(
    //     size.width * 0.8111218,
    //     size.height * 0.3922251,
    //     size.width * 0.8102818,
    //     size.height * 0.3908964,
    //     size.width * 0.8088388,
    //     size.height * 0.3908964);
    // path_164.cubicTo(
    //     size.width * 0.8075141,
    //     size.height * 0.3908964,
    //     size.width * 0.8064656,
    //     size.height * 0.3921482,
    //     size.width * 0.8064656,
    //     size.height * 0.3938504);
    // path_164.cubicTo(
    //     size.width * 0.8064656,
    //     size.height * 0.3955964,
    //     size.width * 0.8075648,
    //     size.height * 0.3968373,
    //     size.width * 0.8089008,
    //     size.height * 0.3968373);
    // path_164.cubicTo(
    //     size.width * 0.8095772,
    //     size.height * 0.3968373,
    //     size.width * 0.8103890,
    //     size.height * 0.3964859,
    //     size.width * 0.8107948,
    //     size.height * 0.3959588);
    // path_164.lineTo(size.width * 0.8101015, size.height * 0.3950803);
    // path_164.cubicTo(
    //     size.width * 0.8098365,
    //     size.height * 0.3954097,
    //     size.width * 0.8093236,
    //     size.height * 0.3956513,
    //     size.width * 0.8088895,
    //     size.height * 0.3956513);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8088839, size.height * 0.3920824);
    // path_164.cubicTo(
    //     size.width * 0.8095434,
    //     size.height * 0.3920824,
    //     size.width * 0.8099380,
    //     size.height * 0.3925875,
    //     size.width * 0.8100620,
    //     size.height * 0.3933013);
    // path_164.lineTo(size.width * 0.8076099, size.height * 0.3933013);
    // path_164.cubicTo(
    //     size.width * 0.8077734,
    //     size.height * 0.3925546,
    //     size.width * 0.8082694,
    //     size.height * 0.3920824,
    //     size.width * 0.8088839,
    //     size.height * 0.3920824);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8144025, size.height * 0.3954866);
    // path_164.cubicTo(
    //     size.width * 0.8143010,
    //     size.height * 0.3956074,
    //     size.width * 0.8141319,
    //     size.height * 0.3956953,
    //     size.width * 0.8139402,
    //     size.height * 0.3956953);
    // path_164.cubicTo(
    //     size.width * 0.8136809,
    //     size.height * 0.3956953,
    //     size.width * 0.8134780,
    //     size.height * 0.3954207,
    //     size.width * 0.8134780,
    //     size.height * 0.3950364);
    // path_164.lineTo(size.width * 0.8134780, size.height * 0.3921373);
    // path_164.lineTo(size.width * 0.8145378, size.height * 0.3921373);
    // path_164.lineTo(size.width * 0.8145378, size.height * 0.3910281);
    // path_164.lineTo(size.width * 0.8134780, size.height * 0.3910281);
    // path_164.lineTo(size.width * 0.8134780, size.height * 0.3894688);
    // path_164.lineTo(size.width * 0.8124070, size.height * 0.3894688);
    // path_164.lineTo(size.width * 0.8124070, size.height * 0.3910281);
    // path_164.lineTo(size.width * 0.8117306, size.height * 0.3910281);
    // path_164.lineTo(size.width * 0.8117306, size.height * 0.3921373);
    // path_164.lineTo(size.width * 0.8124070, size.height * 0.3921373);
    // path_164.lineTo(size.width * 0.8124070, size.height * 0.3952011);
    // path_164.cubicTo(
    //     size.width * 0.8124070,
    //     size.height * 0.3961565,
    //     size.width * 0.8129481,
    //     size.height * 0.3968373,
    //     size.width * 0.8137260,
    //     size.height * 0.3968373);
    // path_164.cubicTo(
    //     size.width * 0.8140755,
    //     size.height * 0.3968373,
    //     size.width * 0.8144532,
    //     size.height * 0.3966616,
    //     size.width * 0.8147182,
    //     size.height * 0.3963871);
    // path_164.lineTo(size.width * 0.8144025, size.height * 0.3954866);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8177452, size.height * 0.3956513);
    // path_164.cubicTo(
    //     size.width * 0.8170744,
    //     size.height * 0.3956513,
    //     size.width * 0.8165896,
    //     size.height * 0.3951023,
    //     size.width * 0.8164543,
    //     size.height * 0.3943226);
    // path_164.lineTo(size.width * 0.8199718, size.height * 0.3943226);
    // path_164.cubicTo(
    //     size.width * 0.8199718,
    //     size.height * 0.3922251,
    //     size.width * 0.8191319,
    //     size.height * 0.3908964,
    //     size.width * 0.8176888,
    //     size.height * 0.3908964);
    // path_164.cubicTo(
    //     size.width * 0.8163641,
    //     size.height * 0.3908964,
    //     size.width * 0.8153157,
    //     size.height * 0.3921482,
    //     size.width * 0.8153157,
    //     size.height * 0.3938504);
    // path_164.cubicTo(
    //     size.width * 0.8153157,
    //     size.height * 0.3955964,
    //     size.width * 0.8164205,
    //     size.height * 0.3968373,
    //     size.width * 0.8177508,
    //     size.height * 0.3968373);
    // path_164.cubicTo(
    //     size.width * 0.8184273,
    //     size.height * 0.3968373,
    //     size.width * 0.8192390,
    //     size.height * 0.3964859,
    //     size.width * 0.8196449,
    //     size.height * 0.3959588);
    // path_164.lineTo(size.width * 0.8189515, size.height * 0.3950803);
    // path_164.cubicTo(
    //     size.width * 0.8186922,
    //     size.height * 0.3954097,
    //     size.width * 0.8181793,
    //     size.height * 0.3956513,
    //     size.width * 0.8177452,
    //     size.height * 0.3956513);
    // path_164.close();
    // path_164.moveTo(size.width * 0.8177339, size.height * 0.3920824);
    // path_164.cubicTo(
    //     size.width * 0.8183935,
    //     size.height * 0.3920824,
    //     size.width * 0.8187880,
    //     size.height * 0.3925875,
    //     size.width * 0.8189177,
    //     size.height * 0.3933013);
    // path_164.lineTo(size.width * 0.8164656, size.height * 0.3933013);
    // path_164.cubicTo(
    //     size.width * 0.8166234,
    //     size.height * 0.3925546,
    //     size.width * 0.8171195,
    //     size.height * 0.3920824,
    //     size.width * 0.8177339,
    //     size.height * 0.3920824);
    // path_164.close();

    // Paint paint_164_fill = Paint()..style = PaintingStyle.fill;
    // paint_164_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_164, paint_164_fill);

    // Paint paint_165_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_165_stroke.color = Color(0xff474747).withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_165_stroke);

    // Paint paint_165_fill = Paint()..style = PaintingStyle.fill;
    // paint_165_fill.color = Colors.black.withOpacity(1.0);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.1755919, size.height * 0.3743995,
    //             size.width * 0.03776776, size.height * 0.03774880),
    //         bottomRight: Radius.circular(size.width * 0.003100338),
    //         bottomLeft: Radius.circular(size.width * 0.003100338),
    //         topLeft: Radius.circular(size.width * 0.003100338),
    //         topRight: Radius.circular(size.width * 0.003100338)),
    //     paint_165_fill);

    // Path path_166 = Path();
    // path_166.moveTo(size.width * 0.1891454, size.height * 0.3955196);
    // path_166.cubicTo(
    //     size.width * 0.1883946,
    //     size.height * 0.3955196,
    //     size.width * 0.1878467,
    //     size.height * 0.3949019,
    //     size.width * 0.1876945,
    //     size.height * 0.3940247);
    // path_166.lineTo(size.width * 0.1916516, size.height * 0.3940247);
    // path_166.cubicTo(
    //     size.width * 0.1916516,
    //     size.height * 0.3916651,
    //     size.width * 0.1907080,
    //     size.height * 0.3901702,
    //     size.width * 0.1890846,
    //     size.height * 0.3901702);
    // path_166.cubicTo(
    //     size.width * 0.1875930,
    //     size.height * 0.3901702,
    //     size.width * 0.1864160,
    //     size.height * 0.3915786,
    //     size.width * 0.1864160,
    //     size.height * 0.3934935);
    // path_166.cubicTo(
    //     size.width * 0.1864160,
    //     size.height * 0.3954578,
    //     size.width * 0.1876539,
    //     size.height * 0.3968538,
    //     size.width * 0.1891556,
    //     size.height * 0.3968538);
    // path_166.cubicTo(
    //     size.width * 0.1899166,
    //     size.height * 0.3968538,
    //     size.width * 0.1908298,
    //     size.height * 0.3964585,
    //     size.width * 0.1912864,
    //     size.height * 0.3958655);
    // path_166.lineTo(size.width * 0.1905051, size.height * 0.3948771);
    // path_166.cubicTo(
    //     size.width * 0.1902108,
    //     size.height * 0.3952478,
    //     size.width * 0.1896325,
    //     size.height * 0.3955196,
    //     size.width * 0.1891454,
    //     size.height * 0.3955196);
    // path_166.close();
    // path_166.moveTo(size.width * 0.1891353, size.height * 0.3915045);
    // path_166.cubicTo(
    //     size.width * 0.1898760,
    //     size.height * 0.3915045,
    //     size.width * 0.1903224,
    //     size.height * 0.3920728,
    //     size.width * 0.1904645,
    //     size.height * 0.3928758);
    // path_166.lineTo(size.width * 0.1877046, size.height * 0.3928758);
    // path_166.cubicTo(
    //     size.width * 0.1878873,
    //     size.height * 0.3920357,
    //     size.width * 0.1884453,
    //     size.height * 0.3915045,
    //     size.width * 0.1891353,
    //     size.height * 0.3915045);
    // path_166.close();
    // path_166.moveTo(size.width * 0.1946629, size.height * 0.3968538);
    // path_166.cubicTo(
    //     size.width * 0.1958906,
    //     size.height * 0.3968538,
    //     size.width * 0.1967227,
    //     size.height * 0.3960631,
    //     size.width * 0.1967227,
    //     size.height * 0.3948401);
    // path_166.cubicTo(
    //     size.width * 0.1967227,
    //     size.height * 0.3935058,
    //     size.width * 0.1957689,
    //     size.height * 0.3931352,
    //     size.width * 0.1948861,
    //     size.height * 0.3928387);
    // path_166.cubicTo(
    //     size.width * 0.1940846,
    //     size.height * 0.3925546,
    //     size.width * 0.1938106,
    //     size.height * 0.3924310,
    //     size.width * 0.1938106,
    //     size.height * 0.3920233);
    // path_166.cubicTo(
    //     size.width * 0.1938106,
    //     size.height * 0.3916651,
    //     size.width * 0.1941454,
    //     size.height * 0.3914550,
    //     size.width * 0.1945817,
    //     size.height * 0.3914550);
    // path_166.cubicTo(
    //     size.width * 0.1950383,
    //     size.height * 0.3914550,
    //     size.width * 0.1955761,
    //     size.height * 0.3916527,
    //     size.width * 0.1960733,
    //     size.height * 0.3920357);
    // path_166.lineTo(size.width * 0.1965908, size.height * 0.3909362);
    // path_166.cubicTo(
    //     size.width * 0.1960225,
    //     size.height * 0.3904791,
    //     size.width * 0.1953021,
    //     size.height * 0.3901702,
    //     size.width * 0.1945817,
    //     size.height * 0.3901702);
    // path_166.cubicTo(
    //     size.width * 0.1934149,
    //     size.height * 0.3901702,
    //     size.width * 0.1926032,
    //     size.height * 0.3909856,
    //     size.width * 0.1926032,
    //     size.height * 0.3921839);
    // path_166.cubicTo(
    //     size.width * 0.1926133,
    //     size.height * 0.3933205,
    //     size.width * 0.1933337,
    //     size.height * 0.3937159,
    //     size.width * 0.1944701,
    //     size.height * 0.3940741);
    // path_166.cubicTo(
    //     size.width * 0.1950688,
    //     size.height * 0.3942718,
    //     size.width * 0.1955254,
    //     size.height * 0.3944324,
    //     size.width * 0.1955254,
    //     size.height * 0.3949266);
    // path_166.cubicTo(
    //     size.width * 0.1955254,
    //     size.height * 0.3953219,
    //     size.width * 0.1951804,
    //     size.height * 0.3955813,
    //     size.width * 0.1946832,
    //     size.height * 0.3955813);
    // path_166.cubicTo(
    //     size.width * 0.1940237,
    //     size.height * 0.3955813,
    //     size.width * 0.1934352,
    //     size.height * 0.3952848,
    //     size.width * 0.1929278,
    //     size.height * 0.3948401);
    // path_166.lineTo(size.width * 0.1923698, size.height * 0.3958902);
    // path_166.cubicTo(
    //     size.width * 0.1929989,
    //     size.height * 0.3965079,
    //     size.width * 0.1938613,
    //     size.height * 0.3968538,
    //     size.width * 0.1946629,
    //     size.height * 0.3968538);
    // path_166.close();
    // path_166.moveTo(size.width * 0.2003247, size.height * 0.3968538);
    // path_166.cubicTo(
    //     size.width * 0.2011567,
    //     size.height * 0.3968538,
    //     size.width * 0.2018568,
    //     size.height * 0.3964338,
    //     size.width * 0.2023641,
    //     size.height * 0.3957790);
    // path_166.lineTo(size.width * 0.2015321, size.height * 0.3949019);
    // path_166.cubicTo(
    //     size.width * 0.2012379,
    //     size.height * 0.3953095,
    //     size.width * 0.2007914,
    //     size.height * 0.3955690,
    //     size.width * 0.2003348,
    //     size.height * 0.3955690);
    // path_166.cubicTo(
    //     size.width * 0.1994724,
    //     size.height * 0.3955690,
    //     size.width * 0.1987520,
    //     size.height * 0.3946301,
    //     size.width * 0.1987520,
    //     size.height * 0.3935058);
    // path_166.cubicTo(
    //     size.width * 0.1987520,
    //     size.height * 0.3923940,
    //     size.width * 0.1994724,
    //     size.height * 0.3914550,
    //     size.width * 0.2003348,
    //     size.height * 0.3914550);
    // path_166.cubicTo(
    //     size.width * 0.2007813,
    //     size.height * 0.3914550,
    //     size.width * 0.2012176,
    //     size.height * 0.3917145,
    //     size.width * 0.2015017,
    //     size.height * 0.3920975);
    // path_166.lineTo(size.width * 0.2023331, size.height * 0.3912080);
    // path_166.cubicTo(
    //     size.width * 0.2018365,
    //     size.height * 0.3905779,
    //     size.width * 0.2011364,
    //     size.height * 0.3901702,
    //     size.width * 0.2003450,
    //     size.height * 0.3901702);
    // path_166.cubicTo(
    //     size.width * 0.1988129,
    //     size.height * 0.3901702,
    //     size.width * 0.1975242,
    //     size.height * 0.3916898,
    //     size.width * 0.1975242,
    //     size.height * 0.3935058);
    // path_166.cubicTo(
    //     size.width * 0.1975242,
    //     size.height * 0.3953219,
    //     size.width * 0.1988129,
    //     size.height * 0.3968538,
    //     size.width * 0.2003247,
    //     size.height * 0.3968538);
    // path_166.close();

    // Paint paint_166_fill = Paint()..style = PaintingStyle.fill;
    // paint_166_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawPath(path_166, paint_166_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
