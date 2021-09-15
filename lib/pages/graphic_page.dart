import 'package:computer_graphics_1/bloc/graphic_paras_bloc/graphic_params_bloc.dart';
import 'package:computer_graphics_1/widgets/grahic_params_widget.dart';
import 'package:computer_graphics_1/widgets/graphic_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphicPage extends StatelessWidget {
  const GraphicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph"),
      ),
      body: Container(
        color: Colors.white10,
        child: Row(
          children: [
            Flexible(
              flex: 8,
              child: Container(
                color: Colors.white10,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: double.infinity,
                  child: BlocBuilder<GraphicParamsBloc, GraphicParamsState>(
                    buildWhen: (_, state) => state is GraphicParams,
                    builder: (context, state) {
                      return CustomPaint(
                        foregroundPainter:
                            GraphicPainter((state as GraphicParams)),
                      );
                    },
                  ),
                ),
              ),
            ),
            Flexible(
                child: Container(
              width: double.infinity,
              height: double.infinity,
            )),
            Flexible(flex: 2, child: GraphicParamsWidget()),
          ],
        ),
      ),
    );
  }
}
