import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_photo_gallery/screen/home_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.lerp(ThemeData.light(), ThemeData.dark(), 3),
      home:HomePage() ,);
  }

}