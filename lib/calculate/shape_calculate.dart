import 'dart:math';

import 'package:diacritic/diacritic.dart';

enum Shape { CIRCULO, TRIANGULO, RETANGULO }

Shape getShape(String nome) {
  return Shape.values.firstWhere(
      (e) =>
          e.name.toString().toLowerCase() ==
          removeDiacritics(nome).toLowerCase(),
      orElse: () => Shape.TRIANGULO);
}

class CalculadoraArea {
  double getAreaFromShape(String shape, double side1, double? side2) {
    final selectedShape = getShape(shape);
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
