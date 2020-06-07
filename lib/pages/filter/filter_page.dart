import 'package:e_comerce/models/filter_model.dart';
import 'package:e_comerce/pages/filter/widgets/animated_button.dart';
import 'package:e_comerce/pages/filter/widgets/order_by_field.dart';
import 'package:e_comerce/pages/filter/widgets/price_range_field.dart';
import 'package:e_comerce/pages/filter/widgets/section_title.dart';
import 'package:e_comerce/pages/filter/widgets/vendor_type_field.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 
  final ScrollController _scrollController = ScrollController();  
  Filter _filter = Filter(
    minPrice: 10,
    maxPrice: 100,
    vendorType: VENDOR_TYPE_PARTICULAR,
    orderBy: OrderBy.DATE
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const SectionTitle(title:"Ordernar por"),
                OrderByField(
                  initialValue: _filter.orderBy,
                  onSaved: (v){
                    _filter.orderBy = v;
                  }
                ),
                const SectionTitle(title:"Preço(R\$)"),
                PriceRangeField(
                  filter: _filter,
                ),
                const SectionTitle(title:"Tipo de anunciante"),
                VendorTypeField(
                initialValue: _filter.vendorType,
                onSaved: (v){
                  _filter.vendorType = v;
                },

                ),
                SizedBox(height: 250,),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: (){
              //checando os validadores e salvando
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();

                if(_filter.minPrice != null && _filter.maxPrice != null ){
                  if(_filter.minPrice > _filter.maxPrice){
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Faixa de preço invalida"),
                        backgroundColor: Colors.black45,
                      )
                    );
                    return;
                  }
                }
                //Salvar tudo e pesquisar anúncios
              }
            },
          ), 
        ],
      ),
    );
  }
}