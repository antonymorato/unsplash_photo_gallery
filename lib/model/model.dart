import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_photo_gallery/screen/photo_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Photo {
  Photo(this.id, this.name, this.authorName, this.urls);

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['description'] ?? 'No name';
    authorName = json['user']['name'] ?? 'Unknown';
    urls = json['urls'];
  }

  String id;
  String name;
  String authorName;
  Map<String, dynamic> urls;
}

class PhotoTile extends StatelessWidget {
  PhotoTile(Photo val) : photo = val {
    img = Image.network(val.urls['small']);
  }

  final Photo photo;
  Image img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
        // gradient: LinearGradient(
        // colors: [Colors.white,Colors.lightBlue]
        // )
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotoScreen(photo.urls['regular']))),
        child: ListTile(
            title: Text(
              photo.name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ledger(),
            ),
            subtitle: Text(
              'By:${photo.authorName}',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(),
            ),
            leading: SizedBox(width: 100, height: img.height, child: img)),
      ),
    );
  }
}
