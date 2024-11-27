import 'package:flutter/material.dart';
import 'package:solofertil/views/MyCalcCtcPage.dart';
import 'package:solofertil/views/MyCalcDensidadePage.dart';
import 'package:solofertil/views/MyCalcPhSoloPage.dart';

class MyCalculatorPage extends StatefulWidget {
  const MyCalculatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<MyCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          'Calculadora',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _createBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Occupy full width
        children: [
          _buildOptionCard('pH do Solo', 'Calcule o pH do solo com base nos valores informados.', const MyCalcPhSoloPage()),
          const SizedBox(height: 16), // Espaço entre os cards
          _buildOptionCard('Capacidade de Troca Catiônica (CTC)', 'Calcule a CTC para análise do solo.', const MyCalcCtcPage()),
          const SizedBox(height: 16), // Espaço entre os cards
          _buildOptionCard('Densidade do Solo', 'Calcule a densidade do solo com os dados fornecidos.', const MyCalcDensidadePage()),
        ],
      ),
    );
  }

  Widget _buildOptionCard(String title, String description, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
