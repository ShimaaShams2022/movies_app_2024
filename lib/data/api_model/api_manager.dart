

import 'package:dio/dio.dart';
import 'package:movies_app_2024/data/Extentions.dart';
import 'package:movies_app_2024/data/api_model/popular_movies/popular_response.dart';

import '../../domain/Result.dart';
import 'ErrorResponse.dart';
import 'Results.dart';



class ApiManager{

  final dio=Dio();
  static  String baseUrl="https://api.themoviedb.org";
  static  String PopularMoviesEndpoint ="$baseUrl/3/movie/popular";

  Future<Result<List<Results>?>> loadPopularMovies()async{
    var response = await dio.get( PopularMoviesEndpoint);
    var popularResponse=PopularResponse.fromJson(response.data);

    try{
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: popularResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

}