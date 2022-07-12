import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/Category.dart';
import 'package:flutter_expenses/services/api.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Category>> futureCategories;
  final _formKey = GlobalKey<FormState>();
  late Category selectedCategory;
  final categoryNameController = TextEditingController();
  ApiService apiService = ApiService();


  Future saveCategory() async {
    final form = _formKey.currentState;

    if(!form!.validate()) {
      return;
    }

    apiService.updateCategory(selectedCategory.id.toString(), categoryNameController.text);

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    futureCategories = apiService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: FutureBuilder<List<Category>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Category category = snapshot.data![index];
                      return ListTile(
                        title: Text(category.name),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            selectedCategory = category;
                            categoryNameController.text = category.name;
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(children: <Widget>[
                                          TextFormField(
                                            controller: categoryNameController,
                                            validator: (String? value) {
                                              if(value!.isEmpty) {
                                                return 'Enter category name';
                                              }

                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Category Name',
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              ElevatedButton(
                                                  child: const Text('Save'),
                                                  onPressed: () => saveCategory()
                                                ),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.red
                                                  ),
                                                  child: const Text('Cancel'),
                                                  onPressed: () => Navigator.pop(context)
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              return const CircularProgressIndicator();
            }));
  }
}
