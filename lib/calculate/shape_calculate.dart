import 'dart:math';

enum Shape { CIRCULO, TRIANGULO, RETANGULO }

class CalculadoraArea {
  double getAreaFromShape(String shape, double side1, double? side2) {
    final selectedShape = Shape.values.firstWhere(
      (e) =>
      e.name.toString().toLowerCase() ==
      shape.toLowerCase(),
    );
    switch (selectedShape) {
      case Shape.CIRCULO:
        return pow(side1 / 2, 2) * pi;
      case Shape.TRIANGULO:
        return (side1 * (side2 ?? 0)) / 2;
      case Shape.RETANGULO:
        return side1 * (side2 ?? 0);
      default:
        return 0;
    }
  }
}