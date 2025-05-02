import 'package:bookly_app_arch/feature/home/data/models/book_models/book_models.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/custom_book_detail_app_bar.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModels});

  final BookModels bookModels;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModels: bookModels),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBookSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
