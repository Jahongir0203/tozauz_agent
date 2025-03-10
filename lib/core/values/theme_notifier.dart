
import '../../export.dart';

class ThemeNotifier extends ValueNotifier<ThemeData> {
  bool _isDarkModeEnabled = false;
  bool _isSystemThemeEnabled = true;

  bool get isDarkMode => _isDarkModeEnabled;
  bool get isSystemMode => _isSystemThemeEnabled;

  ThemeNotifier(Brightness brightness)
      : super(brightness == Brightness.dark
      ? AppTheme.darkTheme()
      : AppTheme.lightTheme()) {
    _initializeTheme(brightness);
  }

  /// Changes the theme and notifies listeners.
  void changeTheme({required bool isSystem, required bool isDarkMode}) {
    _isDarkModeEnabled = isDarkMode;
    _isSystemThemeEnabled = isSystem;
    _savePreferences();
    value = _calculateTheme();
  }

  /// Calculates the current theme based on system or user settings.
  ThemeData _calculateTheme() {
    if (_isSystemThemeEnabled) {
      return WidgetsBinding.instance.window.platformBrightness == Brightness.dark
          ? AppTheme.darkTheme()
          : AppTheme.lightTheme();
    }
    return _isDarkModeEnabled ? AppTheme.darkTheme() : AppTheme.lightTheme();
  }

  /// Initializes the theme from stored preferences.
  Future<void> _initializeTheme(Brightness brightness) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _isDarkModeEnabled =
          prefs.getBool(ListAPI.theme) ?? (brightness == Brightness.dark);
      _isSystemThemeEnabled = prefs.getBool(ListAPI.themeIsSystem) ?? true;

      // Update the theme after loading preferences.
      value = _calculateTheme();
    } catch (e) {
      // Handle errors gracefully, e.g., log the error
      debugPrint('Error loading theme preferences: $e');
    }
  }

  /// Saves the theme settings to SharedPreferences.
  Future<void> _savePreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(ListAPI.theme, _isDarkModeEnabled);
      await prefs.setBool(ListAPI.themeIsSystem, _isSystemThemeEnabled);
    } catch (e) {
      // Handle errors gracefully, e.g., log the error
      debugPrint('Error saving theme preferences: $e');
    }
  }
}


late ThemeNotifier themeNotifier;