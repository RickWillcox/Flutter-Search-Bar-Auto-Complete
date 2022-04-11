import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List fruits = [
    "apple",
    "banana",
    "orange",
    "watermelon",
    "pear",
    "grape",
    "pineapple",
    "strawberry",
    "cherry",
    "mango",
  ];

  List filteredList = [];

  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    // filteredList.addAll(fruits);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextField(onChanged: (value) {
            if (value.toString() == '') {
              setState(() {
                filteredList.clear();
              });
            } else {
              setState(() {
                filteredList.clear();
                filteredList.addAll(fruits);
                filteredList
                    .removeWhere((i) => i.contains(value.toString()) == false);
              });
            }
          }),
          Expanded(
            child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    leading: TextButton(
                      child: Text(filteredList[index]),
                      onPressed: () {
                        filteredList.clear();
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
