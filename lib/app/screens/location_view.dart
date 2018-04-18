import 'package:flutter/material.dart';

class LocationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LocationViewState();
  }
}

class LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          title: new Text(
            'Locations',
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        body: new Column(
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                buildButtonRow(Icons.my_location, 'Use Current Location')
            ),
            new Divider(height: 2.0,color: Colors.black26,),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  padding: new EdgeInsets.only(left: 25.0,top: 15.0),
                  color: Colors.white70,
                    child: new Text(
                      'NearBy Places',
                      style: new TextStyle(color: Colors.black45),
                    ),

                )

              ],
        ));
  }

  Container buildButtonRow(IconData icon, String label) {
    return Container(
      height: 50.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Icon(
            icon,
            color: Colors.black87,
          ),
          new Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

//  ListView buildListView() {
//    return new ListView();
//  }
}
