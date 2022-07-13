import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/Category.dart';
import 'package:flutter_expenses/services/api.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  late ApiService apiService;

  CategoryProvider()  {
    this.apiService = ApiService();

    init();
  }

  Future init() async {
    categories = await apiService.fetchCategories();
    notifyListeners();
  } 

  Future updateCategory(Category category) async {
    try {
      Category updateCategory = await apiService.updateCategory(category);
      int index = categories.indexOf(category);
      categories[index] = updateCategory;

      notifyListeners();
    } catch(Exception) {
      print(Exception);
    }
  }
}