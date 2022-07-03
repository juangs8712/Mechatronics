import 'package:flutter/material.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          '404 - No Page Found!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
