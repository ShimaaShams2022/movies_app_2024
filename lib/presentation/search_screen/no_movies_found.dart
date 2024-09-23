import 'package:flutter/cupertino.dart';

import '../basic_files/utilities.dart';

class NoMoviesFound extends StatelessWidget {
  const NoMoviesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200,),
        Image.asset(getFullPathImage("iconMovies.png")),
        Text("No Movies Found")
      ],
    );
  }
}
