import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final String? message;
  const Loading({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[850],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    const Expanded(child: SpinKitFadingCircle(color: Colors.deepPurple)),
                    message != null ? Text(message!) : const SizedBox()
                  ],
                )),
          ),
        ));
  }
}
