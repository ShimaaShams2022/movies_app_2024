import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:movies_app_2024/domain/repository/popular_repository.dart';


import '../../data/api_model/Results.dart';

import '../../domain/Result.dart';


@injectable

class HomeViewModel extends Cubit<HomeState> {
  PopularRepository popularRepository;

  HomeViewModel(this.popularRepository) : super(LoadingState());



  void loadHomeScreen()async {
    emit(LoadingState());
    var result=await popularRepository.getPopular();
    switch(result){
      case Success():{
        emit(SuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(ErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(ErrorState(result.exception));
      }

    }

  }
}

sealed class HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  List<Results>? movieResults;
  SuccessState(this.movieResults);

}

class ErrorState extends HomeState {
  Exception exception;
  ErrorState(this.exception);
}
