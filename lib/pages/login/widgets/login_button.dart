import 'package:e_comerce/bloc/login/button_state.dart';
import 'package:e_comerce/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

LoginButton(this.loginBloc);
final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 370,
        child: StreamBuilder<ButtonState>(
          stream: loginBloc.outLoginButton,
          initialData: ButtonState(enabled: false, loading: false),
          builder: (context, snapshot){
            return RaisedButton(
            color: Theme.of(context).primaryColor,
            disabledColor: Colors.green[100],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
            ), onPressed: snapshot.data.enabled? () async {
              final bool succes = await loginBloc.loginwithEmail();
              if(succes)
              Navigator.of(context).pop();
            }:null,
            child: snapshot.data.loading? 
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
            :
            Text("Entrar",
            style: TextStyle(
              fontWeight: FontWeight.w600, 
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
