import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String authorName;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num rating;

  BookEntity({
    required this.price,
    required this.rating,
    required this.title,
    required this.authorName,
    required this.imageUrl,
  });
}
