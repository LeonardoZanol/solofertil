import 'package:flutter/material.dart';
import 'package:solofertil/core/constants.dart';

class MyForgotPasswordPage extends StatefulWidget {
  const MyForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyForgotPasswordPageState();
}

class _MyForgotPasswordPageState extends State<MyForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _createHeader(),
          _createFields()
        ],
      ),
    );
  }

  Widget _createHeader() {
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
                height: 200
              ),
               const Text('Recuperação de Senha', style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _createFields() {
    return Expanded(
      flex: 50,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
          children: [
            _createTextField(LABEL_PASSWD, true),
            const SizedBox(height: 15),
            _createTextField('Confirme sua Senha', true),
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
                child: const Text('Confirmar')
              )
            ]
          ),
        )
      ) 
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