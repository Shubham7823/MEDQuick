import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/review_cart_provider.dart';

class Count extends StatefulWidget {
  late String productName;
  late String productImage;
  late String productId;
  late int productPrice;
  late String productQuantity;
  Count({
    required this.productName,
    required this.productQuantity,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 20,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 245, 185, 185),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(
                        () {
                          isTrue = false;
                        },
                      );
                      reviewCartProvider.reviewCartDataDelete(widget.productId);
                    } else if (count > 1) {
                      setState(
                        () {
                          count--;
                        },
                      );
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        count++;
                      },
                    );
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                      cartUnit: widget.productQuantity,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.deepPurple,
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(
                    () {
                      isTrue = true;
                    },
                  );
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                    cartUnit: widget.productQuantity,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
    );
  }
}
