import 'package:flutter/material.dart';
import 'package:videos_player/model/control.model.dart';

class NetworkVideo {
  final String id;
  final String name;
  final String videoUrl;
  final String thumbnailUrl;
  final NetworkVideoControl videoControl;

  NetworkVideo(
      {@required this.id,
      @required this.name,
      @required this.videoUrl,
      this.thumbnailUrl,
      this.videoControl});
}
