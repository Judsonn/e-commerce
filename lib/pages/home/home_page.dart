import 'package:e_comerce/common/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
       title: Text("E-commerce", style: TextStyle(
         fontSize: 20,
         color: Colors.white,
         fontWeight: FontWeight.bold
       ),),
      ),
      drawer: CustomDrawer(),
    );
  }
}