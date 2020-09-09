import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_photo_gallery/model/model.dart';
import 'package:unsplash_photo_gallery/unsplash_api/unsplash_api.dart';

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
      UnsplashApi.getListOfPhotos().then((res) =>setState((){photos=res;}));
    else
      UnsplashApi.getPhotoByKeyword(text).then((res) =>setState((){photos=res;}));
  }

  @override
  void initState(){
    super.initState();
    UnsplashApi.getListOfPhotos()
    .then((data) => setState((){photos=data;}))
    .catchError((onError)=>print(onError));
  
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Column(children: [
      Padding(

        padding: EdgeInsets.only(top:40),
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
      ),
    );
  }
}