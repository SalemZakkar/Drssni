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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xff1114D4), primarySwatch: Colors.blue),
      title: 'Drssni App',

      home: const MainPage(),
    );
  }
}
