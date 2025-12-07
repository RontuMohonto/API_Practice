import 'dart:developer';

import 'package:api_integration/Q/getData.dart';
import 'package:flutter/material.dart';

import 'add_screen.dart';

class QuoteDataScreen extends StatefulWidget {
  const QuoteDataScreen({super.key});

  @override
  State<QuoteDataScreen> createState() => _QuoteDataScreenState();
}

class _QuoteDataScreenState extends State<QuoteDataScreen> {
  List quotationList = [];
  bool isLoading = true;

  allData() async {
    isLoading = true;

    setState(() {});

    var a = await APIdata().getData();
    log("==$a==");
    if (a.isNotEmpty) {
      quotationList = a['data'];
    }

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    allData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1A1A),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Famous Quotes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              allData();
              setState(() {});
            },
            icon: SizedBox(
              width: 40,
              child: Icon(Icons.refresh, color: Colors.white),
            ),
          ),
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black,
              ),
            )
          : quotationList.isEmpty
          ? Center(child: Text("No Data Found"))
          : ListView.builder(
              itemCount: quotationList.length,
              itemBuilder: (context, index) => Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                color: Color(0xff2D2D2F),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Column(
                    spacing: 25,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${quotationList[index]['quote']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              "${quotationList[index]['author']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w200,
                              ),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2D2D2F),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuoteAddScreen()),
          ).then((v) {
            allData();
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
