import 'package:bookly_app_arch/core/utils/api_service.dart';
import 'package:bookly_app_arch/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_arch/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_arch/feature/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  // getIt.registerSingleton<SearchRepoImpl>(
  //   SearchRepoImpl(
  //     getIt.get<ApiService>(),
  //   ),
  // );
}
