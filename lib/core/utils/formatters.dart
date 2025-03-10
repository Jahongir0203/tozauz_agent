import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static final priceFormatter = MaskTextInputFormatter(
      mask: '## ### ### SUM', filter: {"#": RegExp(r'[0-9]')});

  static final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );
}

extension ViewCountFormatter on int {
  /// Formats the view count to display "K" for thousands and "M" for millions.
  /// Example: 1000 -> "1K", 1500 -> "1.5K", 1000000 -> "1M"
  String get formattedViewCount {
    if (this >= 1000000) {
      // Convert to millions
      double million = this / 1000000;
      return '${million.toStringAsFixed(million.truncateToDouble() == million ? 0 : 1)}M';
    } else if (this >= 1000) {
      // Convert to thousands
      double thousand = this / 1000;
      return '${thousand.toStringAsFixed(thousand.truncateToDouble() == thousand ? 0 : 1)}K';
    } else {
      // Return the number as is
      return toString();
    }
  }
}