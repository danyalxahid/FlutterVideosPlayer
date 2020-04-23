import 'package:flutter/material.dart';

class VideoModel {
  final String id;
  final String name;
  final String videoUrl;
  final String thumbnailUrl;

  VideoModel(
      {@required this.id,
      @required this.name,
      @required this.videoUrl,
      this.thumbnailUrl});
}
