import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(background: const Color.fromARGB(255, 0, 0, 0)),
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

  // Variável para armazenar o resultado do IMC
  double _result = 0;

  String _tabela = '';

  // Função para calcular o IMC
  void _calcularIMC() {
    setState(() {
      _result = (_peso / (_altura * _altura)) * 10000;

      if (_result < 18.5) {
        _tabela = 'Você está muito magro';
      } else if (_result > 16 && _result < 16.9) {
        _tabela = 'Você está com uma magreza moderada';
      } else if (_result > 17 && _result < 18.5) {
        _tabela = 'Você está magro, mas de forma leve';
      } else if (_result > 18.6 && _result < 24.9) {
        _tabela = 'Você está magro, mas de forma leve';
      } else if (_result > 25 && _result < 29.9) {
        _tabela = 'Sobrepeso';
      } else if (_result > 30 && _result < 34.9) {
        _tabela = 'Obesidade grau 1, comece a prestar atenção';
      } else if (_result > 35 && _result < 39.9) {
        _tabela = 'Obesidade grau 2, precisa começar a emgracer ';
      } else {
        _tabela = 'Bora fazer uma cirurgia?';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC:'),
        titleTextStyle: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 193, 7)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Campo de entrada para o peso
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (Kg):',
                  labelStyle: TextStyle(color: Colors.amber),
                  hintStyle: TextStyle(color: Colors.amber),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .amber), // Cor da linha inferior quando o campo não está focado
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 255, 0)),
              onChanged: (value) {
                _peso = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (Kg):',
                  labelStyle: TextStyle(color: Colors.amber),
                  hintStyle: TextStyle(color: Colors.amber),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .amber), // Cor da linha inferior quando o campo não está focado
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 255, 0)),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),

            // Botão para calcular o IMC
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),

            SizedBox(height: 2.0),
            Center(),
            Text(
              'Resultado: ${_result.toStringAsFixed(1)}',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 28, 255, 7)),
            ),
            Text(
              _tabela,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 28, 255, 7)),
            )
          ],
        ),
      ),
    );
  }
}
