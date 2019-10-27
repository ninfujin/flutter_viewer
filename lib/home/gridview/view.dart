import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/widgets/loading_container.dart';
import 'package:flutter_viewer/widgets/waterfall_item.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WaterFallGridViewState state, Dispatch dispatch, ViewService viewService) {
  return RefreshIndicator(
      color: Colors.orange,
      onRefresh: () async{
        dispatch(WaterFallGridViewActionCreator.onStartRequest(isLoadMore: false));
        return null;
      },
      child: LoadingContainer(
          isLoading: state.isLoading,
          child: GestureDetector(
              onDoubleTap: () => dispatch(WaterFallGridViewActionCreator.onScrollToTop()),
              child: StaggeredGridView.countBuilder(
                  controller: state.scrollController,
                  crossAxisCount: 2,
                  itemCount: state.articleModels.length,
                  itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => dispatch(WaterFallGridViewActionCreator.onTapGridItem()),
                        child: Hero(
                            tag: 'HeroAnimation${state.type}_Route_Detail_$index',
                            child: WaterFallItem(index: index, model: state.articleModels[index]),
                        ),
                      );
                  },
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  mainAxisSpacing: scaleW(5),
                  crossAxisSpacing: scaleH(10)
  ))));
}
