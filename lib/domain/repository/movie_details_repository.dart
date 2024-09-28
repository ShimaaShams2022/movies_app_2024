
import 'package:movies_app_2024/data/api_model/movie_details/MovieDetailsResponse.dart';

import '../Result.dart';

abstract class MovieDetailsRepository{
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id);
}