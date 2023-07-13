import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medquick_minor/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/count.dart';

class SingleItem extends StatefulWidget {
  bool? isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String productId;
  late int productQuantity;
  VoidCallback onDelete;
  SingleItem({
    this.isBool,
    required this.onDelete,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;

  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: widget.isBool == false
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.productName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\₹${widget.productPrice}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          widget.isBool == false
                              ? GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              title: new Text('50 gm'),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: new Text('100gm'),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              title: new Text('250gm'),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 15,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "50 Gram",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: Colors.purple,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Text("50gm"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        )
                      : EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                  child: widget.isBool == false
                      ? Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          productQuantity: '1',
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: 4.0,
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 20,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (count == 1) {
                                            Fluttertoast.showToast(
                                              msg: "You reach minimum limit",
                                            );
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                              cartImage: widget.productImage,
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.purple,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        "$count",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (count < 8) {
                                            setState(() {
                                              count++;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                              cartImage: widget.productImage,
                                              cartId: widget.productId,
                                              cartName: widget.productName,
                                              cartPrice: widget.productPrice,
                                              cartQuantity: count,
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.purple,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
