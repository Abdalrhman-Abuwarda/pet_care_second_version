import 'package:flutter/material.dart';

class ResponsiveUtil {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static const double designWidth = 375;
  static const double designHeight = 815;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

extension FlutterSizes on num {
  // Widths and Heights
  double get width => (this / ResponsiveUtil.designWidth) * ResponsiveUtil.screenWidth;
  double get height => (this / ResponsiveUtil.designHeight) * ResponsiveUtil.screenHeight;

  // Percentage-based sizes
  double get w => ResponsiveUtil.blockSizeHorizontal * this;
  double get h => ResponsiveUtil.blockSizeVertical * this;

  // Font sizes
  double get sp => width;
  double get textSp => width;

  // Spaces
  SizedBox get horizontalSpace => SizedBox(width: width);
  SizedBox get verticalSpace => SizedBox(height: height);

  // Paddings
  EdgeInsets get paddingAll => EdgeInsets.all(width);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: width);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: height);
  EdgeInsets get paddingTop => EdgeInsets.only(top: height);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: height);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: width);
  EdgeInsets get paddingRight => EdgeInsets.only(right: width);

  EdgeInsets paddingFromLTRB(num left, num top, num right, num bottom) {
    return EdgeInsets.fromLTRB(
      left.width,
      top.height,
      right.width,
      bottom.height,
    );
  }

  // Margins
  EdgeInsets get marginAll => EdgeInsets.all(width);
  EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: width);
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: height);
  EdgeInsets get marginTop => EdgeInsets.only(top: height);
  EdgeInsets get marginBottom => EdgeInsets.only(bottom: height);
  EdgeInsets get marginLeft => EdgeInsets.only(left: width);
  EdgeInsets get marginRight => EdgeInsets.only(right: width);

  EdgeInsets marginFromLTRB(num left, num top, num right, num bottom) {
    return EdgeInsets.fromLTRB(
      left.width,
      top.height,
      right.width,
      bottom.height,
    );
  }

  // Border Radius
  BorderRadius get circularRadius => BorderRadius.circular(width);
  BorderRadius get circularRadiusTop => BorderRadius.only(
    topLeft: Radius.circular(width),
    topRight: Radius.circular(width),
  );
  BorderRadius get circularRadiusBottom => BorderRadius.only(
    bottomLeft: Radius.circular(width),
    bottomRight: Radius.circular(width),
  );

  // Responsive conditions
  bool get isMobile => ResponsiveUtil.screenWidth < 600;
  bool get isTablet => ResponsiveUtil.screenWidth >= 600 && ResponsiveUtil.screenWidth < 1200;
  bool get isDesktop => ResponsiveUtil.screenWidth >= 1200;
}

// Additional responsive widgets
class ResponsiveWrapper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWrapper({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1200.isMobile) {
      return mobile;
    } else if (1200.isTablet) {
      return tablet ?? mobile;
    } else {
      return desktop ?? tablet ?? mobile;
    }
  }
}

// Extension for responsive text styles
extension ResponsiveTextStyle on TextStyle {
  TextStyle get responsive => copyWith(fontSize: fontSize?.sp);
}