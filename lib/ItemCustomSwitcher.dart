
import 'package:flutter/material.dart';

class ItemCustomSwitcher {
  Widget child;
  Widget icon;
  Color? backgroundColor;
  BorderRadius? cardBorderRadius;
  BorderSide? cardBorderSide;
  EdgeInsets? cardMargin;
  Color? cardShadowColor;
  double? cardUnselectedWidht;

  ItemCustomSwitcher({
    required this.child, required this.icon, this.backgroundColor, this.cardBorderRadius,
    this.cardBorderSide, this.cardMargin, this.cardShadowColor, this.cardUnselectedWidht
  });
}