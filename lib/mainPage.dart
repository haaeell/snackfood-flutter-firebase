import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snackfood/pages/HomePage.dart';
import 'package:snackfood/pages/LoginPage.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else {
            return Loginpage();
          }
        },
      ),
    );
  }
}
