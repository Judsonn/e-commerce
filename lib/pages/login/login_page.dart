import 'package:e_comerce/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

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
                   padding: const EdgeInsets.only(top: 60, bottom: 20),
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

                SizedBox(height: 40,),
                StreamBuilder(
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
                      ),
                  
                    );
                  } ,
                ),

                SizedBox(height: 10,),
                StreamBuilder(
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
                    ),
                 
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

                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage(),
                  )),
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("LOGIN", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      )),
                    ),
                  ),
                ),

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