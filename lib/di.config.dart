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
import 'data/data_source/popular_online_data_source.dart' as _i392;
import 'data/data_source_impl/popular_online_data_source_impl.dart' as _i975;
import 'data/repository/popular_repository_impl.dart' as _i202;
import 'domain/repository/popular_repository.dart' as _i742;
import 'presentation/home/home_view_model.dart' as _i694;

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
    gh.factory<_i392.PopularOnlineDataSource>(
        () => _i975.PopularOnlineDataSourceImpl(gh<_i235.ApiManager>()));
    gh.factory<_i742.PopularRepository>(
        () => _i202.PopularRepositoryImpl(gh<_i392.PopularOnlineDataSource>()));
    gh.factory<_i694.HomeViewModel>(
        () => _i694.HomeViewModel(gh<_i742.PopularRepository>()));
    return this;
  }
}
