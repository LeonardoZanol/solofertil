import 'package:flutter/material.dart';

class MyCalcDensidadePage extends StatefulWidget {
  const MyCalcDensidadePage({super.key});

  @override
  _MyCalcDensidadePageState createState() => _MyCalcDensidadePageState();
}

class _MyCalcDensidadePageState extends State<MyCalcDensidadePage> {
  final TextEditingController _densidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo da Densidade do Solo',
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
          color: Colors.white, // Cor do ícone de voltar em branco
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
              controller: _densidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite a densidade do solo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularDensidade,
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

  void _calcularDensidade() {
    final densidadeValue = _densidadeController.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('Densidade do solo: $densidadeValue'),
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
