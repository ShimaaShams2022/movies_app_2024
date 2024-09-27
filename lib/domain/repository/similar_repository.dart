import 'package:movies_app_2024/data/api_model/Results.dart';

import '../Result.dart';

abstract class SimilarRepository{
Future<Result<List<Results>?>> getSimilar(String id);
}