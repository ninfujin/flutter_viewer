import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double get kScreenWidth => ScreenUtil.screenWidth;
double get kScreenHeight => ScreenUtil.screenHeight;
double get kScreenWidthDp => ScreenUtil.screenWidthDp;
double get kScreenHeightDp => ScreenUtil.screenHeightDp;

void initialScreenUtil(BuildContext context, {double w = 750, double h = 1334}) {
  ScreenUtil.instance = ScreenUtil(width: w, height: h)..init(context);
}

double scaleW(double w) {
  return ScreenUtil().setWidth(w);
}

double scaleH(double h) {
  return ScreenUtil().setHeight(h);
}

double scaleSp(double sp) {
  return ScreenUtil().setSp(sp);
}