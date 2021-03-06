import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({this.title, this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '$title ',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$subTitle ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
