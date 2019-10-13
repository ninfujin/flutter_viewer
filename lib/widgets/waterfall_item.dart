import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/global.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/models/travel_model.dart';

class WaterFallItem extends StatelessWidget {

  final Article model;
  final int index;
  WaterFallItem({this.index, this.model});

  @override
  Widget build(BuildContext context) {

    return Container(
        color: GlobalConfig.defaultTheme.primaryColor,
        child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _image,
                  _diggInfo
                ],
              ),
              Positioned(
                left: scaleW(15.0),
                bottom: scaleH(30.0),
                height: scaleW(65.0),
                width: scaleW(65.0),
                child: _avator,
              ),
            ]
        )
    );
  }

  Widget get _avator {
    return CircleAvatar(
      backgroundImage: NetworkImage(model.author?.coverImage?.dynamicUrl),
    );
  }

  Widget get _diggInfo {
    return SizedBox(
      height: scaleH(80.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.favorite_border, color: Colors.black12, size: scaleH(60.0)),
          SizedBox(width: scaleW(20.0)),
          Text(model.likeCount.toString(), style: TextStyle(
              fontSize: scaleSp(30.0),
              color: Colors.grey
          )),
          SizedBox(width: scaleW(15.0))
        ],
      )
    );
  }

  Widget get _image {
    return Image.network(
        model?.images[0].dynamicUrl,
        fit: BoxFit.fill);
  }
}
