import 'package:app_ui/src/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

/// Namespace for the Tictactoe [ThemeData].
class TictactoeTheme {
  /// Standard `ThemeData` for Tictactoe UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme:
          ColorScheme.fromSwatch(accentColor: TictactoeColors.primary),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: TictactoeColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
    );
  }

  /// `ThemeData` for Tictactoe UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Tictactoe UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for Tictactoe UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: TictactoeTextStyle.headline1,
      headline2: TictactoeTextStyle.headline2,
      headline3: TictactoeTextStyle.headline3,
      headline4: TictactoeTextStyle.headline4,
      headline5: TictactoeTextStyle.headline5,
      headline6: TictactoeTextStyle.headline6,
      subtitle1: TictactoeTextStyle.subtitle1,
      subtitle2: TictactoeTextStyle.subtitle2,
      bodyText1: TictactoeTextStyle.bodyText1,
      bodyText2: TictactoeTextStyle.bodyText2,
      caption: TictactoeTextStyle.caption,
      overline: TictactoeTextStyle.overline,
      button: TictactoeTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: TictactoeTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: TictactoeTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: TictactoeTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: TictactoeTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: TictactoeTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: TictactoeTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: TictactoeTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: TictactoeTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: TictactoeTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: TictactoeTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: TictactoeTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: TictactoeTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: TictactoeTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      headline1: TictactoeTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _largeTextScaleFactor,
      ),
      headline2: TictactoeTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _largeTextScaleFactor,
      ),
      headline3: TictactoeTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _largeTextScaleFactor,
      ),
      headline4: TictactoeTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _largeTextScaleFactor,
      ),
      headline5: TictactoeTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _largeTextScaleFactor,
      ),
      headline6: TictactoeTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle1: TictactoeTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle2: TictactoeTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText1: TictactoeTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText2: TictactoeTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _largeTextScaleFactor,
      ),
      caption: TictactoeTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _largeTextScaleFactor,
      ),
      overline: TictactoeTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _largeTextScaleFactor,
      ),
      button: TictactoeTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: TictactoeColors.primary);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        primary: TictactoeColors.primary,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: TictactoeColors.white, width: 2),
        primary: TictactoeColors.white,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: TictactoeColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: TictactoeColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: TictactoeColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: TictactoeColors.primary,
        ),
      ),
      labelColor: TictactoeColors.primary,
      unselectedLabelColor: TictactoeColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: TictactoeColors.black25,
    );
  }
}
