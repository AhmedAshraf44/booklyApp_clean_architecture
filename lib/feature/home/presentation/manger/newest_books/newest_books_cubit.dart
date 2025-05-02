import 'package:bookly_app_arch/feature/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());

  final FetchNewestBookUseCase fetchNewestBookUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await fetchNewestBookUseCase.call();
    result.fold(
      (failure) {
        return emit(
          NewestBooksFailure(failure.errorMessage),
        );
      },
      (books) {
        return emit(
          NewestBooksSuccess(books),
        );
      },
    );
  }
}
