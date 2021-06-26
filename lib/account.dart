import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor/address.dart';

// ignore: use_key_in_widget_constructors
class Myaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CircleAvatar(),
            const Text("data"),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  labelStyle: GoogleFonts.lato()),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your Email",
                  labelStyle: GoogleFonts.lato()),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAddress()));
              },
              child: Text(
                "ADD ADDRESS",
                style: GoogleFonts.oswald(),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
