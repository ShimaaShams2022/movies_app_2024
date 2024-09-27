import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_2024/presentation/search_screen/no_movies_found.dart';
import 'package:movies_app_2024/presentation/search_screen/search_field.dart';
import 'package:movies_app_2024/presentation/search_screen/search_result_List_widget.dart';
import 'package:movies_app_2024/presentation/search_screen/search_view_model.dart';

import '../../data/api_model/Results.dart';
import '../../di.dart';
import '../basic_files/ErrorStateWidget.dart';
import '../basic_files/loading_widget.dart';
import '../basic_files/my_theme/my_theme_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

//field injection
var searchViewModel = getIt.get<SearchViewModel>();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    String? query;

    List<Results> searchMoviesList =[];

    return BlocProvider(
      create: (BuildContext context) => searchViewModel,
      child: BlocBuilder<SearchViewModel, SearchHomeState>(
          builder: (context, state) {
        switch (state) {
          case SearchLoadingState():
            {
            return LoadingStateWidget();
          }

          case SearchSuccessState():

            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 5, left: 40, right: 40),
                  child: TextFormField(
                    onChanged: (query) {
                      if (query.isNotEmpty) {
                        searchViewModel.loadSearchHomeScreen(query);
                        searchMoviesList = state.movieResults ?? [];
                      }
                    },
                    style: MyThemeData.darkTheme.textTheme.bodyLarge,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: MyThemeData.darkTheme.textTheme.bodyLarge
                          ?.copyWith(color: MyThemeData.boxMovieTextColor),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: MyThemeData.iconColorBasic,
                      ),
                      filled: true,
                      fillColor: MyThemeData.boxMovieBorderColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyThemeData.boxMovieTextColor),
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: MyThemeData.boxMovieTextColor),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
                SearchResultListWidget(resultList: searchMoviesList)
              ],
            );
          case SearchErrorState():
          return ErrorStateWidget(state.exception);
        }
      }),
    );
  }
}
