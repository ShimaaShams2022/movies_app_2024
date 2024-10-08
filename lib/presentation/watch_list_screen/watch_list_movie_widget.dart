import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/book_mark_with_check.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';

import '../basic_files/utilities.dart';

class WatchListMovieWidget extends StatelessWidget {
  WatchListMovieWidget({required this.imageName,super.key});
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom:10 ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(getFullPathImage(imageName!)),
                Positioned(
                    top:-5,
                    left:-9,
                    child: BookMarkWithCheck()),

                ],
              ),
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
