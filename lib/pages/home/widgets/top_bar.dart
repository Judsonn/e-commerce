import 'package:e_comerce/pages/filter/filter_page.dart';
import 'package:e_comerce/pages/home/widgets/bar_button.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BarButton(
          label: "Categoria",
          onPressed: (){
            
          },
        ),
        
        BarButton(
          label: "Filtros",
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FilterPage()
              ),
            );
          },
        ),
      ],
    );
  }
}
