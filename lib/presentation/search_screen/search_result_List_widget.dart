import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/search_screen/search_result_movie_widget.dart';

class SearchResultListWidget extends StatelessWidget {
   SearchResultListWidget({super.key});

  List imagesList=[
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",


  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:imagesList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return SearchResultMovieWidget(imageName: imagesList[index]);
          },
        ),
      ),
    );
  }
}
