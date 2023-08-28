import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart%20';

class AudioRecorderComponent extends StatefulWidget {
  FlutterSoundRecorder recorder;
  File? audioFile;
  final ValueChanged<File?> onUpdate;

  AudioRecorderComponent(this.recorder, this.audioFile, this.onUpdate,
      {super.key});

  @override
  State<AudioRecorderComponent> createState() => _AudioRecorderComponentState();
}

class _AudioRecorderComponentState extends State<AudioRecorderComponent> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    super.dispose();

    recorder.closeRecorder();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw "Microphone permission not granted.";
    }

    await recorder.openRecorder();
    isRecorderReady = true;

    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;

    // await recorder.startRecorder(toFile: "audio.wav", codec: Codec.pcm16WAV);
    await recorder.startRecorder(toFile: "audio");
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    widget.onUpdate(audioFile);
    print("recorded audio: $audioFile");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Icon(
                    recorder.isRecording ? Icons.stop : Icons.mic,
                    size: 64,
                  ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }

                    setState(() {});
                  },
                ),
                StreamBuilder<RecordingDisposition>(
                    stream: recorder.onProgress,
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;

                      String twoDigits(int n) => n.toString().padLeft(2, "0");
                      final twoDigitMinutes =
                          twoDigits(duration.inMinutes.remainder(60));
                      final twoDigitSeconds =
                          twoDigits(duration.inSeconds.remainder(60));

                      return Text("$twoDigitMinutes:$twoDigitSeconds",
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
