import 'package:flutter/material.dart';
import 'package:greatplaces/provider/greate_place.dart';
import 'package:greatplaces/screens/add_place.dart';
import 'package:greatplaces/screens/place_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlace(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlaceList(),
        routes: {
          AddPlace.routeName:(ctx)=>AddPlace(),
        },
      ),
    );
  }
}