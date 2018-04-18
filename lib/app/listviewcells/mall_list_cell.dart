import 'package:flutter/material.dart';
import 'package:beco_flutter/app/models/store.dart';
import 'package:latlong/latlong.dart';

class MallListCell extends StatelessWidget {
  const MallListCell(this.mall,this.currentLoc);
  final Store mall;
  final Map currentLoc;
  @override
  Widget build(BuildContext context) {

    String getDeviceResolution() {
      print('_wide'+MediaQuery.of(context).devicePixelRatio.round().toString()+'x');
      return '_wide'+MediaQuery.of(context).devicePixelRatio.round().toString()+'x';
    }


    return new Container(
      height: 200.0,
      margin: new EdgeInsets.only(top: 5.0, bottom: 5.0),
      decoration: new BoxDecoration(
        color: Colors.black,
        image: new DecorationImage(
          image: new NetworkImage(mall.image_url[0]+getDeviceResolution()+mall.image_url[1]),
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5),
              BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  mall.name,
                  style: new TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
                new Text(
                  mall.address[1],
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'),
                ),
              ],
            ),
            height: 170.0,
          ),
          Container(
            child: buildButtonRow(),
            padding: new EdgeInsets.only(left: 8.0,right: 8.0),
          )
        ],
      ),
    );
  }

  Stack buildButtonRow() {

    String getDistance() {
      final Distance distance = new Distance();
      final double km = distance.as(LengthUnit.Meter,
          new LatLng(currentLoc['latitude'],currentLoc['longitude']),new LatLng(mall.geo['lat'],mall.geo['lng']))/1000;
          return km.toStringAsFixed(1)+' kms';
    }

    return new Stack(
      children: [
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Image(image: new AssetImage('assets/ic_store_count.png'),height: 14.0,),
            new Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: new Text(
                mall.store_count.toString()+' stores',
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Image(image: new AssetImage('assets/ic_deal_count.png'),height: 14.0,),
            new Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: new Text(
                mall.deal_count.toString()+' deals',
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Image(image: new AssetImage('assets/ic_distance.png'),height: 14.0,),
            new Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: new Text(
                getDistance(),
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


}
