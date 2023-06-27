import 'dart:convert';
import 'package:hackthon_biblioteca_2023/models/Student.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Book.dart';

class ApiService {
  static const String baseUrl = 'https://7d19-187-87-222-101.ngrok-free.app';

  Future<List<Book>> getAllBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/api/users/books'));

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

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<dynamic> loginAluno(String ra, String senha) async {
    var url = Uri.parse('$baseUrl/api/users/login');

    var response = await http.post(url,
        body: json.encode({
          "ra": 123456.toString(),
          "senha": "234234",
        }));
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var token = responseData['token'];
      await saveToken(token);

      return token;
    } else {
      throw Exception('Falha no login');
    }
  }

  Future<dynamic> fetchStudentData() async {
    var url = Uri.parse('$baseUrl/api/users/meus-dados');
    var headers = {'Authorization': 'Bearer ${getToken()}'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
    } else {
      throw Exception('Falha no login');
    }
  }
}
