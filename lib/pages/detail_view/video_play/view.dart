import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(VideoPlayState state, Dispatch dispatch, ViewService viewService) {
  return  GestureDetector(
    onTap: () => state.chewieController.videoPlayerController.pause(),
    child: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: state.inititalizeVideoPlayerFuture,
          builder: (context, snapshot) {
            if(snapshot.hasError) _errorTip(state);
            if (snapshot.connectionState == ConnectionState.done) {
              state.chewieController.play();
              return Chewie(controller: state.chewieController);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
    )
  );
}

Widget _errorTip(VideoPlayState state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.warning, color: Colors.yellow),
            Text(
              '  It seems that video load failed, tap and retry...',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0
              ),
            )
          ],
        ),
        SizedBox(height: 30.0),
        GestureDetector(
          onTap: () => state.chewieController.play(),
          child: Icon(
            Icons.replay,
            size: 35,
            color: Colors.blue,
          ),
        )
      ],
    ),
  );
}
