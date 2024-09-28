import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';
import 'package:movies_app_2024/data/api_model/movie_details/MovieDetailsResponse.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/movie_details_online_data_source.dart';



@Injectable(as: MovieDetailsOnlineDataSource)
class MovieDetailsOnlineDataSourceImpl implements MovieDetailsOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  MovieDetailsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id) {
  return apiManager.loadMovieDetails(id);
  //dependency
  }

}