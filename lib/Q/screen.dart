import 'dart:developer';

import 'package:api_integration/Q/getData.dart';
import 'package:flutter/material.dart';

class QuoteDataScreen extends StatefulWidget {
  const QuoteDataScreen({super.key});

  @override
  State<QuoteDataScreen> createState() => _QuoteDataScreenState();
}

class _QuoteDataScreenState extends State<QuoteDataScreen> {
  List quotationList = [];

  allData() async {
    var a = await APIdata().getData();
    quotationList = a['data'];

  }

  @override
  void initState() {
    allData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "QuoteDataScreen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(child: Text("data")),
    );
  }
}
