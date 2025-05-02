import 'package:bookly_app_arch/core/errors/failure.dart';
import 'package:bookly_app_arch/core/use_cases/use_case.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase(this.homeRepo);

  // Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
  //   return await homeRepo.fetchFeaturedBooks();
  // }
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
