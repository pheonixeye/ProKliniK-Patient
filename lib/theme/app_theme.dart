import 'package:flutter/material.dart';
import 'package:patient/providers/locale_px.dart';
import 'package:provider/provider.dart';

class AppTheme {
  const AppTheme();

  static final _theme = ThemeData(
    useMaterial3: true,
    fontFamily: "IBM",
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        overlayColor: WidgetStatePropertyAll(Colors.amber.shade500),
        surfaceTintColor: WidgetStatePropertyAll(Colors.amber.shade500),
        mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white,
      thickness: 3,
      space: 3,
      indent: 20,
      endIndent: 20,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.green.shade500.withOpacity(0.9),
      elevation: 8,
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
    ),
  );

  static get theme => _theme;

  static RoundedRectangleBorder localizedCardBorder(
    BuildContext context,
    int index,
  ) {
    final isEnglish = context.read<PxLocale>().lang == "en";
    const borderRadius = 16.0;
    if (index == 1 || index == 2) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      );
    }
    if (isEnglish && index == 0) {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
        ),
      );
    } else if (isEnglish && index == 3) {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );
    } else if (!isEnglish && index == 0) {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );
    } else {
      return const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
        ),
      );
    }
  }
}
