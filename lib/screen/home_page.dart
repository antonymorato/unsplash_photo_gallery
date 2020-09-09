import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_photo_gallery/model/model.dart';
import 'package:unsplash_photo_gallery/unsplash_api/api_config.dart';

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
  List<Photo> photos = List<Photo>();


  _textChange(String text){
    var data=[];
    if(text=='')
      ApiConfig.getListOfPhotos().then((res) =>setState((){photos=res;}));
    else
      ApiConfig.getPhotoByKeyword(text).then((res) =>setState((){photos=res;}));
  }

  @override
  void initState(){
    super.initState();
    ApiConfig.getListOfPhotos()
    .then((data) => setState((){photos=data;}))
    .catchError((onError)=>print(onError));
  
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Padding(

      padding: EdgeInsets.only(top:50),
      child: TextField(
        onChanged: (value)=>{_textChange(value)},
        decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      prefixIcon: Icon(Icons.search),
      hintText: 'Search photo by keyword'
  ),
        
      ),
    ),
    Visibility(
      visible:photos.length>0,
      child:  Expanded(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
                        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                        itemCount: photos.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return PhotoTile(photos[index]);
                        }),
        ),
      ),)
    ],
    );
  }
}