import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/search_online_data_source.dart';





@Injectable(as: SearchOnlineDataSource)

class SearchOnlineDataSourceImpl implements SearchOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  SearchOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getSearch(String id) {
  return apiManager.loadSearchMovies(id);
  //dependency
  }

}