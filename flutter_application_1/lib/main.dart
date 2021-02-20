import 'package:flutter/material.dart';
import 'agreement.dart' as fullDialog;
import 'gmap.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
// import 'package:flutter_native_config/flutter_native_config.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    // theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightBlue[100],
  accentColor: Colors.redAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Center(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        onPressed: () {
          _openAgreeDialog(context);
        },
        child:
            const Text('Click to get Started!', style: TextStyle(fontSize: 20)),
        color: Colors.lightBlue[100],
        textColor: Colors.white,
        elevation: 5,
      ),
    );
  }

  Future _openAgreeDialog(context) async {
    String result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return fullDialog.CreateAgreement();
        },
        //true to display with a dismiss button rather than a return navigation arrow
        fullscreenDialog: true));
    if (result != null) {
      letsDoSomething(result, context);
    } else {
      print('you could do another action here if they cancel');
    }
  }

  letsDoSomething(String result, context) {
    print('User agreed.');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MapsPage())); //prints 'User Agreed'
  }
}

class MapsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoogleMaps Demo',
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}
