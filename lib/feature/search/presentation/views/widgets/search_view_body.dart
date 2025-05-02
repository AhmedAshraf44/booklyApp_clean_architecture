import 'package:bookly_app_arch/feature/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app_arch/feature/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  // String? bookName;
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks(bookName: bookName);
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 30),
    //   child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
    //     builder: (context, state) {
    //       if (state is SearchBooksSuccess) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Search Result',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 16,
        ),
        const Expanded(child: SearchResultListView()),
      ],
    );
    //       } else if (state is SearchBooksFailure) {
    //         return CustomErrorWidget(errMessage: state.errMessage);
    //       } else {
    //         return const CustomLoadingIndicator();
    //       }
    //     },
    //   ),
    // );
  }
}
