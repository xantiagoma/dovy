import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class Button extends StatelessWidget {
  final AlignmentGeometry alignment;
  final bool borderOnForeground;
  final BorderRadius borderRadius;
  final Clip clipBehavior;
  final Color? color;
  final Color shadowColor;
  final Color? textColor;
  final double elevation;
  final double fontSize;
  final double height;
  final double width;
  final Duration animationDuration;
  final ShapeBorder? shape;
  final String? text;
  final TextStyle? textStyle;
  final void Function() onTap;
  final BoxBorder? border;
  final Widget? child;

  final Color? splashColor;
  final ShapeBorder? customBorder;
  final double? radius;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;

  static void voidCallback() {}

  Button({
    Key? key,
    this.alignment = Alignment.center,
    this.animationDuration = kThemeChangeDuration,
    this.borderOnForeground = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.clipBehavior = Clip.hardEdge,
    this.color,
    this.elevation = 0.0,
    this.fontSize = 15.0,
    this.height = 52,
    this.onTap = voidCallback,
    this.shadowColor = Colors.black,
    this.shape,
    this.text,
    this.textColor,
    this.textStyle,
    this.width = double.infinity,
    this.border,
    this.child,
    this.splashColor,
    this.customBorder,
    this.radius,
    this.splashFactory,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.theme.primaryColor;
    final textColor = this.textColor ?? color.inverseBW;

    return Material(
      color: color,
      borderRadius: borderRadius,
      elevation: elevation,
      shadowColor: shadowColor,
      type: MaterialType.button,
      shape: shape,
      clipBehavior: clipBehavior,
      animationDuration: animationDuration,
      borderOnForeground: borderOnForeground,
      textStyle: textStyle ??
          TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
      child: InkWell(
        splashColor: splashColor,
        borderRadius: borderRadius,
        customBorder: customBorder,
        radius: radius,
        splashFactory: splashFactory,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          alignment: alignment,
          decoration: BoxDecoration(
            border: border,
            borderRadius: borderRadius,
          ),
          child: child ?? Text(text!),
        ),
      ),
    );
  }
}
