# videos_player

The videos player for Flutter which uses chewie and video_player behind the scenes to play list of videos to be displayed and switched when needed without any complicating configurations.

The [`video_player`](https://pub.dartlang.org/packages/video_player) plugin provides low-level access to video playback. 
The [`chewie`](https://pub.dev/packages/chewie#-readme-tab-) plugin uses the `video_player` under the hood and wraps it in a friendly Material or Cupertino UI! 

Videos Player handles both configurations in a single package.

## Demo

![Demo](https://github.com/danyalxahid/FlutterVideosPlayer/raw/master/assets/videos_player_demo.gif)

## Installation

In your `pubspec.yaml` file within your Flutter Project: 

```yaml
dependencies:
  videos_player: <latest_version>
```

## Use it

```dart
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';

final widget = VideosPlayer(networkVideos: [
                       new VideoModel(
                           id: "1",
                           name: "Bee video",
                           videoUrl:
                               "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
                       new VideoModel(
                           id: "2",
                           name: "Elephant Dream",
                           videoUrl:
                               "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                           thumbnailUrl:
                               "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg"),
                       new VideoModel(
                           id: "3",
                           name: "Big Buck Bunny",
                           videoUrl:
                               "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                           thumbnailUrl:
                               "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"),
                       new VideoModel(
                           id: "4",
                           name: "For Bigger Blazes",
                           videoUrl:
                               "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                           thumbnailUrl:
                               "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
                       new VideoModel(
                           id: "5",
                           name: "For Bigger Escape",
                           videoUrl:
                               "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
                           thumbnailUrl:
                               "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"),
                     ]);

```


## Example

Please run the app in the [`example/`](https://github.com/danyalxahid/FlutterVideosPlayer/tree/master/example) folder to start playing!


## iOS warning
The video player plugin is not functional on iOS simulators. An iOS device must be used during development/testing. Please refer to this [issue](https://github.com/flutter/flutter/issues/14647).

