import 'package:bookly_app_arch/constants.dart';
import 'package:bookly_app_arch/core/utils/app_router.dart';
import 'package:bookly_app_arch/core/utils/service_locator.dart';
import 'package:bookly_app_arch/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app_arch/feature/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_arch/feature/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:bookly_app_arch/feature/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly_app_arch/feature/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'feature/home/domain/use_cases/fetch_newest_book_use_case.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBookUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBookUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
