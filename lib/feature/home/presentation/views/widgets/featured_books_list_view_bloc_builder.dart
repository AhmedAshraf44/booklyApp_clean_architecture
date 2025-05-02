import 'package:bookly_app_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_arch/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app_arch/feature/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/feature_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errorMessage,
        );
      } else if (state is FeaturedBooksSuccess) {
        return FeatureBooksListView(
          books: state.books,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
