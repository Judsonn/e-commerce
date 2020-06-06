import 'package:rxdart/rxdart.dart';

class HomeBloc {
//BehavioSubject é um StreamController especial que captura o item mais recente que foi adicionado ao 
//controlador e o emite como o primeiro item para qualquer novo ouvinte.
  final BehaviorSubject<String> _searchController = BehaviorSubject<String>();

//pega a string pesquisada pelo usuário.
  Stream<String> get outSearch => _searchController.stream;


  void setSearch(String search){
    _searchController.add(search);
  }

  void dispose(){
    _searchController.close();
  }
}