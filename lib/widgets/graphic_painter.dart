import 'dart:ui';

import 'package:computer_graphics_1/bloc/graphic_paras_bloc/graphic_params_bloc.dart';
import 'package:computer_graphics_1/models/fun.dart';
import 'package:computer_graphics_1/models/graphic_data.dart';
import 'package:flutter/material.dart';

class GraphicPainter extends CustomPainter {
  final GraphicParams graphicParams;
  GraphicPainter(this.graphicParams);
  @override
  void paint(Canvas canvas, Size size) {
    final graphicData = GraphicData(
        graphicParams.xMin,
        graphicParams.xMax,
        graphicParams.fun.toFunction(),
        size.width.toInt(),
        size.height.toInt());
    var graphicPaint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;
    var axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    //canvas.drawColor(Colors.white, BlendMode.color);
    canvas.drawPoints(PointMode.polygon, graphicData.xAxisPoints, axisPaint);
    canvas.drawPoints(PointMode.polygon, graphicData.yAxisPoints, axisPaint);
    canvas.drawPoints(PointMode.polygon, graphicData.graphicPoints, graphicPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
