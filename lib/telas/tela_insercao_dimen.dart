import 'package:flutter/material.dart';
import 'package:projeto_aladdin/calculate/shape_calculate.dart';
import 'package:projeto_aladdin/main.dart';
import 'package:projeto_aladdin/model/tapete.dart';
import 'package:projeto_aladdin/telas/tela_orcamento.dart';

class TelaInsercaoDimensoes extends StatefulWidget {
  final Tapete tipoTapete;

  TelaInsercaoDimensoes(this.tipoTapete);

  @override
  _TelaInsercaoDimensoesState createState() => _TelaInsercaoDimensoesState();
}

class _TelaInsercaoDimensoesState extends State<TelaInsercaoDimensoes> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _larguraController = TextEditingController();
  TextEditingController _comprimentoController = TextEditingController();

  @override
  void dispose() {
    _larguraController.dispose();
    _comprimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isCircle = getShape(widget.tipoTapete.nome) == Shape.CIRCULO;
    return Scaffold(
      appBar: AppBar(
          title: Text('Aladdin Tapetes - ${widget.tipoTapete.nome}'),
          backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Insira as dimensões do tapete em metros:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _larguraController,
                decoration: InputDecoration(labelText: isCircle ? 'Raio' : 'Largura (m)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a largura.';
                  }
                  if (value.contains(',')) {
                    return 'Use "." (ponto) como separador decimal.';
                  }
                  return null;
                },
              ),
              if (!isCircle)
                TextFormField(
                  controller: _comprimentoController,
                  decoration: InputDecoration(labelText: 'Comprimento (m)'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o comprimento.';
                    }
                    if (value.contains(',')) {
                      return 'Use "." (ponto) como separador decimal.';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    double largura =
                        double.tryParse(_larguraController.text) ?? 0;
                    double comprimento =
                        double.tryParse(_comprimentoController.text) ?? 0;
                    double area = CalculadoraArea().getAreaFromShape(
                        widget.tipoTapete.nome, largura, comprimento);
                    double valor = area * widget.tipoTapete.valor_m2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaOrcamento(area, valor),
                      ),
                    );
                  }
                },
                child: Text('Calcular Orçamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
