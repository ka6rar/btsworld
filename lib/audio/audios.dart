import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:btsworld/audio/custom.list_title.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  const Audio({Key? key}) : super(key: key);
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  @override
  String currentTitle = '';
  String currentCover = '';
  String currentSinger = '';
  IconData iconData = Icons.pause;

  Duration duration = Duration();
  Duration postion = Duration();
  bool payhind = false;
  //now lets create the plaey
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currenSong = "";
  void playMusic(String url) async {
    if (isPlaying && currenSong != url) {
      audioPlayer.pause();
      int resuly = await audioPlayer.play(url);
      if (resuly == 1) {
        setState(() {
          currenSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying == true;
        });
      }
    }
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        postion = event;
      });
    });
  }

  void changeToSecond(int second) {
    Duration duration = Duration(seconds: second);
    this.audioPlayer.seek(duration);
  }



 // Future<List> testdata() async {
 //  var response =
 //  await http.get(Uri.parse('https://sdkararjat68.000webhostapp.com'));
 //  return jsonDecode( response.body);
 //  }
 //
 //  @override
 //  void initState() {
 //  testdata();
 //  super.initState();
 //  }
  List listMusc = [
    {
      'title': "Abyss",
      'singer': 'Jin',
      'url': "https://www.mboxdrive.com/sq.mp3",
      'coverurl':"https://i1.sndcdn.com/artworks-9aYnjcomZDYnFNKV-ui25lA-t500x500.jpg",
    },
    {
      'title': "Adrift",
      'singer': 'RM',
      'url': "https://www.mboxdrive.com/adrift-rm.mp3",
      'coverurl':"https://i1.sndcdn.com/artworks-nmDgbCRpwBz2fLai-4PFQyQ-t500x500.jpg",
    },
  ];
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1c36),
      appBar: AppBar(
        title: const Text('الاغاني'),
        elevation: 0,
        backgroundColor: const Color(0xff0e1c36),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: listMusc.length,
            itemBuilder: (context, index) => customListTole(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      audioPlayer.stop(); // this add new stoe paler

                      playMusic(listMusc[index]['url']);
                      payhind = true;
                      currentTitle = listMusc[index]['title'];
                      currentSinger = listMusc[index]['singer'];
                      currentCover = listMusc[index]['coverurl'];
                    });
                  }
                },
                title: listMusc[index]['title'],
                singer: listMusc[index]['singer'],
                covers: listMusc[index]['coverurl']),
          )),
          if (payhind == true)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Color(0x552112121), blurRadius: 8.0)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: Text(duration.toString().split('.')[0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 10),
                        child: Text(postion.toString().split('.')[0]),
                      )
                    ],
                  ),
                  Slider(
                      value: duration.inSeconds.toDouble(),
                      max: postion.inSeconds.toDouble(),
                      min: 0.0,
                      activeColor: Colors.redAccent,
                      onChanged: (double value) {
                        setState(() {
                          changeToSecond(value.toInt());
                          value = value;
                        });
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 12, right: 12),
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(currentCover),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            currentTitle,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            currentSinger,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      )),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                audioPlayer.onSeekComplete();
                              },
                              icon: const Icon(Icons.arrow_back)),
                          IconButton(
                              onPressed: () {
                                if (isPlaying) {
                                  audioPlayer.pause();
                                  setState(() {
                                    iconData = Icons.play_arrow;
                                    isPlaying = false;
                                  });
                                } else {
                                  audioPlayer.resume();
                                  setState(() {
                                    iconData = Icons.pause;
                                    isPlaying = true;
                                  });
                                }
                              },
                              icon: Icon(
                                iconData,
                                color: Colors.grey,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {
                                this.audioPlayer.setPlaybackRate(1.5);
                              },
                              icon: Icon(Icons.arrow_forward)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
