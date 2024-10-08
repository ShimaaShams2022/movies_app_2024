import 'package:movies_app_2024/domain/Result.dart';

import '../api_model/Results.dart';

abstract class CategoryOnlineDataSource{
  Future<Result<List<Results>?>> getCategory(String genresId);
}