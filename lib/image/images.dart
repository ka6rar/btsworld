
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text('الصور' , style: GoogleFonts.cairo()),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => Container(
            color: Colors.green,
            child:  Center(
              child:  CircleAvatar(
                backgroundColor: Colors.white,
                child:  Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
         StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
