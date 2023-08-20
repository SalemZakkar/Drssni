import 'package:darssni2/main_page.dart';
import 'package:flutter/material.dart';

class DrssniApp extends StatefulWidget {
  const DrssniApp({Key? key}) : super(key: key);

  @override
  State<DrssniApp> createState() => _DrssniAppState();
}

class _DrssniAppState extends State<DrssniApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, primarySwatch: Colors.blue),
      title: 'Drssni App',
      home: const MainPage(),
    );
  }
}
