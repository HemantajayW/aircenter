// ignore_for_file: file_names

import 'package:aircenter/sizing_information.dart';
import 'package:aircenter/ui_utils.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? Function(
    BuildContext context,
    SizingInformation sizingInfo,
  )? builder;
  const ResponsiveWidget({Key? key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInfo = SizingInformation(
          deviceType: getDeviceType(mediaQuery),
          orientation: mediaQuery.orientation,
          screenSize: mediaQuery.size,
          localWidgetSize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight));
      return builder!(context, sizingInfo)!;
    });
  }
}
