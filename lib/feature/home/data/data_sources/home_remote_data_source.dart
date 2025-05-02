import 'package:bookly_app_arch/constants.dart';
import 'package:bookly_app_arch/core/functions/save_book_data.dart';
import 'package:bookly_app_arch/core/utils/api_service.dart';
import 'package:bookly_app_arch/feature/home/data/models/book_models/book_models.dart';
import 'package:bookly_app_arch/feature/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await _apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> bookList = getBookList(data);
    saveBooksData(bookList, kFeaturedBox);
    return bookList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    //q=computer science&
    var data = await _apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> bookList = getBookList(data);
    saveBooksData(bookList, kNewestBox);
    return bookList;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> bookList = [];
    for (var book in data['items']) {
      bookList.add(BookModels.fromJson(book));
    }
    return bookList;
  }
}
