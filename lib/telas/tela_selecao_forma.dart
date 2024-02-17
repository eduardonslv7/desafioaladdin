import 'package:flutter/material.dart';
import 'package:projeto_aladdin/main.dart';
import 'package:projeto_aladdin/telas/tela_insercao_dimen.dart';

class TelaSelecaoForma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aladdin Tapetes'),
        backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Formatos disponíveis e seus respectivos preços por metro quadrado:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            for (var tipo in tiposTapete)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('${tipo.formato} - R\$ ${tipo.valorM2.toStringAsFixed(2)}'),
                leading: const Icon(Icons.double_arrow),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaInsercaoDimensoes(tipo),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}