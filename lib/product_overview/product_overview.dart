import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../Screens/Review_cart/review_Cart.dart';
import '../widgets/count.dart';

enum SigninCharacter {
  fill,
  outline,
}

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productDescription;
  final int productPrice;
  final String productId;
  ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter? _character = SigninCharacter.fill;

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required VoidCallback OnTap,
  }) {
    return Expanded(
        child: GestureDetector(
      onTap: OnTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            iconColor: Colors.purple,
            backgroundColor: Color.fromARGB(255, 58, 52, 52),
            color: Colors.white,
            title: 'Add to Wishlist',
            iconData: Icons.favorite_outline,
            OnTap: () {},
          ),
          bottomNavigatorBar(
            iconColor: Colors.blue,
            backgroundColor: Color.fromARGB(255, 226, 211, 75),
            color: Color.fromARGB(255, 13, 11, 11),
            title: 'Add to Cart',
            iconData: Icons.shop_outlined,
            OnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              );
            },
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepPurple[100],
        ),
        title: Text(
          "Product Overview",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text('100gm'),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green,
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _character = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Text("\₹${widget.productPrice}"),
                        Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          productQuantity: '1',
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 30,
                        //     vertical: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.black),
                        //     borderRadius: BorderRadius.circular(
                        //       30,
                        //     ),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.add,
                        //         size: 17,
                        //         color: Colors.deepPurple,
                        //       ),
                        //       Text(
                        //         "ADD",
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this Product ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.productDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
