import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:computer_graphics_1/buffers/graphic_data_buffer.dart';
import 'package:computer_graphics_1/models/fun.dart';
import 'package:equatable/equatable.dart';

part 'graphic_params_event.dart';
part 'graphic_params_state.dart';

class GraphicParamsBloc extends Bloc<GraphicParamsEvent, GraphicParamsState> {
  GraphicParamsBloc() : super(GraphicParams(Fun.sin, -3, 3));

  final graphicDataBuffer = GraphicDataBuffer(Fun.sin, -3, 3);

  @override
  Stream<GraphicParamsState> mapEventToState(
    GraphicParamsEvent event,
  ) async* {
    if (event is MinXChanged) {
      if (event.newValue >= graphicDataBuffer.xMax) {
        yield GraphicParamsError("X min should be < X max!");
      } else {
        graphicDataBuffer.xMin = event.newValue;
      }
      yield graphicDataBuffer.toParams();
    } else if (event is MaxXChanged) {
      if (event.newValue <= graphicDataBuffer.xMin) {
        yield GraphicParamsError("X max should be > X min!");
      } else {
        graphicDataBuffer.xMax = event.newValue;
      }
      yield graphicDataBuffer.toParams();
    } else if (event is FunChanged) {
      graphicDataBuffer.fun = event.fun;
      yield graphicDataBuffer.toParams();
    }
  }
}
