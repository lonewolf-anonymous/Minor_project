import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minor/login.dart';

// ignore: use_key_in_widget_constructors
class Myregister extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/register.png"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Username",
                      hintText: "Enter your Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Enter your Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password Should be atleast 6";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      hintText: "Enter your Password"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyLogin()));
                  }
                },
                child: Text("Create Account", style: GoogleFonts.oswald()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
