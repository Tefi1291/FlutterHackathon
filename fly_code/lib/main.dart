import 'package:flutter/material.dart';
import 'package:fly_code/searchForm.dart';
import 'package:fly_code/Search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '#FlyCode',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),

      /// aca definimos las rutas de nuestra app
      /// para referenciarlas por nombre
      routes: <String, WidgetBuilder>{
        '/search': (BuildContext context) => SearchPage(''),
      },
      home: HomePage(title: 'FlyCode'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  final String searchTextHeader = "Type your query about flutter:";

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//                Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Container(
//                        child: Center(child: Image.asset('assets/flycode.jpg', fit: BoxFit.fill,)),
//                        margin: EdgeInsets.symmetric(vertical: 60.0),
//                        width: 28.0,
//                      ),
//                    ),
//                  ],
//                ),
                Text(
                  this.searchTextHeader,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.title,
                ),
                SearchForm()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
