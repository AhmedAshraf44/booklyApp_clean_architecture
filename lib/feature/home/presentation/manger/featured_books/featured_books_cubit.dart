import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_featured_book_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBookUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await fetchFeaturedBookUseCase.call();
    result.fold(
      (failure) {
        return emit(
          FeaturedBooksFailure(failure.errorMessage),
        );
      },
      (books) {
        return emit(
          FeaturedBooksSuccess(books),
        );
      },
    );
  }
}
