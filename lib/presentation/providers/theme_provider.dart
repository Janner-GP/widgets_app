import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final colorsListProvider = Provider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);


class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = New instance de AppTheme
  ThemeNotifier() : super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeSelectedColor(int index ) {
    state = state.copyWith( selectedColor: index);
  }

}