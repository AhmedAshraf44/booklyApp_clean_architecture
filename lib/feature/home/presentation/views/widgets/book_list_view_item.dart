import 'package:bookly_app_arch/constants.dart';
import 'package:bookly_app_arch/feature/home/data/models/book_models/book_models.dart';
import 'package:bookly_app_arch/core/utils/app_router.dart';
import 'package:bookly_app_arch/core/utils/styles.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: book.imageUrl ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kaGTSectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.authorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14
                        .copyWith(color: const Color(0xffADACB2)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        count: 0,
                        rating: book.rating,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
