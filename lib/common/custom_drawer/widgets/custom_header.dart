import 'package:e_comerce/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> LoginPage())
        );
      },
          child: Container(
        height: 150,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        color: Theme.of(context).primaryColor,
        // border: Border.all(color: Theme.of(context).primaryColor, width: 5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: Colors.black38,
            blurRadius: 10
          )
        ]
        ),

      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Icon(Icons.account_circle, size: 70, color: Colors.white,),

          Text("Acesse sua conta agora!", 
          style: TextStyle( 
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
          )),
          Text("clique aqui", 
          style: TextStyle( 
            color: Colors.white
          )),

      ],),

        
      ),
    );
  }
}