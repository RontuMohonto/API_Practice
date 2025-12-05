import 'package:api_integration/swipe/swipe.dart';
import 'package:flutter/material.dart';

import 'Q/add_screen.dart';
import 'Q/screen.dart';
import 'model/screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteDataScreen(),
    );
  }
}
