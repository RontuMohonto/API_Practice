import 'package:flutter/material.dart';

class SwipeDeleteDemo extends StatefulWidget {
  const SwipeDeleteDemo({super.key});

  @override
  State<SwipeDeleteDemo> createState() => _SwipeDeleteDemoState();
}

class _SwipeDeleteDemoState extends State<SwipeDeleteDemo> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe to Delete")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),        // 🟢 Must be unique
            direction: DismissDirection.endToStart, // 🟢 Swipe right-to-left
            background: Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);   // 🟢 Delete item
              });
            },
            child: Card(
              child: ListTile(
                title: Text(items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
