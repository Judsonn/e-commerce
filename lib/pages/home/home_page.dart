import 'package:e_comerce/bloc/home_page_bloc.dart';
import 'package:e_comerce/common/custom_drawer/custom_drawer.dart';
import 'package:e_comerce/pages/home/widgets/search_dialog.dart';
import 'package:e_comerce/pages/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

HomeBloc _homeBloc ;

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  
  final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
  if(homeBloc != _homeBloc)
    _homeBloc = homeBloc;
}



  Widget build(BuildContext context) {

    _operSearch(String currentSearch) async {
     final String search = await showDialog(context: context,
      builder: (context) =>  SearchDialog(currentSearch: currentSearch), 
      );
      if(search != null)
        _homeBloc.setSearch(search);
    }
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
       title: StreamBuilder<String>(
        stream: _homeBloc.outSearch,
        //inicar o search com um texto vazio, pra não da problema de null
        initialData: "",
        builder: (context, snapshot){
          //reconhece o que foi pesquisado e add no appBar
          if(snapshot.data.isEmpty)
          return Container();
          else
          //gesture para conseguir abrir a pesquisa clicando no texto 
          return GestureDetector(
            onTap: () => _operSearch(snapshot.data),
            child: LayoutBuilder(
              builder: (context, constraints){
                //containe é pra definir o damanho do local clicavel, ele usa o constrains para 
                //aproveitar o tamanho máximo clicavel
                  return Container(
                    child: Text(snapshot.data, style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 20),),
                    width: constraints.biggest.width,
                  );
              } 
              ),
          );
        },
       ), 
         actions: <Widget>[
           //trocando os icon de lupa para close depois de ter pesquisado alguma coisa 
          StreamBuilder<String>(
            stream: _homeBloc.outSearch,
            initialData: "",
            builder: (context, snapshot) {
              if(snapshot.data.isEmpty)
              return  IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                _operSearch("");
                },
             );

             else
             return  IconButton(
              icon: Icon(Icons.close),
              onPressed: (){
                _homeBloc.setSearch(''); 
             },
             );
            },
          )
         ]
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
        TopBar(),
      ]
      ),
    );
  }
}