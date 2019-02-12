import 'package:flutter/material.dart';
import 'import.dart';
import 'gallery.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch(pos){
      case 0: return Import();
      case 1: return Gallery();
    }
  }

  _onSelectItem(int pos) {
    setState(() => _selectDrawerIndex = pos);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Joseph León'),
              accountEmail: Text('joseph@tera.pe'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("J", style: TextStyle(fontSize: 40.0),),
              ),
            ),
            ListTile(
              title: Text('Import'),
              leading: Icon(Icons.import_export),
              onTap: (){
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.photo),
              onTap: (){
                _onSelectItem(1);
              },
            )
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerIndex),
    );
  }
}