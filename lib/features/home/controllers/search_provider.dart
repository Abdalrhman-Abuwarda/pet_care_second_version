import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../shop/controllers/product_provider.dart';
import '../../shop/models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  bool replace = false;
  String querySearch = '';
  TextEditingController searchController = TextEditingController();
  List<SingleProduct> searchList = [];
  final homeProvider = sl<ProductProvider>();
  void replaceIt() {
    replace = !replace;
    notifyListeners();
  }

  void filterList(String query) {
    if (query.isEmpty) {
      // If the query is empty, display all items from the original list
      searchList = List.from(homeProvider.products!.products!);
      notifyListeners();

      debugPrint("This value querty $query");
      print("lentgh ${searchList.length}");
    } else {
      querySearch = query;
      // Filter the original list based on the search query
      searchList = homeProvider.products!.products!
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }

  final List<String> discoverList = [
    "Pamper your dog with purple grooming supplies.",
    "Purple dog toys for canine fun.",
    "Dog-friendly purple accessories for stylish pets.",
    "My dog loves purple chew toys.",
  ];
}
