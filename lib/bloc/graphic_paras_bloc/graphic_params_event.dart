part of 'graphic_params_bloc.dart';

abstract class GraphicParamsEvent extends Equatable {}

class MinXChanged extends GraphicParamsEvent {
  final double newValue;
  MinXChanged(this.newValue);
  @override
  List<Object?> get props => [newValue];
}

class MaxXChanged extends GraphicParamsEvent {
  final double newValue;
  MaxXChanged(this.newValue);
  @override
  List<Object?> get props => [newValue];
}

class FunChanged extends GraphicParamsEvent {
  final Fun fun;
  FunChanged(this.fun);
  @override
  List<Object?> get props => [fun];
}
