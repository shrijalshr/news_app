import 'package:flutter/material.dart';

class DashContainer extends StatelessWidget {
  const DashContainer(
      {Key? key,
      this.child,
      this.color = Colors.white,
      this.width = double.maxFinite,
      this.height,
      this.padding,
      this.border})
      : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color!,
        borderRadius: BorderRadius.circular(20),
        border: border,
      ),
      // height: height * 40,
      width: width!,
      child: child,
    );
  }
}
