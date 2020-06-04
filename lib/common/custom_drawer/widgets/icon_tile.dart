import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({this.label, this.iconData, this.onTap, this.highlighted });
  
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
      label, 
      style: TextStyle(
        //fala implementar
        color: Colors.white,
        letterSpacing: 0.8,
      ),
      ),
      leading: Icon(
      iconData,
      color: highlighted ? Colors.black45 : Colors.white,

      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20,15,10,0),
    );
  }
}