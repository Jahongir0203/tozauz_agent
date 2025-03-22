import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/core/utils/locale_keys.g.dart';

import '../../export.dart';

class StatusManager {
  static String getStatus(String value) {
    switch (value) {
      case 'approved':
        return LocaleKeys.approved.tr();
      case 'pending':
        return LocaleKeys.pending.tr();
      case 'rejected':
        return LocaleKeys.rejected.tr();
      case 'in_way':
        return LocaleKeys.inWay.tr();
      case 'delivered':
        return LocaleKeys.delivered.tr();

      default:
        return '';
    }
  }

 static Color getStatusColor(String value) {
    switch (value) {
      case 'approved':
        return Colors.green; // Green for approved
      case 'pending':
        return Colors.orange; // Orange for pending
      case 'rejected':
        return Colors.red; // Red for rejected
      case 'in_way':
        return Colors.blue; // Blue for in_way
      case 'delivered':
        return Colors.purple; // Purple for delivered
      default:
        return Colors.grey; // Grey for unknown status
    }
  }

  static String getPaymentType(String value) {
    switch (value) {
      case 'bank_account':
        return LocaleKeys.bankAccount.tr();
      case 'card':
        return LocaleKeys.card.tr();
      default:
        return '';
    }
  }
}
