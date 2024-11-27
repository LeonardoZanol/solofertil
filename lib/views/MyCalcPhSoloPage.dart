import 'package:flutter/material.dart';

class MyCalcPhSoloPage extends StatefulWidget {
  const MyCalcPhSoloPage({super.key});

  @override
  _MyCalcPhSoloPageState createState() => _MyCalcPhSoloPageState();
}

class _MyCalcPhSoloPageState extends State<MyCalcPhSoloPage> {
  final TextEditingController _phController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo do pH do Solo',
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
        iconTheme: const IconThemeData(color: Colors.white), // Define a cor do ícone como branco
        titleSpacing: 0, // Ajusta o espaçamento do título para ficar mais à esquerda
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o pH do solo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPh,
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
                minimumSize: const Size(100, 50), // Ajuste do tamanho mínimo do botão
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _calcularPh() {
    final phValue = _phController.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('pH do solo: $phValue'),
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
