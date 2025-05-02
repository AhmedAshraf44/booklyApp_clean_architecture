import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              // GoRouter.of(context)
              //     .push(AppRouter.kBookDetailsView, extra: state.books[index],);
            },
            child: CustomBookImage(
              imageUrl: books[index].imageUrl ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
