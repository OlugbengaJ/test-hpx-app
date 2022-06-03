import 'package:flutter/material.dart';

Size screenDimension(BuildContext context) {
  return MediaQuery.of(context).size;
}

double subtractAbs(double x, double y) {
  return (x - y).abs();
}
