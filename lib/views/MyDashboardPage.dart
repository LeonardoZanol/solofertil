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
      "title": "Ajuste o pH",
      "pH Atual": 5.2,
      "pH Ideal": 6.5,
      "Quantidade de Calcário": "2.5 t/ha"
    },
    {
      "title": "Fertilidade do Solo",
      "Potássio Atual": "0.15 cmolc/kg",
      "Potássio Ideal": "0.35 cmolc/kg",
      "Quantidade de K2o": "50 kg/ha"
    },
    {
      "title": "Drenagem",
      "infiltracao_atual": "10 mm/h",
      "infiltracao_ideal": "25 mm/h",
      "melhoria_drenagem": "Adição de 30% de areia ao solo"
    },
    {
      "title": "Rotações de Cultura",
      "cultura_atual": "Milho",
      "proxima_cultura": "Soja",
      "beneficio_esperado": "Redução de 20% em incidência de pragas"
    },
    {
      "title": "Controle de Pragas",
      "praga_identificada": "Lagarta-do-cartucho",
      "metodo_controle": "Aplicação de Bacillus thuringiensis",
      "eficacia": "80% de controle esperado"
    },
    {
      "title": "Matéria Orgânica",
      "materia_organica_atual": "2.0%",
      "materia_organica_ideal": "3.5%",
      "quantidade_composto": "10 t/ha"
    }
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
                    _reportData!['title'], // Mostra o título acima da tabela
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Tabela de detalhes
                Expanded(
                  child: ListView.builder(
                    itemCount: reportEntries.length,
                    itemBuilder: (context, index) {
                      final entry = reportEntries[index];
                      return Container(
                        color: index.isEven ? Colors.grey[200] : Colors.white, // Efeito zebrado
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
    final pdf = pw.Document();
    final reportEntries = _reportData!.entries.where((entry) => entry.key != 'title').toList();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              _reportData!['title'],
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey),
              children: [
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(
                        'Propriedade',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(
                        'Valor',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...reportEntries.map(
                  (entry) => pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(entry.key),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(entry.value.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      print('Diretório encontrado: ${directory.path}');

      final sanitizedTitle = _reportData!['title'].replaceAll(RegExp(r'[\/:*?"<>|]'), '');
      
      final file = File('${directory.path}/$sanitizedTitle.pdf');

      if (!(await directory.exists())) {
        await directory.create(recursive: true);
        print('Diretório criado: ${directory.path}');
      }


      await file.writeAsBytes(await pdf.save());
      print('PDF salvo com sucesso em: ${file.path}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF salvo em ${file.path}'),
          ),
        );
      }
    } catch (e) {
      print('Erro ao salvar o PDF: $e');

      // Notificação de erro
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao salvar o PDF'),
          ),
        );
      }
    }
  }

}