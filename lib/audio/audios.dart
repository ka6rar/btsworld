import 'dart:html';

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
  IconData iconData = Icons.play_arrow;

  Duration duration = Duration();
  Duration postion = Duration();

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
        postion = event;
      });
    });
  }

  List listMusc = [
    {
      'title': "hello wolrd",
      'singer': 'karar',
      'url':
          "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverurl':
          "https://upload.wikimedia.org//wikipedia/en/thumb/8/80/Eminem_-_Music_to_Be_Murdered_By.png/220px-Eminem_-_Music_to_Be_Murdered_By.png",
    }
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاغاني'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: listMusc.length,
            itemBuilder: (context, index) => customListTole(
                onTap: () {
                  playMusic(listMusc[index]['url']);

                  setState(() {
                    currentTitle = listMusc[index]['title'];
                    currentSinger = listMusc[index]['singer'];
                    currentCover = listMusc[index]['coverurl'];
                  });
                },
                title: listMusc[index]['title'],
                singer: listMusc[index]['singer'],
                covers: listMusc[index]['coverurl']),
          )),
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Color(0x552112121), blurRadius: 8.0)
            ]),
            child: Column(
              children: [
                Slider.adaptive(
                    value: postion.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    min: 0.0,
                    onChanged: (valye) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(currentCover),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: Colors.grey, fontSize: 14.0),
                        )
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: IconButton(
                          onPressed: () {
                            if (isPlaying) {
                              audioPlayer.pause();
                              setState(() {
                                iconData = Icons.pause;
                                isPlaying = false;
                              });
                            } else {
                              audioPlayer.resume();
                              setState(() {
                                iconData = Icons.play_arrow;
                                isPlaying = true;
                              });
                            }
                          },
                          icon: Icon(
                            iconData,
                            color: Colors.grey,
                            size: 30,
                          )),
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
