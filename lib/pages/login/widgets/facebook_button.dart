import 'package:e_comerce/bloc/login/login_bloc.dart';
import 'package:e_comerce/bloc/login/login_bloc_state.dart';
import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({ this.loginBloc}); 

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
        width: 370,
        child: StreamBuilder(
          initialData: LoginBlocState(LoginState.IDLE),
          stream: loginBloc.outState,
          builder: (context, snapshot){
            return RaisedButton(
              color: Color.fromRGBO(58, 89, 152, 1),
              disabledColor: Color.fromRGBO(58, 89, 152, 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30) 
              ), onPressed: snapshot.data.state == LoginState.LOADING_FACE? 
              null : () async {  
                final bool succes = await loginBloc.loginwithFacebook();
                if(succes)
                Navigator.of(context).pop();
              },

              child: snapshot.data.state == LoginState.LOADING_FACE?
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) 
              :
              Text("Entrar com FaceBook",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white
              ),)

            );
          }
        ,)
      
    );
  }
}