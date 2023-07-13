import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medquick_minor/Screens/Review_cart/review_Cart.dart';
import 'package:medquick_minor/Screens/home_screen.dart';
import 'package:medquick_minor/Screens/login.dart';
import 'package:medquick_minor/myprofile/myprofile.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile(
      {IconData? icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 206, 177, 238),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome Guest'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            listTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icons.home_outlined,
              title: "Home",
            ),
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              icon: Icons.shop_outlined,
              title: "Review Cart",
            ),
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
              icon: Icons.person_outline,
              title: "My Profile",
            ),
            listTile(
              onTap: () {},
              icon: Icons.star_outline,
              title: "Rating and Review",
            ),
            listTile(
              onTap: () {},
              icon: Icons.copy_outlined,
              title: "Raise a Complain",
            ),
            listTile(
              onTap: () {},
              icon: Icons.favorite_outline,
              title: "Wishlist",
            ),
            listTile(
              onTap: () {},
              icon: Icons.format_quote_outlined,
              title: "FAQ",
            ),
            Container(
              height: 370,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Suport"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Call us:     ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+9198834232",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:     ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "MEDQuickhelp@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
