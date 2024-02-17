import 'package:flutter/material.dart';
import 'dart:math';

import 'package:projeto_aladdin/telas/tela_inicial.dart';


void main() {runApp(MaterialApp(
	title: 'Navegação Básica',
	 theme: ThemeData(
	   primarySwatch: Colors.blue
         ),
         home: TelaInicial(),
      )
    );
}



class TipoTapete {
  final String formato;
  final double valorM2;

  TipoTapete(this.formato, this.valorM2);
}


final List<TipoTapete> tiposTapete = [
  TipoTapete('Circular', 1.4),
  TipoTapete('Retangular', 3.56),
  TipoTapete('Triangular', 9.16),
];






enum Shape { CIRCULO, TRIANGULO, RETANGULO }

class CalculadoraArea {
  double getAreaFromShape(Shape shape, double side1, double? side2) {
    switch (shape) {
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

