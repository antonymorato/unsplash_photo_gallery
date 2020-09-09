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
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value)=>{print(value)},
        decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      prefixIcon: Icon(Icons.search),
      hintText: 'Search photo by keyword'
  ),
        
      ),
    ),],);
  // ListView(children: [Text("Some")],)
  }
}