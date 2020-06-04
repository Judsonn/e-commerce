import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      // color: Theme.of(context).primaryColor,
      border: Border.all(color: Theme.of(context).primaryColor, width: 5)
      ),

    child: Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Icon(Icons.account_circle, size: 100, color: Colors.white,),

        Text("judson.henrique@gmail.com", style: TextStyle( color: Colors.white)),

    ],),

      
    );
  }
}