import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medquick_minor/Search_page/singleItem.dart';

import '../models/product_model.dart';

class SearchPage extends StatefulWidget {
  late List<ProductModel> search;
  SearchPage({required this.search});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 230, 236),
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                print(value);
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: _searchItem.map(
                (data) {
                  return SingleItem(
                    isBool: false,
                    productImage: data.productImage,
                    productName: data.productName,
                    productPrice: data.productPrice,
                    productId: data.productId,
                    onDelete: () {},
                    productQuantity: 0,
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
  // children: [
  //
}
