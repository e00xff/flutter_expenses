import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/Category.dart';
import 'package:flutter_expenses/widgets/CategoryEdit.dart';

import 'package:flutter_expenses/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    List<Category> categories = provider.categories;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              Category category = categories[index];
              return ListTile(
                title: Text(category.name),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return CategoryEdit(category, provider.updateCategory);
                        });
                  },
                ),
              );
            }));
  }
}
