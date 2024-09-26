import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/recommended_online_data_source.dart';



@Injectable(as: RecommendedOnlineDataSource)
class RecommendedOnlineDataSourceImpl implements RecommendedOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  RecommendedOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getRecommended() {
  return apiManager.loadPopularMovies();
  //dependency
  }

}