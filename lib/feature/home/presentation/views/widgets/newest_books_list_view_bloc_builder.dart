import 'package:bookly_app_arch/core/widgets/custom_error_widget.dart';
import 'package:bookly_app_arch/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app_arch/feature/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errorMessage,
        );
      } else if (state is NewestBooksSuccess) {
        return NewestBooksListView(
          books: state.books,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
