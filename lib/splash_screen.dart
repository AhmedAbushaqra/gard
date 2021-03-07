import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gard/main.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  static const RouteName = "/splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _controller;

  startTime() async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Home.RouteName);
  }

  @override
  void initState() {
    super.initState();
    startTime();
    _controller = VideoPlayerController.asset('images/nestle.mp4')
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F1F0),
      body: Center(
        child: FittedBox(
          // If your background video doesn't look right, try changing the BoxFit property.
          // BoxFit.fill created the look I was going for.
          fit: BoxFit.fill,
          child: SizedBox(
            width: 500,
            height: 500,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }
}
