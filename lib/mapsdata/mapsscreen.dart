import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/homescreen/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MapsScreen extends StatelessWidget {
  static const String routeName = '/MapsScreen';

  final String url = 'https://www.bing.com/covid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: ClipPath(
      //   clipper: MyCustomClipper(),
      //   child: AppDrawer(),
      // ),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MainPage()));
              },
              child: Text("home"))
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "COVID DATA",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: WebviewScaffold(
        url: url,
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
