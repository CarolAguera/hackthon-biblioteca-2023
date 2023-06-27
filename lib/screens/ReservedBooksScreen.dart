import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Book.dart';
import '../services/api_service.dart';
import '../widgets/book_title.dart';
import 'BookDetailsScreen.dart';

class ReservedBooksScreen extends StatefulWidget {
  const ReservedBooksScreen({super.key});

  @override
  _ReservedBooksScreenState createState() => _ReservedBooksScreenState();
}

class _ReservedBooksScreenState extends State<ReservedBooksScreen> {
  List<dynamic> reservedBooks = [];

  @override
  void initState() {
    super.initState();
    _fetchReservedBooks();
  }

  void _fetchReservedBooks() async {
    try {
      var result = await ApiService().getAllMyBooks();
      setState(() {
        reservedBooks = result;
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro ao buscar dados dos livros do estudante'),
          content: const Text('Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
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
        title: const Text('Todos os Livros'),
      ),
      body: ListView.builder(
        itemCount: reservedBooks.length,
        itemBuilder: (ctx, index) {
          final Book book = reservedBooks[index];
          return BookTitle(
            book: book,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
