import 'package:flutter/material.dart';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {

  TextEditingController _dateController = TextEditingController();

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
        child: Text('Relatórios', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _createBody() {
    return Column(
      children: [
        _createFieldsDate(),
        _createButtonGenerate()
      ],
    );
  }

  Widget _createFieldsDate() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _createFieldDate('Data Inicial'),
          const SizedBox(width: 10),
          _createFieldDate('Data Final'),
        ],
      ),
    );
  }

  Widget _createFieldDate(String label) {
    return Expanded(
      child: TextField(
        controller: _dateController,
        decoration: InputDecoration(
          label: Text(label),
          filled: true,
          prefixIcon: const Icon(Icons.calendar_today),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary 
            )
          )
        ),
        readOnly: true,
        onTap: () {
          _selectDate();
        },
      )
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Widget _createButtonGenerate() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary
        ),
        onPressed: () {
          
        }, 
        child: const Text("Gerar", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )),
      ),
    );
  }
}