import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Book.dart';
import '../widgets/book_title.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  Map<String, dynamic>? bookDetails;

  @override
  void initState() {
    super.initState();
    fetchBookDetails();
  }

  Future<void> fetchBookDetails() async {
    try {
      final response = await http
          .get(Uri.parse('https://7443-187-87-222-101.ngrok-free.app/api/users/books/${widget.book.id}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          bookDetails = data;
        });
      } else {
        // Exibir mensagem de erro ou tratar de acordo com a resposta da API
      }
    } catch (error) {
      // Exibir mensagem de erro ou tratar de acordo com a exceção
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Livro - ${widget.book.id}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${widget.book.titulo}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            if (widget.book.subTitulo != null &&
                widget.book.subTitulo.isNotEmpty)
              Text(
                'SubTítulo: ${widget.book.subTitulo}',
                style: TextStyle(fontSize: 16.0),
              ),
            Text(
              'ISBN: ${widget.book.isbn}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Ano: ${widget.book.ano}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Autor: ${widget.book.autor}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Editora: ${widget.book.editora}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Local: ${widget.book.local}',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
