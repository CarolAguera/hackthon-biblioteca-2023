import 'models/Book.dart';

List<Book> convertBookDataList(List<dynamic> bookDataList) {
  return bookDataList
      .map((bookData) => Book(
            id: bookData['id'],
            titulo: bookData['titulo'],
            subTitulo: bookData['sub_titulo'],
            isbn: bookData['isbn'],
            autor: bookData['autor'],
            editora: bookData['editora'],
            local: bookData['local'],
            ano: bookData['ano'],
          ))
      .toList();
}
