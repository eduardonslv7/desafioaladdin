import 'package:flutter/material.dart';

class TelaOrcamento extends StatelessWidget {
  final double area;
  final double valor;

  TelaOrcamento(this.area, this.valor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aladdin Tapetes - Resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Área total do tapete: ${area.toStringAsFixed(2)} m²',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Valor final do orçamento: R\$ ${valor.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  },
  child: Text('Novo Orçamento'),
),

            
          ],
        ),
      ),
    );
  }
}