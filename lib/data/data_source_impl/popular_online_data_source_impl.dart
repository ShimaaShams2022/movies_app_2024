import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/popular_online_data_source.dart';


@Injectable(as: PopularOnlineDataSource)
class PopularOnlineDataSourceImpl implements PopularOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  PopularOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getPopular() {
  return apiManager.loadPopularMovies();
  //dependency
  }

}