import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/checkout_provider.dart';
import '../../../widgets/custom_text_widget.dart';
import '../google_map/google_map.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
              keyboardType: null,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
              keyboardType: null,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLoaction == null
                        ? Text("Set Location")
                        : Text("Location Set"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              activeColor: Color.fromARGB(255, 92, 73, 73),
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Colors.purple,
              ),
            ),
            RadioListTile(
              activeColor: Color.fromARGB(255, 92, 73, 73),
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Colors.purple,
              ),
            ),
            RadioListTile(
              activeColor: Color.fromARGB(255, 92, 73, 73),
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Family and Friends"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.family_restroom_sharp,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
