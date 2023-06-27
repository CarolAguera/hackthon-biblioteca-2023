class Student {
  final int id;
  final int ra;
  final String nome;
  final String endereco;
  final String cidade;
  final String estado;
  final int telefone;
  final Course curso;

  Student({
    required this.id,
    required this.ra,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.estado,
    required this.telefone,
    required this.curso,
  });
}

class Course {
  final String nome;

  Course({required this.nome});
}
