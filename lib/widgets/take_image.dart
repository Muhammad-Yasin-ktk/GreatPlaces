import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as p;

class TakeImage extends StatefulWidget {
  final Function onselectImage;
  TakeImage(this.onselectImage);
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File _imageFile;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
if(pickedFile==null){
  return;
}
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {

        print('No image selected.');
      return;
      }
    });
    Directory appDocDir = await syspath.getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final fileName=p.basename(pickedFile.path);
    final savedImage=await _imageFile.copy('$appDocPath/$fileName');
widget.onselectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _imageFile == null
              ? Text('No Image Taken')
              : Image.file(
                  _imageFile,
                  fit: BoxFit.cover,
            width: double.infinity,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.camera,
            ),
            onPressed: getImage,
            label: Text('Take Picture'),
          ),
        )
      ],
    );
  }
}
