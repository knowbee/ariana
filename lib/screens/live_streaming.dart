import 'package:ariana/model/app_tab.dart';
import 'package:ariana/providers/app_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoLiveStreaming extends ConsumerStatefulWidget {
  const VideoLiveStreaming({Key? key}) : super(key: key);

  @override
  _VideoLiveStreamingState createState() => _VideoLiveStreamingState();
}

class _VideoLiveStreamingState extends ConsumerState<VideoLiveStreaming> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://d10rltuy0iweup.cloudfront.net/ATNNEWS/myStream/playlist.m3u8')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    AppTabs currentTab = ref.watch(appTabProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Live Streaming'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(appTabProvider.notifier).changeTab(0);
              final tab = ref.read(appTabProvider);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => tab.screen,
                ),
              );
              // go to homepage
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
