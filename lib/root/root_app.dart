import 'package:e_comerce/bloc/drawer_bloc.dart';
import 'package:e_comerce/pages/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green[200],
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            focusColor: Colors.white, 
            contentPadding: EdgeInsets.all(20),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(style: BorderStyle.solid),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),
          ),
        ),
        home: BaseScreen(),
      ),
    );
  }
}
