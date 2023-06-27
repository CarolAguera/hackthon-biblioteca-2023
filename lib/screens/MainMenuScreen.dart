import 'package:flutter/material.dart';
import 'package:hackthon_biblioteca_2023/screens/AllBooksScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/StudentProfileScreen.dart';

import 'ReservedBooksScreen.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.orange),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentProfileScreen(),
                  ),
                );
              },
              child: const Text('Ver Dados do Aluno Logado'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservedBooksScreen(),
                  ),
                );
              },
              child: Text('Ver Livros do Aluno Logado'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllBooksScreen(),
                  ),
                );
              },
              child: const Text('Ver Livros da Biblioteca'),
            ),
          ],
        ),
      ),
    );
  }
}
