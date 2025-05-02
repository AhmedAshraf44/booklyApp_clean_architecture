import 'package:bookly_app_arch/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_arch/feature/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'featured_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        //SliverFillRemaining(
        SliverToBoxAdapter(
          //hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
