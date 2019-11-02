import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/global.dart';
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
                left: 7.0,
                bottom: 10.0,
                height: 30.0,
                width: 30.0,
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
      height: 25.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.favorite_border, color: Colors.black12, size: 17.5),
          SizedBox(width: 10.0),
          Text(
              model.likeCount.toString(),
              style: TextStyle(
              fontSize: 11.0,
              color: Colors.grey
          )),
          SizedBox(width: 5.0)
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
