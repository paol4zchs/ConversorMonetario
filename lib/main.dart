import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas/Paola de Oliveira',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Conversor de Moedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double realValor = 0.0;
  double usdValor = 0.0;
  double eurValor = 0.0;

  void convertCurrency(double valor, String currency) {
    setState(() {
      switch (currency) {
        case 'BRL':
          realValor = valor;
          usdValor = valor/ 5.0;
          eurValor = valor / 6.0;
          break;
        case 'USD':
          usdValor = valor;
          realValor = valor * 5.0;
          eurValor = valor * 0.8;
          break;
        case 'EUR':
          eurValor = valor;
          realValor = valor * 6.0;
          usdValor = valor * 1.25;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe o valor em Reais (BRL):',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertCurrency(double.parse(value), 'BRL');
                }
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe o valor em Dólares (USD):',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertCurrency(double.parse(value), 'USD');
                }
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe o valor  em Euros (EUR):',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertCurrency(double.parse(value), 'EUR');
                }
              },
            ),
            const SizedBox(height: 20.0),
            Text('Valor em Reais (BRL): $realValor'),
            const SizedBox(height: 10.0),
            Text('Valor em Dólares (USD): $usdValor'),
            const SizedBox(height: 10.0),
            Text('Valor em Euros (EUR): $eurValor'),
          ],
        ),
      ),
    );
  }
}