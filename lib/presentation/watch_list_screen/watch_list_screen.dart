import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/basic_files/my_theme/my_theme_data.dart';
import 'package:movies_app_2024/presentation/watch_list_screen/watch_all_List_widget.dart';


class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});
  static const String routeName = "WatchScreen";
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
          child: Text("Watch List",style: MyThemeData.darkTheme.textTheme.headlineMedium),
        ),
        WatchAllListWidget(),

      ],

    );
  }
}
