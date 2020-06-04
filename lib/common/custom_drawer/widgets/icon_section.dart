import 'package:e_comerce/common/custom_drawer/widgets/icon_tile.dart';
import 'package:flutter/material.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: "Anúncios",
          iconData: Icons.library_books,
          onTap: (){
          },
          highlighted: true,
        ),
        IconTile(
          label: "Inserir Anúncios",
          iconData: Icons.edit,
          onTap: (){
          },
          highlighted: false,
        ),
        IconTile(
          label: "Chat",
          iconData: Icons.chat_bubble_outline,
          onTap: (){
          },
          highlighted: false,
        ),
        IconTile(
          label: "Favoritos",
          iconData: Icons.favorite_border,
          onTap: (){
          },
          highlighted: false,
        ),
        IconTile(
          label: "Minha Conta",
          iconData: Icons.person_outline,
          onTap: (){
          },
          highlighted: false,
        ),
      ],
    );
  }
}