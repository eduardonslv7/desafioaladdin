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
