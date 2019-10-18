import 'package:flutter/material.dart';

class GlobalConfig {

  static const String APP_NAME = '快手';

  static ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    accentColor: Colors.green,
    primaryColorBrightness: Brightness.light,
  );

  // 默认主题
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    unselectedWidgetColor: Colors.grey,
    accentColor: Colors.white70,
  );
}

const String RefreshFooter_Load_text = "松手加载~";
const String RefreshFooter_LoadReady_text = "正在准备加载哦~";
const String RefreshFooter_LoadSuccess_text = "加载成功，^_^";
const String RefreshFooter_LoadFailed_text = "Oh no，加载失败了~_~!";
const String RefreshFooter_Loading_text = "正在加载哦...";
const String RefreshFooter_NoMore_text = "没有更多数据了，—_—!";

const Color RefreshFooter_TextColor = Colors.blue;
const bool RefreshFooter_enableHapitFeedBack = false;
const bool RefreshFooter_showInfo = false;


const String RefreshHeader_Load_text = "松手刷新~";
const String RefreshHeader_LoadReady_text = "正在准备刷新哦~";
const String RefreshHeader_LoadSuccess_text = "刷新成功，^_^";
const String RefreshHeader_LoadFailed_text = "Oh no，刷新失败了~_~!";
const String RefreshHeader_Loading_text = "正在刷新哦...";
const String RefreshHeader_NoMore_text = "没有更多数据了，—_—!";

const Color RefreshHeader_TextColor = Colors.blue;
const Color RefreshHeader_showInfoTextColor = Colors.blue;
const bool RefreshHeader_enableHapitFeedBack = true;
const bool RefreshHeader_showInfo = true;
