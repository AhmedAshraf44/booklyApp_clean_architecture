import 'package:bookly_app_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_arch/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/feature_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/build_snackbar_failure.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationFailure) {
        buildSnackBarFailure(context, state.errorMessage);
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
        return FeatureBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errorMessage,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
