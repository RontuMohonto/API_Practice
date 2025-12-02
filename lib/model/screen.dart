import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';


class API {
  Future<List> getDataFromAPI() async {
    final url = Uri.parse("https://appapi.coderangon.com/api/names/A");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final allList = jsonData['data'] as List;

      await Future.delayed(Duration(seconds: 4));

      return allList;
    } else {
      return [];
    }
  }
}


class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
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
    setState(() {});

    newData = await API().getDataFromAPI();

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
      backgroundColor: const Color(0xffE8E8E8),

      appBar: AppBar(
        backgroundColor: const Color(0xffE8E8E8),
        centerTitle: true,
        title: const Text(
          "Baby Names",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async => await loadData(),

        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : newData.isEmpty
            ? const Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: newData.length,
                itemBuilder: (context, i) {
                  final item = newData[i];
                  final gender = item['gender'];

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: const Color(0xffF8F7F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  " ${newData[i]['name_bn']}",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const Spacer(),

                                Container(
                                  decoration: BoxDecoration(
                                    color: gender == "Boy"
                                        ? Colors.blue
                                        : Colors.pink,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        gender == "Boy"
                                            ? Icons.male
                                            : Icons.female,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        gender,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            //  English Name
                            Text(
                              " ${newData[i]['name_en']}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade400),
                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${newData[i]['bn_meaning']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: Icon(
                                    getReligionIcon(item['religion']),
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  item['religion'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
    );
  }
}
