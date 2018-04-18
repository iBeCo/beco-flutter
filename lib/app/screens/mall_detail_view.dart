import 'package:flutter/material.dart';

class MallDetailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MallDetailViewState();
  }

}

class MallDetailViewState extends State<MallDetailView> {
  @override
  // TODO: implement context
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new Title(color: Colors.white, child: new Text('Mall Detail'))
        ],
      ),
    );

  }
}
