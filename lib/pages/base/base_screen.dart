import 'package:e_comerce/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override


final PageController  _pageController =  PageController(); 


  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // bloqueia o scrool para os lados 
        children: <Widget>[
          HomePage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}