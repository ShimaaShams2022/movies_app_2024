import 'package:movies_app_2024/data/api_model/Results.dart';

import '../Result.dart';

abstract class SearchRepository{
Future<Result<List<Results>?>> getSearch(String query);
}