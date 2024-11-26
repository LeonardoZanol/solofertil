import 'package:flutter/material.dart';
import 'package:solofertil/core/constants.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _createHeaderImage(),
          _createFieldsRegister()
        ],
      ),
    );
  }

  Widget _createHeaderImage() {
    return Expanded(
      flex: 50,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/solofertillogo.png',
                width: 200,
                height: 200,
              ),
              const Text('Registro', style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ))
            ]
          )
        )
      )
    );
  }

  Widget _createFieldsRegister() {
    return Expanded(
      flex: 50,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _createTextField(LABEL_USER, false),
              const SizedBox(height: 15),
              _createTextField(LABEL_PASSWD, true),
              const SizedBox(height: 15),
              _createTextField('Confirme a Senha', true),
              const SizedBox(height: 15),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size(200, 60),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cadastrar')
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTextField(String label, bool obscureText) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      label: Text(label),
      border: const OutlineInputBorder()
    ),
  );
}
}