import 'package:movies_app_2024/domain/Result.dart';

import '../api_model/Results.dart';

abstract class PopularOnlineDataSource{
  Future<Result<List<Results>?>> getPopular();
}