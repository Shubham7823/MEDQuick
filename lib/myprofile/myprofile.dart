import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medquick_minor/Screens/drawer_side.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.purple[100],
                ),
                Container(
                  height: 573,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 211),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prash',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('mail@gmail.com'),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue[400],
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 215, 186, 186),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(icon: Icons.shop_outlined, title: "My Orders"),
                      listTile(
                          icon: Icons.location_on_outlined,
                          title: "My Delivery Address"),
                      listTile(
                          icon: Icons.person_outline, title: "Refer A Friends"),
                      listTile(
                          icon: Icons.file_copy_outlined,
                          title: "Terms & Conditions"),
                      listTile(
                          icon: Icons.policy_outlined, title: "Privacy Policy"),
                      listTile(icon: Icons.add_chart, title: "About"),
                      listTile(
                          icon: Icons.exit_to_app_outlined, title: "Log Out"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.androidauthority.com/wp-content/uploads/2015/11/00-best-backgrounds-and-wallpaper-apps-for-android.jpg",
                  ),
                  radius: 45,
                  backgroundColor: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
