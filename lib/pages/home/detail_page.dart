import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';

const APPBAR_SCROLL_OFFSET = 450.0;

class DetailVideoPage extends StatefulWidget {
  final Object heroTag;
  DetailVideoPage(this.heroTag);

  @override
  _DetailVideoPageState createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {

  double _appBarAlpha;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarAlpha = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroTag,
      child: GestureDetector(
          onHorizontalDragEnd: (e) => _pop(context),
          child: Scaffold(
            body:  SafeArea(
              child: Container(
                color: Colors.blueGrey,
                child: Stack(
                  children: <Widget>[
                    _content(context),
                    _customAppBar
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }


  Widget _content(BuildContext context) {
    _onScroll(double scrollOffset) {
      setState(() {
        _appBarAlpha = scrollOffset / APPBAR_SCROLL_OFFSET;
        if(_appBarAlpha < 0) _appBarAlpha = 0.0;
        if(_appBarAlpha > 1.0) _appBarAlpha = 1.0;
      });
    }

    return NotificationListener(
      onNotification: (scrollNorification) {
        if(scrollNorification is ScrollUpdateNotification
            && scrollNorification.depth == 0) {
          _onScroll(scrollNorification.metrics.pixels);
        }
        return true;
      },
      child:ListView(
        children: <Widget>[
          _video,
          _videoInfo(context),
          _comment
        ],
    ));
  }

  Widget get _video {
    return Container(
      color: Colors.pinkAccent,
      height: scaleH(1700),
    );
  }

  Widget _videoInfo(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: scaleH(400),
    );
  }

  Widget get _comment {
    return Column(
      children: List.generate(10, (idx) {
        return Container(
            color: Colors.green,
            height: scaleH(250),
            child: Center(child: Text('$idx')));
      }),
    );
  }

  Widget get _customAppBar {
    return Opacity(
      opacity: _appBarAlpha,
      child: Container(
        height: scaleH(160),
        color: Colors.white,
      )
    );
  }

  /// [Event]

  _pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}


