import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceRangeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(style: BorderStyle.solid, color: Theme.of(context).primaryColor, width: 1),
            ),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
              hintText: 'Min'
            ),

            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              //campo só aceita digitos 
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],

            initialValue: null,
            onSaved: (s){

            },

            validator: (s){
              return null;
            },
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(style: BorderStyle.solid, color: Theme.of(context).primaryColor, width: 1),
            ),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
              hintText: 'Max'
            ),

            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              //campo só aceita digitos 
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],

            initialValue: null,
            onSaved: (s){

            },

            validator: (s){
              return null;
            },
          ),
        ),
      ],
    );
  }
}