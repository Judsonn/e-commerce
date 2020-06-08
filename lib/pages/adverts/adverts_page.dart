import 'package:e_comerce/common/custom_drawer/custom_drawer.dart';
import 'package:e_comerce/pages/adverts/widgets/images_field.dart';
import 'package:flutter/material.dart';

class AdvertsPage extends StatefulWidget {
  @override
  _AdvertsPageState createState() => _AdvertsPageState();
}

class _AdvertsPageState extends State<AdvertsPage> {

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          "Inserir Anúncio",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45),
        ),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            ImagesField(),
          ],
        ),
      )
    );
  }
}