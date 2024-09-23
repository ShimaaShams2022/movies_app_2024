
import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/utilities.dart';

class PosterWithPlay extends StatelessWidget {
   PosterWithPlay({required this.imageName,super.key});

  String? imageName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(getFullPathImage(imageName!)),
        ImageIcon(
          AssetImage(getFullPathImage("playButton.png")),
          color: Colors.white,
          size: 60,
        ),
      ],
    );
  }
}
