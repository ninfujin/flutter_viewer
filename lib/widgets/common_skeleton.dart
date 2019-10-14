import 'package:flutter/material.dart';

class CommonSkeleton extends StatefulWidget {

  final Container child;
  final dynamic model;
  final double replaceHeight;
  CommonSkeleton({this.child, this.model, this.replaceHeight});

  @override
  _CommonSkeletonState createState() => _CommonSkeletonState();
}

class _CommonSkeletonState extends State<CommonSkeleton> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    animation = Tween<double>(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(curve: Curves.easeInOut, parent: controller)
    );
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = widget.child?.constraints?.minWidth;
    if(width != null) {
      if(width > screenSize.width || width == 0) width = screenSize.width * 0.67;
    } else
    {
      width = screenSize.width * 0.67;
    }

    double height = widget.child?.constraints?.minHeight;
    if(height != null) {
      if(height > screenSize.height) height = screenSize.height;
      if(height == 0) height = 80;
    } else{
      height = 80;
    }
    if(0 != widget.replaceHeight && null != widget.replaceHeight) height = widget.replaceHeight;

    if(null == widget.model) return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          margin: widget.child?.margin,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffefefef),Color(0xffcfcfcf), Color(0xffefefef)],
                  stops: [
                    animation.value - 1.0,
                    animation.value,
                    animation.value + 1.0
                  ],
                  begin: Alignment.centerLeft,
                  end:Alignment.centerRight,
                  tileMode: TileMode.mirror
              )
          ),
        );
      },
    );
    return widget.child;
  }
}
