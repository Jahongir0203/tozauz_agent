import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/core/utils/locale_keys.g.dart';

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
