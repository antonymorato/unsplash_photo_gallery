import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget{
  PhotoScreen(String url){
    img=Image.network(url);
  }

  Image img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:img
      )
    )
    ;
  }

}