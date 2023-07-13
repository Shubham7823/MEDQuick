import 'package:flutter/material.dart';
import 'package:medquick_minor/Screens/shopping1.dart';
import 'package:medquick_minor/Screens/welcome_page.dart';
import 'package:medquick_minor/discarded/auth_controller.dart';
import 'package:medquick_minor/providers/product_provider.dart';
import 'package:medquick_minor/util/category_cart.dart';
import 'package:medquick_minor/util/doctor_card.dart';
import 'package:medquick_minor/widgets/navbar.dart';
import 'package:provider/provider.dart';
import './login.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 151, 228),
      body: SafeArea(
          child: Column(
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Prashant Shukla',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ],
                ),
                //profile picture
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    icon: Icon(Icons.person),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 21),
          //how do you feel
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 146, 174),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    //animation or picture
                    Container(
                      height: 100,
                      width: 100,
                      color: Color.fromARGB(255, 229, 146, 174),
                      child: Image.network(
                          'https://img.icons8.com/arcade/1x/shopping-cart.png'),
                    ),
                    SizedBox(
                      width: 25,
                    ),

                    // how do you feel + get started button
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Not feeling Well !',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get your medicines from nearest Medical stores with fastest delivery time',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 1),
                        Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(200, 33)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShoppingCart(),
                                        ));
                                  },
                                  child: Text("Buy Now")),
                            )),
                      ],
                    )),
                  ],
                ),
              )),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'How can we help you?',
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(
                  categoryName: 'dentist',
                  iconImagePath: 'images/tooth.png',
                ),
                CategoryCard(
                  categoryName: 'Surgeon',
                  iconImagePath: 'images/surgeon.png',
                ),
                CategoryCard(
                  categoryName: 'Pharmacist',
                  iconImagePath: 'images/pharmacist.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctor List ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DoctorCard(
                  doctorImagePath:
                      'https://thumbs.dreamstime.com/b/portrait-indian-doctor-portrait-male-indian-doctor-serious-expression-crossed-arms-wearing-white-coat-having-open-137577527.jpg',
                  rating: '4.9',
                  doctorName: 'Dr. Amit Gupta',
                  doctorProfession: 'Therapist '),
              DoctorCard(
                  doctorImagePath:
                      'https://previews.123rf.com/images/muralinathypr/muralinathypr1207/muralinathypr120700048/14907702-portrait-of-indian-doctor.jpg',
                  rating: '4.9',
                  doctorName: 'Dr. Shankar',
                  doctorProfession: 'Surgeon '),
              DoctorCard(
                  doctorImagePath:
                      'https://thumbs.dreamstime.com/b/portrait-happy-young-handsome-indian-man-doctor-smiling-studio-shot-against-white-background-137823661.jpg',
                  rating: '5.0',
                  doctorName: 'Dr. DK Gupta',
                  doctorProfession: 'Dentist'),
            ],
          ))
        ],
      )),
    );
  }
}
