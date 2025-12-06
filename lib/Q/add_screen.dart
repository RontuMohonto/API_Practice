import 'dart:developer';

import 'package:api_integration/Q/api_add.dart';
import 'package:api_integration/model/screen.dart';
import 'package:flutter/material.dart';

class QuoteAddScreen extends StatefulWidget {
  const QuoteAddScreen({super.key});

  @override
  State<QuoteAddScreen> createState() => _QuoteAddScreenState();
}

class _QuoteAddScreenState extends State<QuoteAddScreen> {
  TextEditingController QuoteController = TextEditingController();
  TextEditingController AuthorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Data Add Screen",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),

      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            Text(
              "Quote",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: QuoteController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter Your Quote",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Author",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: AuthorController,
              decoration: InputDecoration(
                hintText: "Enter Your Author",

                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                backgroundColor: Color(0xff2D2D2F),
              ),
              onPressed: () async {
                await AddApi.storeData(
                  quote: QuoteController.text,
                  author: AuthorController.text,
                );
                log("===${QuoteController.text}  ${AuthorController.text}==");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
