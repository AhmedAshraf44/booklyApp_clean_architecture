import 'package:bookly_app_arch/feature/home/presentation/views/home_view.dart';
import 'package:bookly_app_arch/feature/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBookCubit(getIt.get<HomeRepoImpl>()),
      //     child: BookDetailsView(bookModels: state.extra as BookModels),
      //   ),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
      //     child: const SearchView(),
      //   ),
      // ),
    ],
  );
}
