import 'package:flutter/material.dart';
import 'package:projeto_aladdin/main.dart';

class TelaSelecaoForma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aladdin Tapetes', style: TextStyle(fontSize: 22)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A6D92),
        elevation: 0,
        toolbarHeight: 72,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
    ),
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