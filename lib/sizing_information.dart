// ignore: file_names
// ignore: file_names
import 'package:flutter/cupertino.dart';

import 'deviceType.dart';

class SizingInformation {
  Orientation? orientation;
  DeviceType? deviceType;
  Size? screenSize;
  Size? localWidgetSize;

  SizingInformation(
      {this.localWidgetSize,
      this.deviceType,
      this.orientation,
      this.screenSize});
  @override
  String toString() {
    return 'orientation: $orientation devicetype: $deviceType screensize:$screenSize localWidgetSize:$localWidgetSize';
  }
}
