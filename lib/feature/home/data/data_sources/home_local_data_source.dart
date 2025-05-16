import 'package:bookly_app_arch/constants.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pagegNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pagegNumber = 0}) {
    var startIndex = pagegNumber * 10;
    var endIndex = (pagegNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    var lengthHive = box.values.toList().length;
    if (startIndex >= lengthHive || endIndex > lengthHive) {
      return [];
    }
    box.values.toList().sublist(startIndex, endIndex);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
