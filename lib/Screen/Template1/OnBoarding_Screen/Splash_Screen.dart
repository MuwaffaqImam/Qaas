import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_template/Screen/Template1/B5_Profile_Screen/List_Profile_Screen/Another_Template.dart';
import 'package:food_template/Screen/Template1/Bottom_Nav_Bar/bottomNavBar.dart';
import 'package:food_template/Screen/Template1/Login_Screen/SignIn_Screen.dart';
import 'package:food_template/Screen/Template2/Bottom_Nav_Bar/BottomNavigationBar.dart';
import 'package:food_template/Screen/Template4/SplashScreen.dart';
import 'onBoarding_Screen.dart';

class SplashScreenTemplate1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      home: SplashScreenTemplate1Screen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorBrightness: Brightness.light,
          primaryColor: Colors.white),
    );
  }
}

class SplashScreenTemplate1Screen extends StatefulWidget {
  @override
  _SplashScreenTemplate1ScreenState createState() =>
      _SplashScreenTemplate1ScreenState();
}

class _SplashScreenTemplate1ScreenState
    extends State<SplashScreenTemplate1Screen> {
  @override
  void _Navigator() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (_, __, ___) => 
        OnboardingScreen(),
        //testing(),
        transitionDuration: Duration(milliseconds: 2000),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        }));
  }

  /// Set timer SplashScreenTemplate1
  _timer() async {
    return Timer(Duration(milliseconds: 2300), _Navigator);
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/Template1/image/SplashScreenTemplate1.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/Template1/image/icon.png",
                  height: 45.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Foodies",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1.5,
                      fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
