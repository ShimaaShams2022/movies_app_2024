import 'package:movies_app_2024/data/api_model/Genres.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';

import '../Result.dart';

abstract class GenresRepository{
Future<Result<Genres>?> getGenres();
}