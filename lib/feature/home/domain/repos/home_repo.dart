import 'package:bookly_app_arch/core/errors/failure.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pagegNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
