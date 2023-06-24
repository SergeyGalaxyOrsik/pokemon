part of core_ui;


final ThemeData lightTheme = ThemeData.light().copyWith(
  // appBarTheme: _getAppBarTheme(),
  scaffoldBackgroundColor: AppColors.greyBackground,
  primaryColor: AppColors.primaryPok,
);

// TextTheme _getTextTheme() {
//   return TextTheme(
//     titleMedium: AppFonts.normal13,
//     bodyMedium: AppFonts.normal13,
//   ).apply(
//     bodyColor: _appColors.primaryBg,
//     displayColor: _appColors.primaryBg,
//   );
// }

// InputDecorationTheme _getInputDecorationTheme() {
//   return InputDecorationTheme(
//     hintStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
//     border: OutlineInputBorder(
//       borderRadius: const BorderRadius.all(
//         Radius.circular(AppDimens.BORDER_RADIUS_12),
//       ),
//       borderSide: BorderSide(
//         color: _appColors.primaryBg,
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: const BorderRadius.all(
//         Radius.circular(AppDimens.BORDER_RADIUS_12),
//       ),
//       borderSide: BorderSide(
//         color: _appColors.primaryBg,
//         width: 2,
//       ),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: const BorderRadius.all(
//         Radius.circular(AppDimens.BORDER_RADIUS_6),
//       ),
//       borderSide: BorderSide(
//         color: _appColors.primaryBg,
//         width: 2,
//       ),
//     ),
//     labelStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
//   );
// }
