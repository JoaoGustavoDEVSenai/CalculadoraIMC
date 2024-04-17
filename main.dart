import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _peso = 0;
  double _altura = 0;

  // Variável para armazenar o resultado das operações
  double _result = 0;

  String _imcResult = '';

  // Função para somar os valores dos operandos
  void _imc() {
    setState(() {
      _altura = _altura / 100;
      _result = _peso / (_altura * _altura);

      if (_result < 18.5) {
        _imcResult = 'Você está Abaixo do peso';
      } else if (_result > 18.5 && _result < 24.9) {
        _imcResult = 'Você está no Peso normal';
      } else if (_result > 25 && _result < 29.9) {
        _imcResult = 'Você está Acima do peso';
      } else if (_result > 30 && _result < 34.9) {
        _imcResult = 'Você tem Obesidade 1';
      } else if (_result > 35 && _result < 39.9) {
        _imcResult = 'Você tem Obesidade 2';
      } else {
        _imcResult = 'Você tem Obesidade 3';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite seu peso(kg)'),
              onChanged: (value) {
                _peso = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite a sua altura(cm)'),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Botões para realizar as operações
            ElevatedButton(
              onPressed: _imc,
              child: Text('Calcular imc'),
            ),
            Text(
              'Resultado: ${_result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_imcResult',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
