

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
    dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
    var response = await dio.get( PopularMoviesEndpoint);
    var popularResponse=PopularResponse.fromJson(response.data);
    print(response.data);

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