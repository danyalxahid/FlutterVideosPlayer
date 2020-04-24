import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/constant/constants.dart';
import 'package:videos_player/util/constant/style1.constants.dart';

class Style1 extends StatefulWidget {
  final double maxHeight;
  final List<NetworkVideo> networkVideos;
  final NetworkVideo selectedVideo;
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

  openCloseVideosModal() async {
    setState(() {
      _animatedWidth != 0.0
          ? _animatedWidth = 0.0
          : _animatedWidth = kVideosWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.networkVideos.length > 1)
        ? Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: widget.maxHeight,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: 60,
                      width: 25,
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        color: kBackgroundColor,
                      ),
                    ),
                    onTap: openCloseVideosModal,
                  ),
                  new AnimatedContainer(
                    color: kBackgroundColor,
                    duration: const Duration(milliseconds: 500),
                    child: ListView.builder(
                      itemCount: widget.networkVideos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Container(
                              width: kVideosWidth,
                              height: kVideosHeight,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: (widget
                                          .networkVideos[index].thumbnailUrl !=
                                      null)
                                  ? BoxDecoration(
                                      border: Border.all(
                                        color: kImageBorderColor,
                                        width:
                                            (widget.networkVideos[index].id ==
                                                    widget.selectedVideo.id)
                                                ? 2
                                                : 0,
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(widget
                                              .networkVideos[index]
                                              .thumbnailUrl),
                                          fit: BoxFit.fitWidth),
                                    )
                                  : BoxDecoration(
                                      border: Border.all(
                                        color: kImageBorderColor,
                                        width:
                                            (widget.networkVideos[index].id ==
                                                    widget.selectedVideo.id)
                                                ? 2
                                                : 0,
                                      ),
                                    ), //
                              child: Center(
                                  child: Text(
                                widget.networkVideos[index].name.length >
                                        kMaxTextLength
                                    ? widget.networkVideos[index].name
                                            .substring(0, kMaxTextLength) +
                                        "..."
                                    : widget.networkVideos[index].name,
                                style: TextStyle(
                                    color: kTextColor,
                                    backgroundColor: kBackgroundColor,
                                    wordSpacing: 2),
                              )), // button text
                            ),
                            onTap: () {
                              widget.onVideoChange(
                                  widget.networkVideos[index], false);
                              openCloseVideosModal();
                            });
                      },
                    ),
                    width: _animatedWidth,
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
