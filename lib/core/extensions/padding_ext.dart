import 'package:flutter/widgets.dart';

extension PaddingToWidget on Widget {
  Widget setHorizontalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  Widget setVerticalPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: enableMediaQuery ? mediaQuery.size.height * value : value,
      ),
      child: this,
    );
  }

  Widget setHorizontalAndVerticalPadding(
      BuildContext context, double widthValue, double heightValue,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            enableMediaQuery ? mediaQuery.size.width * widthValue : widthValue,
        vertical: enableMediaQuery
            ? mediaQuery.size.height * heightValue
            : heightValue,
      ),
      child: this,
    );
  }

  Widget setOnlyPadding(
      BuildContext context, double top, double down, double right, double left,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: enableMediaQuery ? mediaQuery.size.height * top : top,
        bottom: enableMediaQuery ? mediaQuery.size.height * down : down,
        right: enableMediaQuery ? mediaQuery.size.width * right : right,
        left: enableMediaQuery ? mediaQuery.size.width * left : left,
      ),
      child: this,
    );
  }

  Widget setAllPadding(BuildContext context, double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.all(
        enableMediaQuery ? mediaQuery.size.width * value : value,
      ),
      child: this,
    );
  }

  Widget setWidth(BuildContext context, double width,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: enableMediaQuery ? mediaQuery.size.width * width : width,
      child: this,
    );
  }

  Widget setHeight(BuildContext context, double height,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: enableMediaQuery ? mediaQuery.size.height * height : height,
      child: this,
    );
  }

  Widget setSize(BuildContext context, double width, double height,
      {bool enableMediaQuery = true}) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: enableMediaQuery ? mediaQuery.size.width * width : width,
      height: enableMediaQuery ? mediaQuery.size.height * height : height,
      child: this,
    );
  }
}
