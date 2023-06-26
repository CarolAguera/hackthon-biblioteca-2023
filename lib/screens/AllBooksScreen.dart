import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../book_data.dart';
import '../models/Book.dart';
import '../services/api_service.dart';
import '../widgets/book_title.dart';
import 'BookDetailsScreen.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  _AllBooksScreenState createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  void _getBooks() async {
    try {
      var result = await ApiService().getAllBooks();
      setState(() {
        books = result;
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro de Consulta'),
          content: const Text('Erro ao buscar livros'),
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
        itemCount: books.length,
        itemBuilder: (ctx, index) {
          final Book book = books[index];
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
