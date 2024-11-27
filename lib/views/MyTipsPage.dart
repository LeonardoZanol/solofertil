import 'package:flutter/material.dart';
import 'package:solofertil/views/MyTipCard.dart';

class MyTipsPage extends StatefulWidget {
  const MyTipsPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyTipsPageState();

}

class _MyTipsPageState extends State<MyTipsPage> {
  final List<Map<String, String>> tips = [
    {
      "title": "Ajuste o pH",
      "description": "Aprenda a corrigir o pH do solo.",
      "details": "Use calcário para neutralizar solos ácidos e melhorar a produtividade.",
    },
    {
      "title": "Fertilidade do Solo",
      "description": "Melhore a nutrição do solo.",
      "details": "Aumente os níveis de potássio para ajudar no desenvolvimento das plantas.",
    },
    {
      "title": "Drenagem",
      "description": "Evite encharcamento do solo.",
      "details": "Garanta que seu solo tenha boa drenagem para prevenir problemas.",
    },
    {
      "title": "Rotações de Cultura",
      "description": "Melhore a saúde do solo.",
      "details": "Alterar as culturas evita pragas e mantém a qualidade do solo.",
    },
    {
      "title": "Controle de Pragas",
      "description": "Proteja sua lavoura.",
      "details": "Identifique e elimine pragas de maneira sustentável para minimizar danos às plantas.",
    },
    {
      "title": "Matéria Orgânica",
      "description": "Fortaleça o solo com matéria orgânica.",
      "details": "Adicione compostos orgânicos ao solo para melhorar sua estrutura e retenção de água.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Text('Guia e Dicas', style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          )),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _createBody() {
    return Column(
      children: [
        _createCards(),
        _createButtonUrl()
      ],
    );
  }

  Widget _createCards() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ), 
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return MyTipCard(
            title: tips[index]["title"]!,
            description: tips[index]["description"]!,
            details: tips[index]["details"]!,
          );
        }, 
      )
    );
  }

  Widget _createButtonUrl() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary
        ),
        onPressed: () {
          
        }, 
        child: const Text("Saiba Mais", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )),
      ),
    );
  }
}