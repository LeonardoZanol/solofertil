import 'package:flutter/material.dart';
import 'package:solofertil/core/constants.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyLoginPageState();

}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return Column(
      children: [
        _createImageHeader(),
        _createContainerLogin(),
      ],
    );
  }

  Widget _createImageHeader() {
    return Expanded(
      flex: 5,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Image.asset(
            'assets/images/solofertillogo.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }

  Widget _createContainerLogin() {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _createTextField(LABEL_USER, false),
              const SizedBox(height: 15),
              _createTextField(LABEL_PASSWD, true),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Cadastrar-me', style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline
                    )),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotpasswd');
                    },
                    child: const Text('Esqueceu a Senha?', style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                    )),
                  )
                ],
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size(200, 60),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text(LABEL_BUTTON_LOGIN)
              )
            ],
          ),
        ),
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