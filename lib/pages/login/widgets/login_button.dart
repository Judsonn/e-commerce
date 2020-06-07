import 'package:e_comerce/bloc/login/button_state.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: StreamBuilder<ButtonState>(
          builder: (context, snapshot){
            return RaisedButton(
            color: Theme.of(context).primaryColor,
            disabledColor: Colors.black45,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
            ), onPressed: snapshot.data.enabled? (){

            }:null,
            child: snapshot.data.loading? 
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
            :
            Text("Entrar",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 18,
              color: Colors.white
            ),
            ),
            );
          },
        )
      
      );
  }
}
