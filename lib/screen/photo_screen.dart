import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen(String url) {
    img = Image.network(
      url,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Image img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: img,
        ),
      ),
    ));
  }
}
