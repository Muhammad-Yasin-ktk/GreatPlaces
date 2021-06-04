import 'package:flutter/material.dart';
import 'package:greatplaces/provider/greate_place.dart';
import 'package:greatplaces/screens/add_place.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatefulWidget {
  @override
  _PlaceListState createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatePlace>(
        builder: (ctx, greatPlace, _) {
          return greatPlace.item.length <= 0
              ? Center(child: Text('Got no places Yet,start adding some!'))
              : ListView.builder(
                  itemCount: greatPlace.item.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            FileImage(greatPlace.item[index].image),
                      ),
                      title: Text(greatPlace.item[index].title),
                    );
                  },
                );
        },
      ),
    );
  }
}
