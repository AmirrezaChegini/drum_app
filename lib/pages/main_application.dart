import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MainApplication extends StatelessWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/drum.jpg'),
          ),
        ),
        child: Column(
          children: [
            _getContent('c1', 'c2'),
            _getContent('h1', 'h2'),
            _getContent('k1', 'k2'),
          ],
        ),
      ),
    );
  }

  Widget _getContent(String i, String j) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: TextButton(
            onPressed: () => playMusic(i),
            child: Text(i),
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: TextStyle(fontSize: 30),
            ),
          )),
          Expanded(
              child: TextButton(
            onPressed: () => playMusic(j),
            child: Text(j),
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 30),
            ),
          )),
        ],
      ),
    );
  }

  Future<void> playMusic(String s) async {
    AudioPlayer player = AudioPlayer();

    await player.setSource(AssetSource('sounds/$s.wav'));
    await player.resume();
  }
}
