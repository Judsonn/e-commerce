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
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)
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