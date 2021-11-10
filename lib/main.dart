import 'package:btsworld/audio/audios.dart';
import 'package:btsworld/image/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية', style: GoogleFonts.cairo()),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.pinkAccent),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Audio(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.music_note_outlined,
                          size: 50,
                          color: Colors.amberAccent,
                        ),
                        Text('اغاني',
                            style: GoogleFonts.cairo(
                                fontSize: 20, color: Colors.amber))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Images(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image_outlined,
                          size: 50,
                          color: Colors.green,
                        ),
                        Text('صور',
                            style: GoogleFonts.cairo(
                                fontSize: 20, color: Colors.green))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.new_releases,
                        size: 50,
                        color: Colors.blueGrey,
                      ),
                      Text('اخبار',
                          style: GoogleFonts.cairo(
                              fontSize: 20, color: Colors.blueGrey))
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.slow_motion_video_rounded,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                      Text('فديوات',
                          style: GoogleFonts.cairo(
                              fontSize: 20, color: Colors.redAccent))
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
