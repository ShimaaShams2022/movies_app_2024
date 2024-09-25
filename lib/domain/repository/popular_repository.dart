import 'package:movies_app_2024/data/api_model/Results.dart';

import '../Result.dart';

abstract class PopularRepository{
Future<Result<List<Results>?>> getPopular();
}