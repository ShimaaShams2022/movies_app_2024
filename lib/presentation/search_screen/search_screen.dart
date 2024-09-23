import 'package:flutter/material.dart';
import 'package:movies_app_2024/presentation/search_screen/no_movies_found.dart';
import 'package:movies_app_2024/presentation/search_screen/search_field.dart';
import 'package:movies_app_2024/presentation/search_screen/search_result_List_widget.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        SearchField(),
        SearchResultListWidget()
      ],
    );
  }
}
