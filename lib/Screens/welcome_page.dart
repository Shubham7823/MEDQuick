import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medquick_minor/Screens/login.dart';
import 'package:medquick_minor/discarded/loginpage.dart';
import 'package:medquick_minor/discarded/signup_page.dart';
import 'package:medquick_minor/widgets/navbar.dart';
import 'package:medquick_minor/Screens/signup.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarRoots(),
                    ));
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                  color: Color(0xFF7165D6),
                  fontSize: 20,
                ), // TextStyle
              ), // Text
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("images/front_page.png"),
          ),
          SizedBox(height: 50),
          DefaultTextStyle(
              style: TextStyle(
                color: Color(0xFF7165D6),
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
              child: Text(
                "YOUR ONLINE MEDICAL HELP",
              )),
          SizedBox(height: 10),
          DefaultTextStyle(
            style: TextStyle(
                color: Color.fromARGB(255, 14, 13, 24),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            child: Text(
              "BUY MEDICINES OR BOOK APPOINTMENT",
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )); // Navigator.push(
                    //    context,
                    //  MaterialPageRoute(
                    //  builder: (context) =>
                    // ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
