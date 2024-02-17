import 'package:flutter/material.dart';
import 'dart:math';


void main() {runApp(MaterialApp(
	title: 'Navegação Básica',
	 theme: ThemeData(
	   primarySwatch: Colors.blue
         ),
         home: TelaInicial(),
      )
    );
}
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

class TelaInsercaoDimensoes extends StatefulWidget {
  final TipoTapete tipoTapete;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Aladdin Tapetes - ${widget.tipoTapete.formato}'),
        backgroundColor: Colors.amber
        ),
      
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
                decoration: InputDecoration(labelText: 'Largura (m)'),
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
                    double largura = double.parse(_larguraController.text);
                    double comprimento = double.parse(_comprimentoController.text);
                    double area = largura * comprimento;
                    double valor = area * widget.tipoTapete.valorM2;
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



class TelaOrcamento extends StatelessWidget {
  final double area;
  final double valor;

  TelaOrcamento(this.area, this.valor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aladdin Tapetes - Resultado'),
        backgroundColor: Colors.amber
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

