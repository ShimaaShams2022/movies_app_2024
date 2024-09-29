import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/categories_screen/category_widget.dart';

import '../../data/api_model/Genres.dart';

class AllCategoriesWidget extends StatelessWidget {
   AllCategoriesWidget(this.categories,{super.key});

   List<Genres>? categories;



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
         mainAxisSpacing: 15,
         crossAxisSpacing: 1,
         childAspectRatio: 1.7,
      ),
      itemCount:categories?.length,
        itemBuilder: (context,index){
        return CategoryWidget(
          categoryName: categories?[index].name??"",
          categoryId:categories?[index].id.toString()??"");
        },
      ),
    );
  }
}
