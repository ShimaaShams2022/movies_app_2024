
import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class BoxMovieType extends StatelessWidget {
  const BoxMovieType({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(

                color: MyThemeData.boxMovieBorderColor
            )
        ) ,
        child: Text("Action",style: MyThemeData.darkTheme.textTheme.bodyLarge?.copyWith(color: MyThemeData.boxMovieTextColor))
    );
  }
}
