import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/movie_details/MovieDetailsResponse.dart';


import 'package:movies_app_2024/domain/Result.dart';

import '../../domain/repository/movie_details_repository.dart';
import '../data_source/movie_details_online_data_source.dart';




@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository{
  MovieDetailsOnlineDataSource dataSource;
 @factoryMethod
 MovieDetailsRepositoryImpl(this.dataSource);

  @override
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id){

      return dataSource.getMovieDetails(id);
  }

}