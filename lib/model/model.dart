
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo{

  Photo(this.id,this.name,this.authorName,this.urls);

  Photo.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['description'] ?? 'No name';
    authorName=json['user']['name'] ?? 'Unknown';
    urls=json['urls'];
  }

  String id;
  String name;
  String authorName;
  Map<String,dynamic> urls; 
}


class PhotoTile extends StatelessWidget{
  
  PhotoTile(Photo val):photo=val{
    img=Image.network(val.urls['small']);

  }
  
  final Photo photo;
  Image img;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(top:10,bottom:10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.elliptical(10,10)),
      // gradient: LinearGradient(
        // colors: [Colors.white,Colors.lightBlue]
        // )
    ),
    child:ListTile(
      title: Text(photo.name),
      subtitle: Text(photo.authorName),
      leading: SizedBox(width:img.width,height: img.height,child:img)
    ),
  );
  
  }

}