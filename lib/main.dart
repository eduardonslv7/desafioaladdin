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
  TipoTapete('Circulo', 1.4),
  TipoTapete('Retangulo', 3.56),
  TipoTapete('Triangulo', 9.16),
];
