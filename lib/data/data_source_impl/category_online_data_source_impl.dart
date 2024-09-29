import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/data/api_model/api_manager.dart';

import 'package:movies_app_2024/domain/Result.dart';

import '../data_source/category_online_data_source.dart';


@Injectable(as: CategoryOnlineDataSource)

class CategoryOnlineDataSourceImpl implements CategoryOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  CategoryOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getCategory(String genresId) {
  return apiManager.loadCategoryMovies(genresId);
  //dependency
  }

}