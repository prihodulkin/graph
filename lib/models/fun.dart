import 'dart:math';

enum Fun { sin, cos, x_2, x_3, exp }

extension FunExt on Fun {
 String getName(){
    switch (this) {
      case Fun.sin:
        return "sin(x)";
      case Fun.cos:
        return "cos(x)";
      case Fun.exp:
        return "exp(x)";
      case Fun.x_2:
        return "x^2";
      case Fun.x_3:
        return "x^3";
    }
 }

  double Function(double) toFunction() {
    switch (this) {
      case Fun.sin:
        return (x) => sin(x);
      case Fun.cos:
        return (x) => cos(x);
      case Fun.exp:
        return (x) => exp(x);
      case Fun.x_2:
        return (x) => x * x;
      case Fun.x_3:
        return (x) => x * x * x;
    }
  }
}
