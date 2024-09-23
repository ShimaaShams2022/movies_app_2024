import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/categories_screen/all_categories_widget.dart';


import '../basic_files/my_theme/my_theme_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const String routeName = "CategoriesScreen";
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height*0.06
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Browse Category",style: MyThemeData.darkTheme.textTheme.headlineMedium),
        ),
        AllCategoriesWidget(),
      ],
    );
  }
}
