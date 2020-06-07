import 'package:e_comerce/models/filter_model.dart';
import 'package:flutter/material.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField({this.onSaved, this.initialValue});

  final FormFieldSetter<int> onSaved;
  final int initialValue;


  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state){
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                if(state.value & VENDOR_TYPE_PARTICULAR !=0){
                  if(state.value & VENDOR_TYPE_PROFISSIONAL != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PARTICULAR);
                  else
                  state.didChange(VENDOR_TYPE_PROFISSIONAL);  
                }else{
                  state.didChange(state.value | VENDOR_TYPE_PARTICULAR);
                }
              },  
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: state.value & VENDOR_TYPE_PARTICULAR != 0 ? Colors.black45 : Theme.of(context).primaryColor),
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0 ? Theme.of(context).primaryColor : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text("Particular", 
                style: TextStyle(
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0 ? Colors.white : Colors.black45
                ),),
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                if(state.value & VENDOR_TYPE_PROFISSIONAL !=0){
                  if(state.value & VENDOR_TYPE_PARTICULAR != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PROFISSIONAL);
                  else
                  state.didChange(VENDOR_TYPE_PARTICULAR);  
                }else{
                  state.didChange(state.value | VENDOR_TYPE_PROFISSIONAL);
                }

              },  
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: state.value & VENDOR_TYPE_PROFISSIONAL != 0 ? Colors.black45 : Theme.of(context).primaryColor),
                 color: state.value & VENDOR_TYPE_PROFISSIONAL != 0 ? Theme.of(context).primaryColor : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text("Profissional", 
                style: TextStyle(
                  color: state.value & VENDOR_TYPE_PROFISSIONAL != 0 ? Colors.white : Colors.black45
                ),),
              ),
            ),
          ],
        );
      }
    );
  }
}