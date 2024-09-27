import 'package:injectable/injectable.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';


import 'package:movies_app_2024/domain/Result.dart';

import '../../domain/repository/similar_repository.dart';
import '../data_source/similar_online_data_source.dart';


@Injectable(as: SimilarRepository)
class SimilarRepositoryImpl implements SimilarRepository{
  SimilarOnlineDataSource dataSource;
 @factoryMethod
 SimilarRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getSimilar(String id){
      return dataSource.getSimilar(id);
  }

}