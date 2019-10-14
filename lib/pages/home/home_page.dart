import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/commom/tabbar_configer.dart';
import 'package:flutter_viewer/commom/tabbar_config_model.dart';
import 'package:flutter_viewer/commom/global.dart';
import 'package:flutter_viewer/pages/home/recommend_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _controller;
  List<TabConfigModel> _tabBarModels;
  List<RecommendPage> _pages;
  int _tabIndex;

  @override
  void initState() {
    super.initState();
    _tabBarModels = TabBarConfiger.generateTabConfigModels;
    _controller = TabController(vsync: this, length: _tabBarModels.length, initialIndex: 1);
    _pages = []
    ..add(RecommendPage(0))
    ..add(RecommendPage(1))
    ..add(RecommendPage(2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initialScreenUtil(context, w: 1080, h: 2248);
    return Scaffold(
      appBar: _appBar(),
      body: TabBarView(
        controller: _controller,
        children: _tabBarModels.map((model) {
          return RecommendPage(_tabBarModels.indexOf(model));
        }).toList(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: GlobalConfig.defaultTheme.primaryColor,
      elevation: 0,
      title: TabBar(
        controller: _controller,
        unselectedLabelColor: UNSELECTED_LABEL_COLOR,
        unselectedLabelStyle: UNSELECTED_LABEL_STYLE,
        labelColor: LABEL_COLOR,
        labelStyle: LABEL_STYLE,
        indicatorPadding: INDICATOR_PADDING,
        indicatorColor: INDICATOR_COLOR,
        tabs: _tabBarModels.map((model) {
          return Tab(text: model.title);
        }).toList(),
      ),
      leading: GestureDetector(child: Icon(Icons.menu, color: UNSELECTED_LABEL_COLOR)),
      actions: <Widget>[
        GestureDetector(child: Icon(Icons.camera_alt, color: UNSELECTED_LABEL_COLOR)),
        SizedBox(width: scaleW(45.0))
      ],
    );
  }
}