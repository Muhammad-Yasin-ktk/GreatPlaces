import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:greatplaces/model/place.dart';

class GreatePlace with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get item {
    return [..._items];
  }

  addPlace(String title, File image) {
    final addNewPlace = Place(
        image: image,
        title: title,
        id: DateTime.now().toString(),
        placeLocation: null);
    _items.add(addNewPlace);
    notifyListeners();
  }
}
