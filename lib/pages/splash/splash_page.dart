import 'dart:async';
import 'package:e_comerce/pages/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return BaseScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff01A0C7),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            //criar o degrade das cores do prototipo
            height: size.height,
            width: size.width,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: <Widget>[
                Container(
                  width: 170,
                  child: Image.asset('assets/carambolaShop.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                SpinKitRipple(
                  color: Theme.of(context).primaryColor,
                  size: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
