import 'package:flutter/material.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: [],
      builder: (state){
        return Column(
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Theme.of(context).primaryColor, width: 1),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.value.length + 1,
                itemBuilder: (context, index){
                  if(index == state.value.length)
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          height: 110,
                          width:110,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(300),
                            color: Colors.transparent,  
                          // radius: 52,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.black45,
                              ),
                              Text('+ inserir',
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w600
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  return Container();
                },

              ),
            )
          ],
        );
      },
    );
  }
}