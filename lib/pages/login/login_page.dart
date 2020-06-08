import 'package:e_comerce/pages/home/home_page.dart';
import 'package:e_comerce/bloc/login/field_state.dart';
import 'package:e_comerce/bloc/login/login_bloc.dart';
import 'package:e_comerce/pages/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

LoginBloc _loginBloc = LoginBloc();
final ScrollController _scrollController = ScrollController();  


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
       return Scaffold(
        
        body: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(top: 20, bottom: 15),
                   child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                       border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Icon(Icons.account_circle,
                        color: Colors.grey[300],
                        size: 150,
                      ),
                    ),
                  ),
                ),    

                Text("Olá Visitante!", style: 
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )),

                SizedBox(height: 10,),

                Text("faça login para continuar", style: 
                TextStyle(
                  color: Colors.grey,
                  fontSize: 15
                )),

                SizedBox(height: 30,),

                StreamBuilder<FieldState>(
                  stream: _loginBloc.outEmail,
                  initialData: FieldState(),
                  builder:(context, snapshot){
                    return  TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                      labelText: 'email', 
                      prefixIcon: Icon(Icons.email,  color: Theme.of(context).primaryColor,),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(style: BorderStyle.solid, color: Theme.of(context).primaryColor, width: 1),
                      ),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorText: snapshot.data.error,
                      ),
                      onChanged: _loginBloc.changeEmail,
                      enabled: snapshot.data.enabled, 
                    );
                  } ,
                ),

                SizedBox(height: 10,),
                
                StreamBuilder<FieldState>(
                  stream: _loginBloc.outPassword,
                  initialData: FieldState(),
                  builder: (context, snapshot){
                  return TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                    labelText: 'senha', 
                    prefixIcon: Icon(Icons.lock_outline,  color: Theme.of(context).primaryColor,),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(style: BorderStyle.solid, color: Theme.of(context).primaryColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorText: snapshot.data.error,
                    ),
                     onChanged: _loginBloc.changePassword,
                    enabled: snapshot.data.enabled, 
                  );
                }),
                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("Esqueceu a senha?", style: 
                  TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15
                  )),
                ),

                SizedBox(height: 40),

                LoginButton(_loginBloc),

                SizedBox(height:40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text("Ainda não possui uma conta?"),
                      SizedBox(width: 5,),
                      Text("Crie uma conta", style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ))
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}