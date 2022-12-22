import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snackfood/auth/mainPage.dart';
import 'package:snackfood/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openSplashScreen();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    var durasiSplash = const Duration(seconds: 2);
    return Timer(durasiSplash, () {
      //pindah ke halaman home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Mainpage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              width: 150,
              height: 150,
            ),
            Text(
              'SnackFoods',
              style: poppinsTextStyle.copyWith(
                color: Color.fromARGB(255, 170, 9, 9),
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
