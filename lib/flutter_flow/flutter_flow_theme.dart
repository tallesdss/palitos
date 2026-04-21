// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF6B5FEF); // accent-primary
  late Color secondary = const Color(0xFFE0E3E7); // background soft
  late Color tertiary = const Color(0xFFF5A623); // amber
  late Color alternate = const Color(0xFFF1F4F8);
  late Color primaryText = const Color(0xFF12141C);
  late Color secondaryText = const Color(0xFF5C5A6A);
  late Color primaryBackground = const Color(0xFFF8F9FF);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x406B5FEF);
  late Color accent2 = const Color(0x4C00BFFF);
  late Color accent3 = const Color(0x4C2ECC71);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF1FBF7A);
  late Color warning = const Color(0xFFF5A623);
  late Color error = const Color(0xFFE84040);
  late Color info = const Color(0xFFFFFFFF);
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF6B5FEF); // accent-primary
  late Color secondary = const Color(0xFF1A1D28); // bg-card
  late Color tertiary = const Color(0xFFF5A623); // amber
  late Color alternate = const Color(0xFF222535); // bg-elevated
  late Color primaryText = const Color(0xFFF0EFFB); // text-primary
  late Color secondaryText = const Color(0xFF9896A8); // text-secondary
  late Color primaryBackground = const Color(0xFF0A0B10); // bg-base
  late Color secondaryBackground = const Color(0xFF12141C); // bg-surface
  late Color accent1 = const Color(0x406B5FEF); // accent-glow
  late Color accent2 = const Color(0xFF2A2E3F); // bg-hover
  late Color accent3 = const Color(0xFF5C5A6A); // text-muted
  late Color accent4 = const Color(0x1AFFFFFF); // border-default
  late Color success = const Color(0xFF1FBF7A); // green
  late Color warning = const Color(0xFFF5A623); // amber
  late Color error = const Color(0xFFE84040); // red
  late Color info = const Color(0xFF6B5FEF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Syne';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 57.0,
        letterSpacing: -0.03,
      );
  String get displayMediumFamily => 'Syne';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 45.0,
        letterSpacing: -0.03,
      );
  String get displaySmallFamily => 'Syne';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 32.0,
        letterSpacing: -0.03,
      );
  String get headlineLargeFamily => 'Syne';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w700,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Syne';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Syne';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Syne';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleMediumFamily => 'Syne';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Syne',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        letterSpacing: 0.02,
      );
  String get titleSmallFamily => 'DM Sans';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'DM Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Syne';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Syne',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        letterSpacing: 0.02,
      );
  String get labelMediumFamily => 'Syne';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Syne',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        letterSpacing: 0.02,
      );
  String get labelSmallFamily => 'Syne';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Syne',
        color: theme.secondaryText,
        fontWeight: FontWeight.w700,
        fontSize: 10.0,
        letterSpacing: 0.18,
      );
  String get bodyLargeFamily => 'DM Sans';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'DM Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.6,
      );
  String get bodyMediumFamily => 'DM Sans';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'DM Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
        height: 1.6,
      );
  String get bodySmallFamily => 'DM Sans';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'DM Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
