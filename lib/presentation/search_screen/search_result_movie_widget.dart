import 'package:flutter/material.dart';
import 'package:movies_app_2024/data/api_model/Results.dart';
import 'package:movies_app_2024/presentation/basic_files/loading_image.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';


class SearchResultMovieWidget extends StatelessWidget {
   SearchResultMovieWidget({required this.film,super.key});
  Results? film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom:10 ),
              child:LoadingImage(imageName: film?.posterPath)
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(film?.originalTitle??"",style: MyThemeData.darkTheme.textTheme.titleSmall,
                  softWrap: true,
                    maxLines: 2,
                  ),
                ),
                Text(splitYear(film?.releaseDate??""),style: MyThemeData.darkTheme.textTheme.bodyLarge),
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
