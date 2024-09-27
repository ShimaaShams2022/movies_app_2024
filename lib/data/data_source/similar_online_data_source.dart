import 'package:movies_app_2024/domain/Result.dart';

import '../api_model/Results.dart';

abstract class SimilarOnlineDataSource{
  Future<Result<List<Results>?>> getSimilar(String id);
}