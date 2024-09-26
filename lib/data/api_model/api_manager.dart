

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Extensions.dart';
import 'package:movies_app_2024/data/api_model/popular_movies/popular_response.dart';
import 'package:movies_app_2024/data/api_model/recommended/RecommendedResponse.dart';

import '../../domain/Result.dart';
import 'ErrorResponse.dart';
import 'Results.dart';
import 'new_releases/NewReleasesResponse.dart';


@singleton
class ApiManager{

  final dio=Dio();

  static  String baseUrl="https://api.themoviedb.org";
  static  String PopularMoviesEndpoint ="$baseUrl/3/movie/popular";
  static  String NewReleasesMoviesEndpoint ="$baseUrl/3/movie/upcoming";
  static  String RecommendedMoviesEndpoint ="$baseUrl/3/movie/top_rated";


  Future<Result<List<Results>?>> loadPopularMovies()async{
    try{

    dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
    var response = await dio.get( PopularMoviesEndpoint);
    var popularResponse=PopularResponse.fromJson(response.data);
    if(response.statusCode?.isSuccessCall()==true){
        return Success(data: popularResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadNewReleasesMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( NewReleasesMoviesEndpoint);
      var newReleasesResponse=NewReleasesResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: newReleasesResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadRecommendedMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( RecommendedMoviesEndpoint);
      var recommendedResponse=RecommendedResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: recommendedResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

}