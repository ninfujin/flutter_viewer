import 'package:flutter/material.dart';

class KeepAliverWraper extends StatefulWidget {
  final Widget child;
  KeepAliverWraper({this.child});

  @override
  _KeepAliverWraperState createState() => _KeepAliverWraperState();
}

class _KeepAliverWraperState extends State<KeepAliverWraper> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
