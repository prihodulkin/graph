part of 'graphic_params_bloc.dart';

abstract class GraphicParamsState extends Equatable{
  @override
  List<Object?> get props => [];
}
class GraphicParams extends  GraphicParamsState {
  final double xMin;
  final double xMax;
  final Fun fun;

  GraphicParams(this.fun, this.xMin, this.xMax);
  @override
  List<Object?> get props => [xMax, xMin, fun];
}

class GraphicParamsError extends GraphicParamsState{
  final String errorMessage;
  GraphicParamsError(this.errorMessage);
   @override
  List<Object?> get props => [errorMessage];
}
