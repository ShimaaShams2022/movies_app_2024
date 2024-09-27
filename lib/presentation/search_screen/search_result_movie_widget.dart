import 'package:flutter/material.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';


class SearchResultMovieWidget extends StatelessWidget {
   SearchResultMovieWidget({required this.film,super.key});
  Results film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom:10 ),
              child: Image.network('https://image.tmdb.org/t/p/w500${film.posterPath}'),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alita Battle Angel",style: MyThemeData.darkTheme.textTheme.titleSmall),
                Text("2019",style: MyThemeData.darkTheme.textTheme.bodyLarge),
                Text("Rosa Salazar, Christoph Waltz",style: MyThemeData.darkTheme.textTheme.bodyLarge)
              ],
            )
          ],
        ),
        Divider(
          color: MyThemeData.colorDivider,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
