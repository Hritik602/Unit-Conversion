import 'package:flutter/material.dart';

import 'Screen/responsive_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Conversion',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0.0,
            color: Color.fromRGBO(
              82,
              87,
              93,
              1.0,
            )),
        primaryTextTheme: const TextTheme(),
        textTheme: const TextTheme(headline6: TextStyle(color: Colors.white)),
        iconTheme:
            const IconThemeData(color: Color.fromRGBO(255, 180, 35, 1.0)),
        cardColor: const Color.fromRGBO(0, 0, 0, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(82, 87, 93, 1.0),
      ),
      home: const ResponsiveUI(),
    );
  }
}
