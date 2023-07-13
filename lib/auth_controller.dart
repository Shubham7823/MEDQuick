import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medquick_minor/discarded/loginpage.dart';
import 'package:medquick_minor/Screens/welcome_page.dart';
import 'package:medquick_minor/widgets/navbar.dart';

class AuthController extends GetxController {
  //AuthController.intsance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
    print("AuthController onReady method called");
  }

  _initialScreen(User? user) {
    print("_initialScreen method called with user=$user");
    if (user == null) {
      print("login page");
      Get.offAll(() => WelcomeScreen());
    } else {
      Get.offAll(() => NavBarRoots());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
