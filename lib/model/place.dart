import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/model/place_location.dart';

class Place {
  final String id;
  final String title;
  final PlaceLocation placeLocation;
  final File image;

  Place({
    this.image,
    this.id,
    this.placeLocation,
    this.title,
  });
}
