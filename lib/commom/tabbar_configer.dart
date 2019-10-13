import 'package:flutter/material.dart';
import 'tabbar_config_model.dart';

 const Color UNSELECTED_LABEL_COLOR = Colors.black54;
 const Color LABEL_COLOR = Colors.black;
 const TextStyle UNSELECTED_LABEL_STYLE = TextStyle(fontSize: 17.0);
 const TextStyle LABEL_STYLE = TextStyle(fontSize: 17.0);
 const EdgeInsets INDICATOR_PADDING = EdgeInsets.symmetric(horizontal: 37.5,vertical: 4.0);
 const Color INDICATOR_COLOR = Colors.orange;

class TabBarConfiger {
  static List<TabConfigModel> get generateTabConfigModels {
    return [
      TabConfigModel(title:"关注", icon: Icons.favorite),
      TabConfigModel(title:"推荐", icon: Icons.redeem),
      TabConfigModel(title:"同城", icon: Icons.near_me)
    ];
  }
}