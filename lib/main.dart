import 'package:flutter/material.dart';
import 'package:iwaiter/pages/tabs.page.dart';
import 'package:iwaiter/themes/dark.theme.dart';
import 'package:iwaiter/themes/light.theme.dart';
import 'package:iwaiter/pages/slides.page.dart';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: new Home(),
    );
  }

}



