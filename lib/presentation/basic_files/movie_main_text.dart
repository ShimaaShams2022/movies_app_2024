import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class MovieMainText extends StatelessWidget {
  const MovieMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment:CrossAxisAlignment.start,

      children: [
        Text(
          "Dora and the lost city of gold",
          style: MyThemeData.darkTheme.textTheme.bodyLarge,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              "2019",
              style: MyThemeData.darkTheme.textTheme.bodyMedium,
            ),
            Text(
              "PG-13",
              style: MyThemeData.darkTheme.textTheme.bodyMedium,
            ),
            Text(
              "2h 7m",
              style: MyThemeData.darkTheme.textTheme.bodyMedium,
            )
          ],
        ),
      ],
    );
  }
}
