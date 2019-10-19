import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/models/travel_model.dart';
import 'package:flutter_viewer/widgets/waterfall_item.dart';

class WaterFallGridView extends StatefulWidget {

  final List<Article> models;
  final ScrollController scrollController;
  final Function(int idx) onTapItem;
  final int type;
  WaterFallGridView({this.models, this.scrollController,this.onTapItem,this.type});

  @override
  _WaterFallGridViewState createState() => _WaterFallGridViewState();
}

class _WaterFallGridViewState extends State<WaterFallGridView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if(null == widget?.models || 0 == widget?.models?.length) {
      return Center(child: Text('Loading...'));
    }
    return StaggeredGridView.countBuilder(
      controller: widget.scrollController,
      crossAxisCount: 2,
      itemCount: widget.models?.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if(null != widget.onTapItem) {
              widget.onTapItem(index);
            }
          },
          child: Hero(
            tag: 'HeroAnimation${widget.type}_Route_Detail_$index',
            child: WaterFallItem(index: index, model: widget.models[index]),
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: scaleW(5),
      crossAxisSpacing: scaleH(10),
    );
  }
}

