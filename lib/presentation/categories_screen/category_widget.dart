import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({required this.imageName,super.key});

  String? imageName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(getFullPathImage(imageName!)),
        Text("Action",style: MyThemeData.darkTheme.textTheme.bodyLarge?.copyWith(fontWeight:FontWeight.w600),)
      ],
    );
  }
}
