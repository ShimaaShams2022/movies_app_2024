import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle:MyThemeData.darkTheme.textTheme.bodyLarge?.copyWith(color:  MyThemeData.boxMovieTextColor),
          prefixIcon: Icon(Icons.search,color: MyThemeData.iconColorBasic,),
          filled: true,
          fillColor: MyThemeData.boxMovieBorderColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyThemeData.boxMovieTextColor
            ),
            borderRadius: BorderRadius.circular(40)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            )
          )
        ),
      ),
    );
  }
}
