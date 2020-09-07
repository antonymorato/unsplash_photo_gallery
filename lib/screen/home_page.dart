import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );    
  }

}


class HomePageBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>HomePageBodyState();
  
}

class HomePageBodyState extends State<HomePageBody>{
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [TextField(),ListView()],),);
  }
}