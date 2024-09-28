import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/search_screen/search_result_movie_widget.dart';

import '../../data/api_model/Results.dart';

class SearchResultListWidget extends StatelessWidget {
   SearchResultListWidget({
     required this.resultList,
     super.key});

   List<Results> resultList;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:resultList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return SearchResultMovieWidget(film: resultList[index]);
          },
        ),
      ),
    );
  }
}
