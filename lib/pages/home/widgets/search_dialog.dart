import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  @override

  SearchDialog({this.currentSearch});
  final String currentSearch;

  _SearchDialogState createState() => _SearchDialogState(currentSearch);
}

class _SearchDialogState extends State<SearchDialog> {

  _SearchDialogState(String currentSearch) :
    _controller = TextEditingController(text: currentSearch);

  final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          bottom: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back), 
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){
                      _controller.clear();
                    },
                  )
              ),
              onSubmitted: (text){ 
                Navigator.of(context).pop(text);
              },

            ),
          ),
        )
      ],
    );
  }
}