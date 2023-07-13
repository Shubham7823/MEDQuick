import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medquick_minor/models/product_model.dart';
import 'package:medquick_minor/providers/product_provider.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  List<ProductModel> SunProtectionList = [];
  fetchSunProtectionData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('SunProtection').get();
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    SunProtectionList = newList;
    notifyListeners();
  }

  List<ProductModel> get getSunProtectionDataList {
    return SunProtectionList;
  }

//////////////////////COVID CARRE///////////////////
  List<ProductModel> CovidCareList = [];

  fetchCovidCareData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('CovidCare').get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    CovidCareList = newList;
    notifyListeners();
  }

  List<ProductModel> get getCovidCareDataList {
    return CovidCareList;
  }

  ///////////////SEARCH/////////////
  ///
  List<ProductModel> get getAllProductsSearch {
    return search;
  }
}
