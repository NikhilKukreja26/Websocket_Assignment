import 'package:flutter/material.dart';
import 'package:websocket_assignment/resources/color_manager.dart';
import 'package:websocket_assignment/resources/fonts_manager.dart';
import 'package:websocket_assignment/resources/values_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primary,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    fontFamily: FontConstants.fontFamily,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      titleSpacing: 0,
      surfaceTintColor: ColorManager.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.primary),
      foregroundColor: ColorManager.primary,
      backgroundColor: ColorManager.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        textStyle: TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: FontSize.s12,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r8),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    ),
    useMaterial3: true,
  );
}
