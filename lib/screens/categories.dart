import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  final List<String> categories = <String>[
    'Category 1',
    'Category 2',
    'Category 3',
  ];

  int clicked = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories clicked: ' + clicked.toString()),
      ),
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Center(
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      categories[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () => setState(() => clicked++),
                  );
                })),
      ),
    );
  }
}
