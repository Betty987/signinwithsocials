// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loginapp/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      // body of our ui

      body: loginUI(),
    );
  }

  // creating a function loginUI

  loginUI() {
    // loggedINUI
    // loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in
      if (model.userDetails != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our ui will have 3 children, name, email, photo , logout button

      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        // logout
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            })
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            height: 80,
            width: 100,
          ),
          
          SizedBox(
            height: 10,
          ),
          
          Text('Log in to see more',
              
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'NerkoOne')),
          
          SizedBox(
            height: 110,
          ),
          GestureDetector(
              child: Image.asset(
                "assets/google.png",
                width: 240,
              ),
              onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .googleLogin();
              }),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              child: Image.asset(
                "assets/fb.png",
                width: 240,
              ),
              onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .facebooklogin();
              }),
          SizedBox(
            height: 40,
          ),
          Text('©2022,Designed by Bethlehem,All rights reserved.',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: 'NerkoOne')),
        ],
      ),
    );
  }
}
