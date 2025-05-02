import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<SimilarBookCubit,SimilarBookState>(
    //   builder: (context, state) {
    //     if(state is SimilarBookSuccess){
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        // itemCount: state.books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomBookImage(
            imageUrl: '',
            //state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
      ),
    );
    //   }else if (state is SimilarBookFailure)
    //   {
    //     return CustomErrorWidget(errMessage: state.errMessage);
    //   }else if (state is SimilarBookLoading)
    //   {
    //     return const CustomLoadingIndicator();
    //   }
    //   else {
    //     return Text(state.toString());
    //   }

    // },
    //);
  }
}
