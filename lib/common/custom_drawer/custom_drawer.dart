
import 'package:e_comerce/common/custom_drawer/widgets/custom_header.dart';
import 'package:e_comerce/common/custom_drawer/widgets/icon_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Theme.of(context).primaryColor,
            Colors.green[50],            
          ])
        ),
        child: ListView(
          children: <Widget>[
            CustomHeader(),
            SizedBox(height: 10,),
            IconSection(),
          ],
        ),
      ),
    );
  }
}