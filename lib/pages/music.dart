import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _LoginState();
}

class _LoginState extends State<MusicPage> {

  AudioPlayer audioPlayer = AudioPlayer()..setSourceAsset('music/Surmayee.mp3');

  bool isplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Choose audio file',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "DeliusSwashCaps",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Text(
                    "Surmayee Ankhiyon Mein",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (isplay) {
                      audioPlayer.pause();
                      setState(() {
                        isplay = false;
                      });
                    } else {
                      audioPlayer.play;
                      setState(() {
                        isplay = true;
                      });
                    }
                  },
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 1, 30, 1),
                    child: Icon(
                      (isplay) ? Icons.pause : Icons.play_arrow_sharp,
                      size: 35,),
                  ),
                  color: Colors.purple[200],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple[200],
        child: const Icon(Icons.upload),
      ),
    );
  }
}