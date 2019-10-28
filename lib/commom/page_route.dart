import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_viewer/pages/home/gridview/page.dart';
import 'package:flutter_viewer/pages/home/page.dart';
import 'package:flutter_viewer/pages/detail_view/page.dart';

class FishReduxPageRoute {
  static AbstractRoutes get routes => PageRoutes(
    pages: {
      'flutter_viewer_home_page': HomePage(),
      'flutter_viewer_waterfall_grid_view': WaterFallGridViewPage(),
      'flutter_viewer_detail_video_page': DetailViewPage()
    },
  );
}