
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api_model/Results.dart';
import '../../../domain/Result.dart';
import '../../domain/repository/search_repository.dart';


@injectable

class SearchViewModel extends Cubit<SearchHomeState>{
  SearchRepository searchRepository;

  SearchViewModel(this.searchRepository) : super(SearchLoadingState());


  void loadSearchHomeScreen(String query)async {

    emit(SearchLoadingState());

    var result=await searchRepository.getSearch(query);

    switch(result){
      case Success():{
        emit(SearchSuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(SearchErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(SearchErrorState(result.exception));
      }

    }

  }
}

sealed class SearchHomeState {}

class SearchLoadingState extends SearchHomeState {}

class SearchSuccessState extends SearchHomeState {
  List<Results>? movieResults;
  SearchSuccessState(this.movieResults);

}

class SearchErrorState extends SearchHomeState {
  Exception exception;
  SearchErrorState(this.exception);
}
