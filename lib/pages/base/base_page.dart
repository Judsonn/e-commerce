import 'dart:async';
import 'package:e_comerce/bloc/drawer_bloc.dart';
import 'package:e_comerce/pages/adverts/adverts_page.dart';
import 'package:e_comerce/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override


final PageController  _pageController =  PageController(); 

  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubscription;


  @override
//função para trocar as telas de acordo com o escolhido no drawer, o did foi usado pelo fato do bloc
//pedir um context.,
  void didChangeDependencies() {
    
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if(drawerBloc != _drawerBloc){
      _drawerBloc = drawerBloc;

      _drawerSubscription?.cancel();
      _drawerSubscription =  _drawerBloc.outPage.listen((page) {
        try{
        _pageController.jumpToPage(page);
        }catch(e){}
       });
    }
   
  }
  void dispose(){
    _drawerSubscription.cancel();
    super.dispose();
  }


  Widget build(BuildContext context) {
  
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // bloqueia o scrool para os lados 
        children: <Widget>[
          HomePage(),
          AdvertsPage(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}