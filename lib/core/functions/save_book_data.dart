import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> bookList, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(bookList);
}
