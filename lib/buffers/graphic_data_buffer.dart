import 'package:computer_graphics_1/bloc/graphic_paras_bloc/graphic_params_bloc.dart';
import 'package:computer_graphics_1/models/fun.dart';

class GraphicDataBuffer {
  Fun fun;
  double xMin;
  double xMax;
  GraphicDataBuffer(this.fun, this.xMin, this.xMax);

  GraphicParams toParams() => GraphicParams(fun, xMin, xMax);
}
