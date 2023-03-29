
import 'package:flutter/material.dart';

class CustomSwitcher extends StatefulWidget {
  // Function
  final List<ItemCustomSwitcher> children; // ref
  final int initialIndex;
  final void Function(int index)? onChangue;

  // Visual
  final double? totalWidth;
  final double? height;
  final Curve animationCurve;
  final Duration animationDuration;
  final Color? backgroundColor;

  // Card visual
  final BorderRadius cardBorderRadius;
  final BorderSide cardBorderSide;
  final EdgeInsets cardMargin;
  final double cardSelectedElevation;
  final double cardUnSelectedElevation;

  final Color? cardShadowColor;
  final double? cardUnselectedWidht;

  const CustomSwitcher({required this.children, this.initialIndex = 0, this.onChangue,
    this.totalWidth,
    this.height,
    this.animationCurve = Curves.easeInSine, // Curves.easeInToLinear,
    this.animationDuration = const Duration(milliseconds: 250),
    this.backgroundColor = Colors.white,
    this.cardBorderRadius = const BorderRadius.all(Radius.circular(4)),
    this.cardBorderSide = BorderSide.none,
    this.cardMargin = const EdgeInsets.all(2.5),
    this.cardSelectedElevation = 2,
    this.cardUnSelectedElevation = 1,
    this.cardShadowColor,
    this.cardUnselectedWidht,
    Key? key}) : assert(children.length > 0), super(key: key);

  @override
  State<CustomSwitcher> createState() => CustomSwitcherState();
}

class CustomSwitcherState extends State<CustomSwitcher> {
  late int _index;
  late int _oldChildrenLength;

  @override
  void initState() {
    super.initState();
    _index             = widget.initialIndex;
    _oldChildrenLength = widget.children.length;
  }

  //=> private
  double get _totalWidgetWidht => (widget.totalWidth ?? MediaQuery.of(context).size.width);

  // User desired width OR 17% of the total widget width given
  double _minWidht(ItemCustomSwitcher item) => item.cardUnselectedWidht ?? (widget.cardUnselectedWidht ?? _totalWidgetWidht * 0.17);

  // Total widht minus the amount of unselected children
  double _maxWidht(ItemCustomSwitcher item) => _totalWidgetWidht - ((widget.children.length - 1) * (_minWidht(item)));

  //=> Public
  int get currentIndex => _index;
  void setIndex(int index) => setState(() { _index = index; });

  @override
  Widget build(BuildContext context) {
    // Check if the amount of children changue since last update, (useful to prevent annoying alert of overflow while animating)
    var cancelAnimation = _oldChildrenLength < widget.children.length;

    var child = Row(
      children: widget.children.map((item) {
        var index      = widget.children.indexOf(item);
        var isSelected = _index == index;
        var minWidht   = _minWidht(item);
        var maxWidht   = _maxWidht(item);

        return AnimatedContainer(
          height: widget.height ?? MediaQuery.of(context).size.height * .08,
          duration: cancelAnimation ? Duration.zero : widget.animationDuration,
          width: isSelected ? maxWidht : minWidht,
          curve: widget.animationCurve,
          child: Card(
              margin: widget.cardMargin,
              elevation: isSelected ? widget.cardSelectedElevation : widget.cardUnSelectedElevation,
              color: item.backgroundColor ?? widget.backgroundColor,
              shape: RoundedRectangleBorder(side: item.cardBorderSide ?? widget.cardBorderSide, borderRadius: item.cardBorderRadius ?? widget.cardBorderRadius),
              shadowColor: item.cardShadowColor ?? widget.cardShadowColor,
              child: InkWell(
                borderRadius: item.cardBorderRadius ?? widget.cardBorderRadius,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        width: minWidht - widget.cardMargin.horizontal,
                        child: Center(child: item.icon,)
                    ),
                    isSelected ? Expanded(child: item.child,) : const SizedBox.shrink()
                  ],
                ),
                onTap: () async {
                  _index = index;
                  if(mounted) setState(() {  });

                  widget.onChangue?.call(index);
                },
              )
          ),
        );
      }).toList(),
    );

    _oldChildrenLength = widget.children.length;
    return child;
  }
}


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