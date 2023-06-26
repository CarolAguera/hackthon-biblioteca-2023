import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Book.dart';

class ApiService {
  static const String baseUrl =
      'https://7443-187-87-222-101.ngrok-free.app/api/users/books';

  Future<List<Book>> getAllBooks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var responseBody = response.body;
      var jsonData = json.decode(responseBody);
      List<Book> books = [];

      for (var bookData in jsonData) {
        var id = bookData['id'];
        var titulo = bookData['titulo'];
        var subTitulo = bookData['sub_titulo'];
        var isbn = bookData['isbn'];
        var local = bookData['local'];
        var ano = bookData['ano'];
        var autor = bookData['autor']['nome'];
        var editora = bookData['editora']['nome'];

        var book = Book(
          id: id,
          titulo: titulo,
          subTitulo: subTitulo,
          isbn: isbn,
          local: local,
          ano: ano,
          autor: autor,
          editora: editora,
        );

        books.add(book);
      }
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<dynamic> loginAluno(String ra, String senha) async {
    var url =
        Uri.parse('https://7443-187-87-222-101.ngrok-free.app/api/users/login');

    var response = await http.post(url,
        body: json.encode({
          "ra": 123456.toString(),
          "senha": "234234",
        }));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var token = responseData['token'];

      return token;
    } else {
      throw Exception('Falha no login');
    }
  }
}
