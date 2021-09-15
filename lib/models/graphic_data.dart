import 'package:flutter/cupertino.dart';

class GraphicData {
  final double xMin;
  final double xMax;
  final double Function(double) y;
  final int xPixels;
  final int yPixels;

  late final double yMin;
  late final double yMax;
  late final List<double> yValues;
  late final double dy;
  late final double dx;
  final List<Offset> graphicPoints = [];
  final List<Offset> xAxisPoints = [];
  final List<Offset> yAxisPoints = [];

  GraphicData(this.xMin, this.xMax, this.y, this.xPixels, this.yPixels) {
    dx = (xMax.toDouble() - xMin.toDouble()) / xPixels;
    yValues = <double>[];
    var yMax = y(xMin);
    var yMin = yMax;
    for (double x = xMin; x < xMax; x += dx) {
      var yValue = y(x);
      yValues.add(yValue);
      if (yValue < yMin) {
        yMin = yValue;
      } else if (yValue > yMax) {
        yMax = yValue;
      }
    }
    this.yMax = yMax;
    this.yMin = yMin;
    dy = (yMax - yMin) / yPixels;

    for (var i = 0; i < yValues.length; i++) {
      var offsetY = (-yPixels - yMin / dy);
      graphicPoints.add(Offset(i.toDouble(), -yValues[i] / dy - offsetY));
    }
    if (xMax * xMin <= 0) {
      var x = (0 - xMin) / dx;
      for (var y = 0; y <= yPixels; y++) {
        yAxisPoints.add(Offset(x.toDouble(), y.toDouble()));
      }
    }
    if (yMin * yMax <= 0) {
      var y = (yMax - 0) / dy;
      for (var x = 0; x <= xPixels; x++) {
        xAxisPoints.add(Offset(x.toDouble(), y));
      }
    }
  }
}
