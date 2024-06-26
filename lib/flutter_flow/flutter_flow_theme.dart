// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
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

  late Color violetUltra1;
  late Color jauneOrange1;
  late Color jo2;
  late Color jo3;
  late Color jo4;
  late Color jo5;
  late Color vu2;
  late Color seasalt;
  late Color antiflashWhite;
  late Color platinum;
  late Color frenchGray;
  late Color frenchGray2;
  late Color slateGray;
  late Color outerSpace;
  late Color onyx;
  late Color eerieBlack;
  late Color revoBG;
  late Color revoNavSelected;
  late Color revoHooverBlue;
  late Color revoNavSelectedText;
  late Color revoWhite;
  late Color revoCardButtonBg;
  late Color revoCardBlueText;
  late Color revoCardTextColor;
  late Color revoCardTextColorUnselected;
  late Color revoCardColorInactiveTxt;
  late Color revoSearchBarBg;
  late Color revoSearchIconColor;
  late Color revoSearchTxtColor;
  late Color appleBg;
  late Color appText2;
  late Color appleTxt1;
  late Color appleButton;
  late Color rougeMalongo;
  late Color malonGold;

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

  late Color primary = const Color(0xFF5E35B1);
  late Color secondary = const Color(0xFF666666);
  late Color tertiary = const Color(0xFF999999);
  late Color alternate = const Color(0xFFCCCCCC);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF333333);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF5F5F5);
  late Color accent1 = const Color(0xFFFF8080);
  late Color accent2 = const Color(0xFF80FF80);
  late Color accent3 = const Color(0xFF8080FF);
  late Color accent4 = const Color(0xFF1C4494);
  late Color success = const Color(0xFF00FF00);
  late Color warning = const Color(0xFFFFCC00);
  late Color error = const Color(0xFFFF0000);
  late Color info = const Color(0xFF00CCFF);

  late Color violetUltra1 = Color(0xFF240046);
  late Color jauneOrange1 = Color(0xFFFF9E00);
  late Color jo2 = Color(0xFFFF9100);
  late Color jo3 = Color(0xFFFF8500);
  late Color jo4 = Color(0xFFFF7900);
  late Color jo5 = Color(0xFFFF6D00);
  late Color vu2 = Color(0xFF3C096C);
  late Color seasalt = Color(0xFFF8F9FA);
  late Color antiflashWhite = Color(0xFFE9ECEF);
  late Color platinum = Color(0xFFDEE2E6);
  late Color frenchGray = Color(0xFFCED4DA);
  late Color frenchGray2 = Color(0xFFADB5BD);
  late Color slateGray = Color(0xFF6C757D);
  late Color outerSpace = Color(0xFF495057);
  late Color onyx = Color(0xFF343A40);
  late Color eerieBlack = Color(0xFF212529);
  late Color revoBG = Color(0xFFF7F7F7);
  late Color revoNavSelected = Color(0xFFF4F7FE);
  late Color revoHooverBlue = Color(0xFF95B1F1);
  late Color revoNavSelectedText = Color(0xFF2C64E3);
  late Color revoWhite = Color(0xFFFFFFFF);
  late Color revoCardButtonBg = Color(0xFFE8F0FC);
  late Color revoCardBlueText = Color(0xFF376CE4);
  late Color revoCardTextColor = Color(0xFF1A1C1F);
  late Color revoCardTextColorUnselected = Color(0xFF778089);
  late Color revoCardColorInactiveTxt = Color(0xFFBDC4CC);
  late Color revoSearchBarBg = Color(0xFFEDEFF2);
  late Color revoSearchIconColor = Color(0xFF778089);
  late Color revoSearchTxtColor = Color(0xFF778089);
  late Color appleBg = Color(0xFFF5F5F7);
  late Color appText2 = Color(0xFF7F7E83);
  late Color appleTxt1 = Color(0xFF0E0E10);
  late Color appleButton = Color(0xFF0071E3);
  late Color rougeMalongo = Color(0xFFE30613);
  late Color malonGold = Color(0xFFCFB57B);
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

  String get displayLargeFamily => 'Inter';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Inter';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Inter';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Manrope';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Manrope',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Manrope';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Manrope',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Manrope';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Manrope',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Manrope';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Manrope',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Manrope';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Manrope',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Manrope';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Manrope',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Manrope';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Manrope',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Manrope';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Manrope',
        color: theme.primaryText,
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
            );
}
