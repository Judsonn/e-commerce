import 'package:e_comerce/pages/adverts/widgets/image_source_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: [],
      builder: (state) {
        return Column(
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.value.length)
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ImageSourceSheet(
                              (image) {
                                if(image!=null)
                                  state.didChange(state.value..add(image));
                                  Navigator.of(context).pop();
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
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
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  return GestureDetector(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 16),
                          child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(300),
                                image: DecorationImage(
                                    image: FileImage(state.value[index]),
                                    fit: BoxFit.cover),
                              ))));
                },
              ),
            )
          ],
        );
      },
    );
  }
}
