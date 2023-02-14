import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List"),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: GestureDetector(
                child: Text("Add"),
                onTap: () {
                  setState(() {
                    items.add("Item ${items.length + 1}");
                  });
                },
              ),
            );
          } else {
            return ListTile(
              title: Text(items[index]),
            );
          }
        },
      ),
    );
  }
}
