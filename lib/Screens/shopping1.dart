import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medquick_minor/Screens/drawer_side.dart';
import 'package:medquick_minor/Search_page/search_page.dart';
import 'package:medquick_minor/product_overview/product_overview.dart';
import 'package:medquick_minor/Screens/single_product.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '/Screens/singleproduct1.dart';

import 'Review_cart/review_Cart.dart';
import 'login.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  ProductProvider? productProvider;
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fetchSunProtectionData();
    initproductProvider.fetchCovidCareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(
      context,
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 229, 249),
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'MEDQuick - Your Online Store',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.deepPurple[300],
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchPage(
                        search: productProvider.getAllProductsSearch,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.search)),
          ),
          SizedBox(
            width: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.deepPurple[100],
                radius: 12,
                child: Icon(Icons.shop, size: 17, color: Colors.black),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://img.freepik.com/premium-photo/multicolored-pills-wooden-spoon-blue-background_446633-3737.jpg?w=2000')),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 210,
                                ),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Medicine',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepPurple,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 10,
                                              offset: Offset(3, 3))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 250),
                                child: Text(
                                  '30% Off',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 250),
                                child: Text(
                                  'On all medicines',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SUN PROTECTION ESSENTIALS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchPage(
                              search: productProvider.getSunProtectionDataList,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getSunProtectionDataList.map(
                    (SunProtectionData) {
                      return SingleProduct(
                        productImage: SunProtectionData.productImage,
                        productName: SunProtectionData.productName,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                productId: SunProtectionData.productId,
                                productImage: SunProtectionData.productImage,
                                productName: SunProtectionData.productName,
                                productPrice: SunProtectionData.productPrice,
                                productDescription:
                                    'Description \nThis  Sunscreen Gel is enriched with vitamin E and antioxidants used to protect the skin from harmful sun rays. It contains ingredients that remain unchanged upon sun exposure and thus ensure UV protection.',
                              ),
                            ),
                          );
                        },
                        productId: SunProtectionData.productId,
                        productWeight: '50gm',
                        productPrice: SunProtectionData.productPrice,
                      );
                    },
                  ).toList(),
                  // children: [
                  //   SingleProduct(
                  //     productName: 'UVsmart SPF 40+ PA+',
                  //     productImage:
                  //         'https://www.netmeds.com/images/product-v1/600x600/827969/uvsmart_spf_40_pasunscreen_gel_50gm_0_1.jpg',
                  //     onTap: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => ProductOverview(
                  //             productImage:
                  //                 'https://www.netmeds.com/images/product-v1/600x600/827969/uvsmart_spf_40_pasunscreen_gel_50gm_0_1.jpg',
                  //             productName: 'UVsmart SPF 40+ PA+',
                  //             productDescription:
                  //                 'Description \nUvsmart SPF 40+ Sunscreen Gel is enriched with vitamin E and antioxidants used to protect the skin from harmful sun rays. It contains ingredients that remain unchanged upon sun exposure and thus ensure UV protection.',
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     productWeight: '500gm',
                  //   ),
                  //   SingleProduct(
                  //     productImage:
                  //         'https://m.media-amazon.com/images/I/41ufvgH7Y5L._SL1100_.jpg',
                  //     productName: 'UVsmart Matt SPF 40+ PA+++ ',
                  //     onTap: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => ProductOverview(
                  //             productImage:
                  //                 'https://m.media-amazon.com/images/I/41ufvgH7Y5L._SL1100_.jpg',
                  //             productName: 'UVsmart Matt SPF 40+ PA+++',
                  //             productDescription:
                  //                 'Description \nUVsmart Matt SPF 40+ PA+++  Sunscreen Gel is enriched with vitamin E and antioxidants used to protect the skin from harmful sun rays. It contains ingredients that remain unchanged upon sun exposure and thus ensure UV protection.',
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     productWeight: '50gm',
                  //   ),

                  // ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COVID CARE AND PROTECTION",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchPage(
                              search: productProvider.getCovidCareDataList,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getCovidCareDataList.map(
                    (CovidCaredata) {
                      return SingleProduct1(
                        productId: CovidCaredata.productId,
                        productImage: CovidCaredata.productImage,
                        productName: CovidCaredata.productName,
                        productPrice: CovidCaredata.productPrice,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductOverview(
                                productImage: CovidCaredata.productImage,
                                productName: CovidCaredata.productName,
                                productPrice: CovidCaredata.productPrice,
                                productId: CovidCaredata.productId,
                                productDescription:
                                    'Description\nMylab CoviSelf COVID-19 Rapid Antigen Self Test Kit is designed to assist you in taking a safe rapid antigen test easily at the comfort of your home. Get your and your family’s immediate COVID-19-19 Rapid Antigen test done quickly and hassle-free with this self-assessing kit. Now you can get tested for COVID-19 in just 15 minutes with this test kit.',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                  // children: [
                  //   SingleProduct1(
                  //     productImage:
                  //         'https://m.media-amazon.com/images/I/51BARcwudBS._SL1430_.jpg',
                  //     productName: 'MyLab CovidSelf COVID-19 Rapid Test Kit',
                  //     onTap: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => ProductOverview(
                  //             productImage:
                  //                 'https://m.media-amazon.com/images/I/51BARcwudBS._SL1430_.jpg',
                  //             productName:
                  //                 'MyLab CovidSelf COVID-19 Rapid Test Kit',
                  //             productDescription:
                  //                 'Description\nMylab CoviSelf COVID-19 Rapid Antigen Self Test Kit is designed to assist you in taking a safe rapid antigen test easily at the comfort of your home. Get your and your family’s immediate COVID-19-19 Rapid Antigen test done quickly and hassle-free with this self-assessing kit. Now you can get tested for COVID-19 in just 15 minutes with this test kit.',
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
