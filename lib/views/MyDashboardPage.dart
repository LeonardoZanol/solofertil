import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class MyDashboardPage extends StatefulWidget {
  const MyDashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  final TextEditingController _dateController = TextEditingController();

  final List<Map<String, dynamic>> _reports = [
    {
      'title': 'Relatório CTC',
      'CTC Total': '20 cmolc/kg',
      'Cálcio': '10 cmolc/kg',
      'Magnésio': '5 cmolc/kg',
      'Potássio': '2 cmolc/kg',
      'Sódio': '1 cmolc/kg',
      'H+Al': '2 cmolc/kg',
    },
    {
      'title': 'Ajuste de pH',
      'pH Atual': '5.2',
      'pH Ideal': '6.5',
      'Necessidade de Calcário': '2.5 t/ha',
    },
    {
      'title': 'Densidade do Solo',
      'Densidade Atual': '1.4 g/cm³',
      'Densidade Ideal': '1.2 g/cm³',
      'Compactação do Solo': 'Moderada',
    },
  ];

  String? _selectedReport;
  Map<String, dynamic>? _reportData;

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
          'Relatórios',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _createBody() {
    return Column(
      children: [
        _createFieldsDate(),
        _createReportDropdown(),
        _createButtonGenerate(),
        if (_reportData != null) _createReportDetails(),
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
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        readOnly: true,
        onTap: () {
          _selectDate();
        },
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Widget _createReportDropdown() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButton<String>(
        isExpanded: true,
        value: _selectedReport,
        hint: const Text("Selecione um relatório"),
        items: _reports.map((report) {
          return DropdownMenuItem<String>(
            value: report['title'],
            child: Text(report['title']),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedReport = newValue;
          });
        },
      ),
    );
  }

  Widget _createButtonGenerate() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: const Size(200, 30),
        ),
        onPressed: _selectedReport != null ? _generateReport : null,
        child: const Text(
          "Gerar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _generateReport() {
    setState(() {
      _reportData =
          _reports.firstWhere((report) => report['title'] == _selectedReport);
    });
  }

  Widget _createReportDetails() {
    final reportEntries = _reportData!.entries.where((entry) => entry.key != 'title').toList();

    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    _reportData!['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: reportEntries.length,
                    itemBuilder: (context, index) {
                      final entry = reportEntries[index];
                      return Container(
                        color: index.isEven ? Colors.grey[200] : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                entry.key,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                entry.value.toString(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: _downloadPdf,
              child: const Icon(Icons.download),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadPdf() async {
    // Código para gerar PDF...
  }
}