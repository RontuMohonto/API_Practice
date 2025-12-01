import 'package:api_integration/model/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  IconData getReligionIcon(String religion) {
    if (religion.toLowerCase() == "islam") {
      return Icons.mosque;
    } else if (religion.toLowerCase() == "hinduism") {
      return Icons.temple_hindu;
    } else if (religion.toLowerCase() == "judaism") {
      return Icons.church;
    } else {
      return Icons.help_outline;
    }
  }

  bool isLoading = true;
  List newData = [];

  loadData() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 5));
    // newData = DummyData.mydata['data'];
    newData = DummyData.mydata[0]['data'];

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE8E8E8),
        title: Text(
          "*Baby names*",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffE8E8E8),

      body: isLoading == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.white,
                    child: Card(
                      color: Color(0xffF8F7F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 60,
                                  color: Colors.grey,
                                ),
                                Spacer(),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "=========",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "=========",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey,
                              height: 2,
                              endIndent: 8,
                              indent: 8,
                            ),
                            SizedBox(height: 10),
                            Row(
                              spacing: 10,
                              children: [
                                Text(
                                  "=========",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Spacer(),

                                Row(
                                  spacing: 5,
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("========"),
                                      ),
                                    ),
                                    Text(
                                      "=========",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ) //Shimmer
          : newData.isEmpty
          ? Center(
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_dissatisfied_sharp, size: 30),
                  Text(
                    "No data found",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for names...",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: newData.length,
                    itemBuilder: (context, i) {
                      final gender = newData[i]['gender'];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Card(
                          color: Color(0xffF8F7F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " ${newData[i]['name_bn']}",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              gender == 'Boy'
                                                  ? Icons.male
                                                  : Icons.female,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text(
                                              "${newData[i]['gender']}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: gender == 'Boy'
                                            ? Colors.blue
                                            : Colors.pink,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "*${newData[i]['name_en']}*",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  endIndent: 8,
                                  indent: 8,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "*${newData[i]['bn_meaning']}*",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Spacer(),

                                    Row(
                                      spacing: 5,
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Icon(
                                              getReligionIcon(
                                                newData[i]['religion'],
                                              ),
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${newData[i]['religion']}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
