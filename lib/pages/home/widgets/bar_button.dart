import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
const BarButton({this.onPressed,  this.label}); 

final String label;
final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,

        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
               offset: Offset(0, 5),
               color: Colors.black26,
               blurRadius: 5
              )
            ]
            
          ),
          
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black45
            ),
          ),
        ),
        
      ),
    );
  }
}