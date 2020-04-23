import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';

class Style1 extends StatefulWidget {
  final double maxHeight;
  final List<VideoModel> networkVideos;
  final VideoModel selectedVideo;
  final Function onVideoChange;

  Style1(
      {@required this.maxHeight,
      @required this.networkVideos,
      @required this.selectedVideo,
      @required this.onVideoChange});

  @override
  _Style1State createState() => _Style1State();
}

class _Style1State extends State<Style1> {
  double _animatedWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      right: 0.0,
      bottom: 0.0,
      child: Container(
        height: widget.maxHeight,
        child: Row(
          children: <Widget>[
            InkWell(
              child: Container(
                height: 40,
                width: 15,
                child: Icon(
                  Icons.chevron_left,
                  size: 20,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Colors.black26,
                ),
              ),
              onTap: () => setState(() {
                _animatedWidth != 0.0
                    ? _animatedWidth = 0.0
                    : _animatedWidth = 150.0;
              }),
            ),
            new AnimatedContainer(
              color: Colors.black26,
              duration: const Duration(milliseconds: 500),
              child: ListView.builder(
                itemCount: widget.networkVideos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 60,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: (widget.networkVideos[index].id ==
                                        widget.selectedVideo.id)
                                    ? 2
                                    : 0,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.networkVideos[index].thumbnailUrl),
                                  fit: BoxFit.fitWidth),
                            ), // button text
                          ),
                          new Positioned(
                              left: 3.0,
                              bottom: 8.0,
                              child: Text(
                                widget.networkVideos[index].name.length > 12
                                    ? widget.networkVideos[index].name
                                            .substring(0, 12) +
                                        "..."
                                    : widget.networkVideos[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black26),
                              ))
                        ],
                      ),
                      onTap: () {
                        widget.onVideoChange(widget.networkVideos[index]);
                      });
                },
              ),
              width: _animatedWidth,
            )
          ],
        ),
      ),
    );
  }
}
