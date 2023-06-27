import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Student.dart';
import '../services/api_service.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  late Student studentData;


  @override
  void initState() {
    super.initState();
    _dadosUser();
  }

  void _dadosUser() async {
    try {
      var result = await ApiService().fetchStudentData();
      setState(() {
        studentData = result;
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro ao buscar dados de estudante'),
          content:
              const Text('Por favor, tente novamente.'),
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
        title: const Text('Perfil do Aluno'),
      ),
      body: studentData != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome: ${studentData.nome}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('RA: ${studentData.ra}'),
                  const SizedBox(height: 8),
                  Text('Curso: ${studentData.curso}'),
                  const SizedBox(height: 8),
                  Text('Endereço: ${studentData.endereco}'),
                  const SizedBox(height: 8),
                  Text('Cidade: ${studentData.cidade}'),
                  const SizedBox(height: 8),
                  Text('Estado: ${studentData.estado}'),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
