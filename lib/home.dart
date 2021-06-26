import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor/razorpay.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:minor/account.dart';
//import 'package:minor/razorpay.dart';
//import 'package:verzeo_task3/razorpay.dart';

// ignore: use_key_in_widget_constructors
class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NWrYsDjM8UrCjy',
      'amount': 28200,
      'name': 'Abhishek',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: ");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: " + response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.indigo),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      const Text("Abhishek"),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Myaccount()));
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  )),
              ListTile(
                leading: const Icon(Icons.history),
                title: Text("Brief History", style: GoogleFonts.lato()),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: Text("Help & Support", style: GoogleFonts.lato()),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: Text("Updates", style: GoogleFonts.lato()),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text("logout", style: GoogleFonts.lato()),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("Logout", style: GoogleFonts.lato()),
                        content: Text(
                          "Do you want to LogOut ?",
                          style: GoogleFonts.lato(),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: Text(
                                "Logout",
                                style: GoogleFonts.oswald(),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.oswald(),
                              )),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // openCheckout();

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Razor()));
            },
            child: const Text("Proceed to Checkout")),
      ),
    );
  }
}
