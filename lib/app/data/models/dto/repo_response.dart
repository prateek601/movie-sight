import 'package:trending_movies/utils/helper/exception_handler.dart';

class RepoResponse<T> {
  final APIException? error;
  final T? data;

  RepoResponse({this.error, this.data});
}
