import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/provider/greate_place.dart';
import 'package:greatplaces/widgets/take_image.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = 'addplace';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleEditingController = TextEditingController();
  File _pickedImage;

  void _selectImage(File image) {
    _pickedImage = image;
  }

  void _saveImage() {
    if (_titleEditingController.text.trim().isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatePlace>(context)
        .addPlace(_titleEditingController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleEditingController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TakeImage(_selectImage),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            onPressed: _saveImage,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: Text(
              'Add Place',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
