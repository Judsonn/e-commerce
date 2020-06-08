import 'package:e_comerce/bloc/register/register_bloc.dart';
import 'package:e_comerce/pages/login/login_page.dart';
import 'package:e_comerce/pages/register/widgets/field_title.dart';
import 'package:e_comerce/pages/register/widgets/password_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterBloc _registerBloc;

  void initState() {
    super.initState();
    _registerBloc = RegisterBloc();
  }

  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Cadastrar",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),
        ),
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<SignUpBlocState>(
            stream: _registerBloc.outState,
            builder: (context, snapshot) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: <Widget>[
                  const FieldTitle(
                    title: "Nome",
                    subTitle: "Como aparecerá em seus anúncios",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Exemplor: João Silva'),
                    validator: (text) {
                      if (text.length < 6) return 'Nome muito curto';
                      return null;
                    },
                    onSaved: _registerBloc.setName,
                    enabled: snapshot.data.state != RegisterState.LOADING,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  const FieldTitle(
                    title: "Email",
                    subTitle: "Enviaremos um e-mail de confimação ",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Theme.of(context).primaryColor,
                              width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Exemplo: joaosilva@gmail.com'),
                    validator: (text) {
                      if (text.length < 6 || !text.contains('@'))
                        return 'E-mail invalido';
                      return null;
                    },
                    onSaved: _registerBloc.setEmail,
                    enabled: snapshot.data.state != RegisterState.LOADING,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  const FieldTitle(
                    title: "Senha",
                    subTitle: "Use letras, números e caracteres especiais  ",
                  ),
                  PasswordField(
                    onSaved: _registerBloc.setPassword,
                    enabled: snapshot.data.state != RegisterState.LOADING,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    height: 50,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      disabledColor: Colors.green[100],
                      child: snapshot.data.state == RegisterState.LOADING?
                      CircularProgressIndicator() :
                       Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: _signUp,
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Você já possui uma conta ?"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Entrar",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline)),
                      )
                    ]),
                ],
              );
            }),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _registerBloc.SignUp();
    }
  }
}
