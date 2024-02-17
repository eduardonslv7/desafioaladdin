import 'package:flutter/material.dart';
import 'package:projeto_aladdin/model/tapete.dart';
import 'package:projeto_aladdin/service/tapete_service.dart';
import 'package:projeto_aladdin/telas/tela_insercao_dimen.dart';

class TelaSelecaoForma extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TelaSelecaoFormaState();
}

class TelaSelecaoFormaState extends State<TelaSelecaoForma> {
  final TapeteService service = TapeteService();
  List<Tapete> tapetes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getTapetes();
  }

  void getTapetes() async {
    final result = await service.getTapetes();
    setState(() {
      tapetes = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Aladdin Tapetes'), backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading ? Center(child: CircularProgressIndicator()) :
         Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Formatos disponíveis e seus respectivos preços por metro quadrado:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            for (var tipo in tapetes)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                    '${tipo.nome} - R\$ ${tipo.valor_m2.toStringAsFixed(2)}'),
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
