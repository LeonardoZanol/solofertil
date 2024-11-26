import 'package:flutter/material.dart';
import 'package:solofertil/core/constants.dart';
import 'package:solofertil/views/MyCalculatorPage.dart';
import 'package:solofertil/views/MyGlossaryPage.dart';
import 'package:solofertil/views/MyTipsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _itemselected = 0;

  void _onItemTapped(int index) {
    if (_itemselected == index) {
      return;
    }

    setState(() {
      _itemselected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
      bottomNavigationBar: _bottomNavigator(),
    );
  }

Widget _createBody() {
  return Column(
    children: [
      _createHeader(),
      _indexStack(),
    ],
  );
}

  Widget _createHeader() {
    return Expanded(
      flex: 3,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/solofertillogo.png',
                  width: 150,
                  height: 150,
                ),
                const Text(TITLE, style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0
                ))
              ],
            ),
          ),
        ) 
      )
    );
  }

  Widget _indexStack() {
    return Expanded(
      child: IndexedStack(
        index: _itemselected,
        children: const <Widget>[
          SizedBox.shrink(),
          MyCalculatorPage(),
          MyTipsPage(),
          MyGlossaryPage()
        ],
      ) 
    );
  }

  Widget _bottomNavigator() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _itemselected,
      onTap: _onItemTapped,
      backgroundColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.white, 
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'Calculadora'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
          label: 'Dicas'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Glossário'
        ),
      ],
    );
  }
}