import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerComponent extends StatefulWidget {
  AudioPlayer audioPlayer;
  Duration position;
  AudioPlayerComponent(this.audioPlayer, this.position, {super.key});

  @override
  State<AudioPlayerComponent> createState() => _AudioPlayerComponentState();
}

class _AudioPlayerComponentState extends State<AudioPlayerComponent> {
  bool isPlayable = false;
  bool isPlaying = false;

  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() => duration = newDuration);
    });

    widget.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() => widget.position = newPosition);
    });

    widget.audioPlayer.onPlayerComplete.listen((event) {
      setState(() => widget.position = duration);
    });

    print("aba this all happend");
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();

    super.dispose();
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes =
    twoDigits(d.inMinutes.remainder(60));
    final twoDigitSeconds =
    twoDigits(d.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // TODO: figure out how to make it playable once it
          Slider(
            min: 0,
            max: duration.inMilliseconds.toDouble(),
            value: widget.position.inMilliseconds.toDouble(),
            onChanged: (value) async {
              final pos = Duration(milliseconds: value.toInt());
              await widget.audioPlayer.seek(pos);
              setState(() => widget.position = pos);
              await widget.audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(widget.position)),
                Text(formatTime(duration - widget.position))
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 50,
              onPressed: () async {
                if (isPlaying) {
                  await widget.audioPlayer.pause();
                } else {
                  await widget.audioPlayer.resume();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
