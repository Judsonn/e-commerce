import 'package:brasil_fields/brasil_fields.dart';
import 'package:e_comerce/helpers/format_field.dart';
import 'package:e_comerce/models/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({this.filter});
  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
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
                hintText: 'Min'),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              //campo só aceita digitos
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            initialValue: filter.minPrice?.toString(),
            onSaved: (s) {
              if (s.isEmpty)
                filter.minPrice = null;
              else
                filter.minPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return "Ultilize valores validos";
              return null;
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
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
                hintText: 'Max'),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              //campo só aceita digitos
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            initialValue: filter.maxPrice.toString(),
            onSaved: (s) {
              if (s.isEmpty)
                filter.maxPrice = null;
              else
                filter.maxPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s) {
              if (s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return "Ultilize valores validos";
              return null;
            },
          ),
        ),
      ],
    );
  }
}
