import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'AllBooksScreen.dart';
import 'BookDetailsScreen.dart';

class ReservedBooksScreen extends StatefulWidget {
  final String studentId;

  const ReservedBooksScreen({required this.studentId});

  @override
  _ReservedBooksScreenState createState() => _ReservedBooksScreenState();
}

class _ReservedBooksScreenState extends State<ReservedBooksScreen> {
  List<dynamic> reservedBooks = [];

  @override
  void initState() {
    super.initState();
    fetchReservedBooks();
  }

  Future<void> fetchReservedBooks() async {
    final response = await http.get(
      Uri.parse(
          'https://7443-187-87-222-101.ngrok-free.app/api/users/meus-livros'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      setState(() {
        reservedBooks = data['livros_reservados'];
      });
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Erro'),
          content: Text('Falha ao obter a lista de livros reservados.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros Reservados'),
      ),
      body: ListView.builder(
        itemCount: reservedBooks.length,
        itemBuilder: (ctx, index) {
          final book = reservedBooks[index];

          return ListTile(
            title: Text(book['titulo']),
            subtitle: Text(book['autor']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => BookDetailsScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
