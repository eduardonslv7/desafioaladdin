import 'package:flutter/material.dart';
import 'package:projeto_aladdin/main.dart';
import 'package:projeto_aladdin/telas/tela_selecao_forma.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aladdin Tapetes'),
        backgroundColor: Colors.amber
        
        ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: <Widget>[
            Text(
              'Bem-vindo à Aladdin Tapetes',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaSelecaoForma()),
                );
              },
              child: Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}