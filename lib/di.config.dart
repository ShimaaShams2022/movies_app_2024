// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api_model/api_manager.dart' as _i235;
import 'data/data_source/new_releases_online_data_source.dart' as _i827;
import 'data/data_source/popular_online_data_source.dart' as _i392;
import 'data/data_source/recommended_online_data_source.dart' as _i1042;
import 'data/data_source/search_online_data_source.dart' as _i302;
import 'data/data_source/similar_online_data_source.dart' as _i431;
import 'data/data_source_impl/new_releases_data_source_impl.dart' as _i771;
import 'data/data_source_impl/popular_online_data_source_impl.dart' as _i975;
import 'data/data_source_impl/recommended_online_data_source_impl.dart'
    as _i1060;
import 'data/data_source_impl/search_online_data_source_impl.dart' as _i771;
import 'data/data_source_impl/similar_online_data_source_impl.dart' as _i521;
import 'data/repository/new_releases_repository_impl.dart' as _i152;
import 'data/repository/popular_repository_impl.dart' as _i202;
import 'data/repository/recommended_repository_impl.dart' as _i461;
import 'data/repository/search_repository_impl.dart' as _i153;
import 'data/repository/similar_repository_impl.dart' as _i716;
import 'domain/repository/new_releases_repository.dart' as _i405;
import 'domain/repository/popular_repository.dart' as _i742;
import 'domain/repository/Recommended_repository.dart' as _i8;
import 'domain/repository/search_repository.dart' as _i38;
import 'domain/repository/similar_repository.dart' as _i63;
import 'presentation/home/home_view_models/new_releases_view_model.dart'
    as _i755;
import 'presentation/home/home_view_models/popular_view_model.dart' as _i239;
import 'presentation/home/home_view_models/recommended_view_model.dart'
    as _i688;
import 'presentation/movie_details/similar_view_model.dart' as _i289;
import 'presentation/search_screen/search_view_model.dart' as _i532;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i235.ApiManager>(() => _i235.ApiManager());
    gh.factory<_i431.SimilarOnlineDataSource>(
        () => _i521.SimilarOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i392.PopularOnlineDataSource>(
        () => _i975.PopularOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i1042.RecommendedOnlineDataSource>(
        () => _i1060.RecommendedOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i827.NewReleasesOnlineDataSource>(
        () => _i771.NewReleasesOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i8.RecommendedRepository>(() => _i461.RecommendedRepositoryImpl(
        gh<_i1042.RecommendedOnlineDataSource>()));
    gh.factory<_i302.SearchOnlineDataSource>(
        () => _i771.SearchOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i405.NewReleasesRepository>(() =>
        _i152.NewReleasesRepositoryImpl(
            gh<_i827.NewReleasesOnlineDataSource>()));
    gh.factory<_i688.RecommendedViewModel>(
        () => _i688.RecommendedViewModel(gh<_i8.RecommendedRepository>()));
    gh.factory<_i742.PopularRepository>(
        () => _i202.PopularRepositoryImpl(gh<_i392.PopularOnlineDataSource>()));
    gh.factory<_i38.SearchRepository>(
        () => _i153.SearchRepositoryImpl(gh<_i302.SearchOnlineDataSource>()));
    gh.factory<_i532.SearchViewModel>(
        () => _i532.SearchViewModel(gh<_i38.SearchRepository>()));
    gh.factory<_i63.SimilarRepository>(
        () => _i716.SimilarRepositoryImpl(gh<_i431.SimilarOnlineDataSource>()));
    gh.factory<_i755.NewReleasesViewModel>(
        () => _i755.NewReleasesViewModel(gh<_i405.NewReleasesRepository>()));
    gh.factory<_i289.SimilarViewModel>(
        () => _i289.SimilarViewModel(gh<_i63.SimilarRepository>()));
    gh.factory<_i239.PopularViewModel>(
        () => _i239.PopularViewModel(gh<_i742.PopularRepository>()));
    return this;
  }
}
