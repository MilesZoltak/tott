import 'package:flutter/material.dart';

class LearnMore extends StatelessWidget {
  LearnMore({required this.title, required this.content, super.key});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
            child: SingleChildScrollView(
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        content,
                        style: const TextStyle(fontSize: 24),
                      ),
                    )))));
  }
}
