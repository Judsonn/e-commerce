import 'package:e_comerce/models/filter_model.dart';
import 'package:flutter/material.dart';

class OrderByField extends StatelessWidget {
  @override
  const OrderByField({this.onSaved, this.initialValue});

  final FormFieldSetter<OrderBy> onSaved;
  final OrderBy initialValue;

  
  Widget build(BuildContext context) {
    return FormField<OrderBy>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state){ 
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                state.didChange(OrderBy.DATE);
              },  
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: state.value == OrderBy.DATE ? Colors.black45 : Theme.of(context).primaryColor),
                  color: state.value == OrderBy.DATE ? Theme.of(context).primaryColor : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text("Data", 
                style: TextStyle(
                  color: state.value == OrderBy.DATE ? Colors.white : Colors.black45
                ),),
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                state.didChange(OrderBy.PRICE);
              },  
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: state.value == OrderBy.PRICE ? Colors.black45 : Theme.of(context).primaryColor),
                 color: state.value == OrderBy.PRICE ? Theme.of(context).primaryColor : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text("Preço", 
                style: TextStyle(
                  color: state.value == OrderBy.PRICE ? Colors.white : Colors.black45
                ),),
              ),
            ),
          ],
        );
      }
    );
  }
}