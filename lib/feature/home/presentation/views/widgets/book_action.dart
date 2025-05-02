import 'package:bookly_app_arch/core/functions/launch_url.dart';
import 'package:bookly_app_arch/feature/home/data/models/book_models/book_models.dart';
import 'package:bookly_app_arch/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModels});

  final BookModels bookModels;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            text: 'Free',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            textColor: Colors.black,
          )),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context,
                    url: bookModels.volumeInfo.previewLink);
              },
              backgroundColor: const Color(0xffEF8262),
              text: getText(bookModels),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModels bookModels) {
  if (bookModels.volumeInfo.previewLink != null) {
    return 'Preview';
  } else {
    return 'Not Avaliable';
  }
}
