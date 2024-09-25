import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';


import 'package:movies_app_2024/domain/Result.dart';
import 'package:movies_app_2024/domain/repository/popular_repository.dart';

import '../data_source/popular_online_data_source.dart';

@Injectable(as: PopularRepository)
class PopularRepositoryImpl implements PopularRepository{
  PopularOnlineDataSource dataSource;
 @factoryMethod
  PopularRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getPopular(){
      return dataSource.getPopular();
  }

}