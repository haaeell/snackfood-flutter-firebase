import 'package:flutter/material.dart';
import 'package:snackfood/pages/LoginPage.dart';
import 'package:snackfood/pages/RegisterPage.dart';

class authPage extends StatefulWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  //intially, show the logi page
  bool showLoginPage = true;

  void togglesScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(showRegisterPage: togglesScreens);
    } else {
      return RegisterPage(showLoginPage: togglesScreens);
    }
  }
}
