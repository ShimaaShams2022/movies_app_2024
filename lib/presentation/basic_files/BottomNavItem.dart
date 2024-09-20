
import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem(
      String title,
      String iconPath,
      ) : super(
      icon: ImageIcon(AssetImage(getFullPathImage(iconPath))),
      label: title,
  );

}
