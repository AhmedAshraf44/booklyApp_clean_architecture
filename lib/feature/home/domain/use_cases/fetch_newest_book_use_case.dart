import 'package:bookly_app_arch/core/errors/failure.dart';
import 'package:bookly_app_arch/core/use_cases/use_case.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBookUseCase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;

  FetchNewestBookUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) async {
    var books = await homeRepo.fetchNewestBooks();
    return books;
  }
}
