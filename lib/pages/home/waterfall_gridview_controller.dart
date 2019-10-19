import 'package:flutter/material.dart';
import 'package:flutter_viewer/models/travel_model.dart';
import 'package:flutter_viewer/network/request_helper.dart';
import 'package:flutter_viewer/pages/home/detail_page.dart';
import 'package:flutter_viewer/widgets/loading_container.dart';
import 'package:flutter_viewer/widgets/waterfall_gridview.dart';
import 'dart:async';

const String TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

class WaterfallGridViewController extends StatefulWidget {
  final int type;
  WaterfallGridViewController(this.type);

  @override
  _WaterfallGridViewControllerState createState() => _WaterfallGridViewControllerState();
}

class _WaterfallGridViewControllerState extends State<WaterfallGridViewController> {
  ScrollController _scrollController;
  List<Article> _articleModels;
  int _pageIndex;
  bool _isLoading;
  bool _canContinueLoad;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
    _isLoading = true;
    _canContinueLoad = true;
    _articleModels = [];
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if((_scrollController.position.pixels + 160.0) >= _scrollController.position.maxScrollExtent) {
         if(!_isLoading && _canContinueLoad) {
           _canContinueLoad = false;
           _startRequest();
           _timer = _startTimeout(1000);
         }
      }
    });
    _startRequest();
  }

  @override
  void dispose() {
    if(null != _timer) {
      _timer.cancel();
    }
    super.dispose();
  }

  _startTimeout([int milliseconds]) {
    if(null  != _timer) _timer.cancel();
    return Timer(Duration(seconds: 1), (){
      _canContinueLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: LoadingContainer(
        isLoading: _isLoading,
          child: GestureDetector(
            onDoubleTap: () {
              _scrollController.animateTo(0.0, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
            },
            child: WaterFallGridView(
                type: widget.type,
                models: _articleModels ?? [],
                scrollController: _scrollController,
                onTapItem : (idx) {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return DetailVideoPage('HeroAnimation${widget.type}_Route_Detail_$idx');
                  }));
                }
            ))
          )
    );
  }

  /// [private]

  Future<Null> _handleRefresh() async {
    _startRequest(isLoadMore: false);
    return null;
  }

  _startRequest({bool isLoadMore = true}) {
    if (false == isLoadMore) {
      _pageIndex = 0;
      _articleModels?.removeRange(0, _articleModels.length);
    }

    int pageSize = (0 == _articleModels?.length || 10 > _articleModels?.length) ? 10 : 4;
    Map groupChannelCodeInfo = {
      0 : 'tourphoto_global1',
      1 : 'RX-OMF',
      2 : 'quanliyouxi'
    };
    HttpRequestHelper.getTravelItemData(TRAVEL_URL, {
      'pageIndex': _pageIndex,
      'pageSize': pageSize,
      'groupChannelCode': groupChannelCodeInfo[widget.type]}).then((TravelItemModel val) {
      setState(() {
        _articleModels.addAll(val.resultList.map((item) {
          return item.article;
        }).toList());
        _pageIndex++;
        _isLoading = false;
      });
    });
  }
}
