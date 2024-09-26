import 'package:movies_app_2024/data/api_model/Results.dart';

import '../Result.dart';

abstract class RecommendedRepository{
Future<Result<List<Results>?>> getRecommended();
}