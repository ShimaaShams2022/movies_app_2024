import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/similar_online_data_source.dart';




@Injectable(as: SimilarOnlineDataSource)
class SimilarOnlineDataSourceImpl implements SimilarOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  SimilarOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getSimilar(String id) {
  return apiManager.loadSimilarMovies(id);
  //dependency
  }

}