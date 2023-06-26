import 'package:flutter/material.dart';

import '../models/Book.dart';

class BookTitle extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookTitle({super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print(book);
    return ListTile(
      title: Text(book.titulo),
      subtitle: book.subTitulo.isNotEmpty
          ? Text('Subtítulo: ${book.subTitulo}')
          : null,
      onTap: onTap,
    );
  }
}
