import 'package:flutter/material.dart';

class AppTextStyle {
  final Brightness brightness;

  factory AppTextStyle.light() {
    return AppTextStyle._(Brightness.light);
  }

  factory AppTextStyle.dark() {
    return AppTextStyle._(Brightness.dark);
  }

  AppTextStyle._(this.brightness);

  static const Color _primaryLightColor = Colors.white;
  static const Color _primaryDarkColor = Colors.black87;

  static const Color _secondaryLightColor = Colors.white70;
  static const Color _secondaryDarkColor = Colors.black54;

  Color get _currentPrimaryColor => (brightness == Brightness.light) ? _primaryLightColor : _primaryDarkColor;
  Color get _currentSecondaryColor => (brightness == Brightness.light) ? _secondaryLightColor : _secondaryDarkColor;

  TextStyle get display => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        fontFamily: 'SF-Pro',
        color: _currentPrimaryColor,
        letterSpacing: .5,
      );

  TextStyle get body => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'SF-Pro',
        color: _currentPrimaryColor,
        letterSpacing: .5,
      );

  TextStyle get headline => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'SF-Pro',
        color: _currentSecondaryColor,
      );

  TextStyle get label => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF-Pro',
        color: _currentSecondaryColor,
      );
}