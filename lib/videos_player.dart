library videos_player;

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/style/style1.style.dart';
import 'package:videos_player/util/theme.util.dart';

class VideosPlayer extends StatefulWidget {
  final List<VideoModel> networkVideos;
  final Style playlistStyle;

  VideosPlayer(
      {@required this.networkVideos, this.playlistStyle = Style.Style1});

  @override
  _VideosPlayerState createState() => _VideosPlayerState();
}

class _VideosPlayerState extends State<VideosPlayer> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  VideoModel selectedVideo;
  double _maxHeight = 250;

  @override
  void initState() {
    super.initState();
    if (widget.networkVideos.length > 0) {
      playNetworkVideos(widget.networkVideos[0]);
    }
  }

  playNetworkVideos(VideoModel recordingModel) async {
    VideoPlayerController videoPlayer =
        VideoPlayerController.network(recordingModel.videoUrl);
    await videoPlayer.initialize();

    double aspectRatio =
        videoPlayer.value.size.width / videoPlayer.value.size.height;

    setState(() {
      selectedVideo = recordingModel;
      _videoPlayerController = videoPlayer;
      _chewieController = ChewieController(
        videoPlayerController: videoPlayer,
        aspectRatio: aspectRatio,
        autoPlay: false,
        looping: false,
      );
      _maxHeight = (MediaQuery.of(context).size.width / aspectRatio) > 250
          ? 250
          : (MediaQuery.of(context).size.width / aspectRatio);
    });
  }

  onVideoChange(VideoModel newValue) async {
    _chewieController.dispose();
    _videoPlayerController.pause();
    _videoPlayerController.seekTo(Duration(seconds: 0));

    VideoPlayerController videoPlayer =
        VideoPlayerController.network(newValue.videoUrl);
    await videoPlayer.initialize();
    double aspectRatio =
        videoPlayer.value.size.width / videoPlayer.value.size.height;

    setState(() {
      selectedVideo = newValue;
      _videoPlayerController = videoPlayer;
      _chewieController = ChewieController(
        videoPlayerController: videoPlayer,
        aspectRatio: aspectRatio,
        autoPlay: false,
        looping: false,
      );
      _maxHeight = (MediaQuery.of(context).size.width / aspectRatio) > 250
          ? 250
          : (MediaQuery.of(context).size.width / aspectRatio);
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _maxHeight,
          child: Center(
            child: (_chewieController == null)
                ? CupertinoActivityIndicator()
                : Stack(children: <Widget>[
                    Chewie(
                      controller: _chewieController,
                    ),
                    (widget.playlistStyle == Style.Style1)
                        ? Style1(
                            maxHeight: _maxHeight,
                            networkVideos: widget.networkVideos,
                            selectedVideo: selectedVideo,
                            onVideoChange: onVideoChange,
                          )
                        : Container(),
                  ]),
          ),
        ),
      ],
    );
  }
}
