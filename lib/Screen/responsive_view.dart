import 'package:flutter/material.dart';
import 'package:unit_conversion/Screen/Mobile/calculation_screen.dart';
import 'package:unit_conversion/Screen/Mobile/mobile_home_view.dart';
import 'package:unit_conversion/Screen/Web/web_home_view.dart';

class ResponsiveUI extends StatelessWidget {
  const ResponsiveUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 480) {
        return const WebView();
      } else {
        return  MobileView();
      }
    });
  }
}
