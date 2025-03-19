import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/extension/number_formatter.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

import '../../../../../../core/utils/locale_keys.g.dart';

class PaymentHistoryBottomSheet extends StatelessWidget {

  const PaymentHistoryBottomSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.paymentRequestHistory.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        10.verticalSpace,
        TitleWithRow(
          title: LocaleKeys.amount.tr(),
          value: "UZS 100",
        ),
        TitleWithRow(
          title: LocaleKeys.status.tr(),
          value: "Tasdiqlangan",
        ),
        TitleWithRow(
          title: LocaleKeys.cardNumber.tr(),
          value: "1123 2344 4566 4566",
        ),
        TitleWithRow(
          title: LocaleKeys.date.tr(),
          value: DateTime.now().toDateFormat(),
        ),
        20.verticalSpace,
        CustomButton(
          text: "Yopish",
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    ).paddingAll(24.sp);
  }

  show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return this;
      },
    );
  }
}
