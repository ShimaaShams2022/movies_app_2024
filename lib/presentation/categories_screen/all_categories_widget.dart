import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/categories_screen/category_widget.dart';

class AllCategoriesWidget extends StatelessWidget {
   AllCategoriesWidget({super.key});

  final List<String> categories=[
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png",
    "categoryImage.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
         mainAxisSpacing: 15,
         crossAxisSpacing: 1,
         childAspectRatio: 1.7,
      ),
      itemCount:categories.length,
        itemBuilder: (context,index){
        return CategoryWidget(imageName: categories[index]);
        },
      ),
    );
  }
}
