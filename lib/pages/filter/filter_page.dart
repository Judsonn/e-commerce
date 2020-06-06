import 'package:e_comerce/models/filter_model.dart';
import 'package:e_comerce/pages/filter/widgets/order_by_field.dart';
import 'package:e_comerce/pages/filter/widgets/section_title.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Filtrar Buscas", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black45
        ),),
      ),

      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const SectionTitle(title:"Ordernar por"),
                OrderByField(
                  initialValue: OrderBy.DATE,
                  onSaved: (v){

                  }
                ),
                const SectionTitle(title:"Preço(R\$)"),
                const SectionTitle(title:"Tipo de anunciante"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}