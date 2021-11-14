
// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:convert';
import 'package:btsworld/image/fullsecraen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override


  Widget build(BuildContext context) {


    Future<List> img_network() async {
      var response = await http.get(Uri.parse('https://sdkararjat68.000webhostapp.com'));
       var  data = response.body;
      return jsonDecode(data);


    }


    return Scaffold(
      backgroundColor: const Color(0xff0e1c36),
      appBar: AppBar(
        elevation: 0,
        title:  Text('الصور' , style: GoogleFonts.cairo()),
        centerTitle: true,
        backgroundColor: const Color(0xff0e1c36),
        foregroundColor:Colors.white ,
      ),
      body:FutureBuilder<List>(
        future: img_network(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData ?   Container(
          child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount:1,
          itemBuilder: (context, index) {
          return DataBackrounds(
          id_image: snapshot.data[index]['id_image'],
          url_image:snapshot.data[index]['url_image'],
          );
          },
          staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          ),
          ) :  Center(child: CircularProgressIndicator()) ;
        },

      ),
    );
  }


}
class DataBackrounds extends StatelessWidget {
   String url_image;
   String  id_image;
  DataBackrounds({required this.url_image,  required this.id_image});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.all(Radius.circular(18)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullSecraen(
                    url_image,
                  )));
        },
        child: Hero(
            tag: id_image,
            child: FadeInImage(
              image: NetworkImage(url_image),
              fit: BoxFit.cover,
              placeholder: AssetImage("img/loding.jpg"),

            )),
      ),
    );
  }
}
