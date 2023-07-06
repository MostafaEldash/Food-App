import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? elevation;
  final Color? backgroundColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? internalPadding;
  final double radius;
  final Widget? child;
  final double width;
  final double heigth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const DefaultMaterialButton({
    super.key,
    required this.onPressed,
    this.elevation,
    this.backgroundColor,
    this.splashColor,
    this.internalPadding,
    this.radius = 10.0,
    this.child,
    this.width = double.infinity,
    this.heigth = 50,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: elevation,
        splashColor: splashColor,
        padding: internalPadding,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: child,
      ),
    );
  }
}
