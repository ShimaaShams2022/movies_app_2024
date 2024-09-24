import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  LoadingStateWidget({this.loadingMessage,super.key});

  String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 360,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Text(loadingMessage??"")
          ],
        ),
      ),
    );
  }
}
