import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Widget _buildBar(int n, String pass) {
      final int level = _calcScore(pass);
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: n <= level? _getColor(level): Colors.transparent,
            border: n > level? Border.all(color: Colors.black45): null,
          ),
        ),
      );
    }

    return FormField<String>(
      initialValue: '',
      builder: (state) {
        return Column(
          children: <Widget>[
            TextFormField(
              obscureText: true,
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
              ),
              onChanged: state.didChange,
            ),
            Container(
              margin: const EdgeInsets.all(8), 
              height: 8,
              child: Row(
                children: <Widget>[
                  _buildBar(0, state.value),
                  _buildBar(1, state.value),
                  _buildBar(2, state.value), 
                  _buildBar(3, state.value)
                ],
              ),
            )
          ],
        );
      },
    );
  }

  int _calcScore(String text) {
    int score = 0;
    if (text.length > 8) 
      score += 1;
    if (text.contains(RegExp(r'[0-9]'))) 
      score += 1;
    if (text.contains(RegExp(r'[A-Z]'))) 
      score += 1;
      return score;   
  }

  Color _getColor(int level){
    switch(level){
      case 0:
       return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green[200];
      case 3:
        return Colors.green[500];
      defauld:
        return Colors.red;
    }
  }
}
