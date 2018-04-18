import 'package:flutter/material.dart';
import 'package:beco_flutter/app/listviewcells/mall_list_cell.dart';
import 'package:beco_flutter/app/config/injector.dart';
import 'package:beco_flutter/app/models/store.dart';
import 'package:location/location.dart';
import 'dart:async';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return new AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  List<Store> _stores;
  bool _isLoading;
  var currentLocation = <String, double>{};
  var _location = new Location();
  StreamSubscription<Map<String, double>> locationSubscription;

  @override
  void initState() {
    super.initState();
    fetchMalls();
    _isLoading = true;
    locationSubscription =
        _location.onLocationChanged.listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
        print(currentLocation['latitude']);
        print(currentLocation['longitude']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Widget app;
    if (_isLoading) {
      app = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      app = new Scaffold(
          drawer: new Drawer(
            child: new ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new Text('Drawer Headers'),
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                new ListTile(
                  title: new Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  title: new Text('Item 2'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: new Padding(
            padding: new EdgeInsets.only(top: statusBarHeight),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: kToolbarHeight,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'locationView');
                          },
                          child:
                              buildButtonRow(Icons.arrow_drop_down, 'Nearby'))
                    ],
                  ),
                ),
                Expanded(
                  child: new ListView.builder(
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                        child:
                            new MallListCell(_stores[index], currentLocation),
                        onTap: () {
                          print('tapped');
                          Navigator.of(context).pushNamed('locationView');
                        },
                      );
                    },
                    itemCount: _stores.length,
                  ),
                )
              ],
            ),
          ));
    }
    return app;
  }

  // Builds the Nearby Location Button.
  Row buildButtonRow(IconData icon, String label) {
    Color color = Colors.black54;
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ),
        new Icon(icon, color: color),
      ],
    );
  }

  void fetchMalls() async {
    Injector _injector = new Injector();
    List<Store> store =
        await _injector.apiClient.fetchMalls("10.026416", "76.307522");
    setState(() {
      _stores = store;
      _isLoading = false;
    });
  }
}
