
import 'package:apptvshow/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:video_player/video_player.dart';


class YouTubePlayer extends StatefulWidget {

  const YouTubePlayer({Key? key, this.videoUrl}) : super(key: key);
  final String? videoUrl; // mp4 fájl URL

  @override
  State<YouTubePlayer> createState() => _MyApp33State(
      videoUrl
  );
}
const htmlData = r"""
    <video controls controlsList="nodownload" style="border:none; margin:0; padding:0; width:100%; height:100%;" src="https://storage.googleapis.com/lomeeibucket/MJ_szia.mp4" ></video>
""";

class _MyApp33State extends State<YouTubePlayer> {
  late VideoPlayerController _controller;
  String? videoAddress;
  bool _isInitialized = false;

  _MyApp33State(String? videoUrl){
    videoAddress = videoUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          videoAddress!),
    )
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      })
    ..addListener(() {
    setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isPortrait = screenSize.height > screenSize.width;

    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual, overlays: SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
            child: _isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Háttér videó
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),

                      // Play/Pause overlay
                      Stack(
                        children: [
                          _controller.value.isPlaying
                              ? const SizedBox.shrink()
                              : const Center(
                                  child: Icon(
                                    Icons.play_circle_outline_sharp,
                                    color: Colors.white70,
                                    size: 60,
                                  ),
                              ),
                        ],
                      ),

                      // Progress bar (legalulra rögzítve)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.purple,
                            backgroundColor: Colors.white24,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ) : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: [
          controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}