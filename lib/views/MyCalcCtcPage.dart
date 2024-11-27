import 'package:flutter/material.dart';

class MyCalcCtcPage extends StatefulWidget {
  const MyCalcCtcPage({super.key});

  @override
  _MyCalcCtcPageState createState() => _MyCalcCtcPageState();
}

class _MyCalcCtcPageState extends State<MyCalcCtcPage> {
  final TextEditingController _ctcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo da CTC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: true, // Ícone de voltar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,  // Cor do ícone de voltar em branco
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white), // Cor do ícone branco
        titleSpacing: 0, // Ajusta o título à esquerda
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _ctcController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a CTC do solo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularCtc,
              child: const Text(
                'Calcular',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
                minimumSize: const Size(100, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calcularCtc() {
    final ctcValue = _ctcController.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('CTC do solo: $ctcValue'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
