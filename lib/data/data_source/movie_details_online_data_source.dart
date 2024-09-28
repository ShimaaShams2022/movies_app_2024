import 'package:movies_app_2024/data/api_model/movie_details/MovieDetailsResponse.dart';
import 'package:movies_app_2024/domain/Result.dart';

import '../api_model/Results.dart';

abstract class MovieDetailsOnlineDataSource{
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id);
}