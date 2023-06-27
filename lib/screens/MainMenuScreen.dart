import 'package:flutter/material.dart';
import 'package:hackthon_biblioteca_2023/screens/AllBooksScreen.dart';
import 'package:hackthon_biblioteca_2023/screens/StudentProfileScreen.dart';

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
            // SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => StudentBooksScreen(token: token),
            //       ),
            //     );
            //   },
            //   child: Text('Ver Livros do Aluno Logado'),
            // ),
            const SizedBox(height: 16),
            ElevatedButton(
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
