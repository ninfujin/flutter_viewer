import 'package:flutter/material.dart';
import 'package:flutter_viewer/commom/scale_screen.dart';
import 'package:flutter_viewer/commom/tabbar_configer.dart';
import 'package:flutter_viewer/commom/tabbar_config_model.dart';
import 'package:flutter_viewer/commom/global.dart';
import 'package:flutter_viewer/models/travel_model.dart';
import 'package:flutter_viewer/network/request_helper.dart';
import 'package:flutter_viewer/widgets/waterfall_gridview.dart';

const String TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _controller;
  ScrollController _scrollController;
  List<TabConfigModel> _tabBarModels;
  List<Article> _articleModels;
  int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
    _articleModels = [];
    _tabBarModels = TabBarConfiger.generateTabConfigModels;
      _controller = TabController(vsync: this, length: _tabBarModels.length, initialIndex: 1);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if((_scrollController.position.pixels + 80.0) >= _scrollController.position.maxScrollExtent) {
        _startRequest();
      }
    });
    _startRequest();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startRequest({bool isLoadMore = true}) {
    if(false == isLoadMore) {
      _pageIndex = 0;
      _articleModels?.removeRange(0, _articleModels.length);
    }
    HttpRequestHelper.getTravelItemData(TRAVEL_URL, {
      'pageIndex': _pageIndex,
      'pageSize' : 10,
      'groupChannelCode' : 'RX-OMF'}).then((TravelItemModel val) {
      setState(() {
          _articleModels.addAll(val.resultList.map((item) {
            return item.article;
          }).toList());
          _pageIndex++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    initialScreenUtil(context, w: 1080, h: 2248);
    return Scaffold(
      appBar: _appBar(),
      body: TabBarView(
        controller: _controller,
        children: _tabBarModels.map((model) {
          return WaterFallGridView(models: _articleModels ?? [], scrollController: _scrollController);
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
        onTap: (idx) {
          _scrollController.animateTo(0.1, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
        },
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