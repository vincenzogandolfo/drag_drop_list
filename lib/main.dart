import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const DragDropList());
}

class DragDropList extends StatelessWidget {
  const DragDropList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
