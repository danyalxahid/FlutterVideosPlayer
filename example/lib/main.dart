import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';
import 'package:videos_player/model/control.model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Videos Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: "Elephant Dream",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: true,
              )),
          new NetworkVideo(
              id: "3",
              name: "Big Buck Bunny",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
              videoControl: new NetworkVideoControl(autoPlay: true)),
          new NetworkVideo(
              id: "4",
              name: "For Bigger Blazes",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
          new NetworkVideo(
              id: "5",
              name: "For Bigger Escape",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"),
          new NetworkVideo(
              id: "6",
              name: "For Bigger Fun",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg"),
          new NetworkVideo(
              id: "7",
              name: "For Bigger Joyrides",
              videoUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
              thumbnailUrl:
                  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg"),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
