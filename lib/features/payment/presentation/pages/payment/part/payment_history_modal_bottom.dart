import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/extension/number_formatter.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

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
          "Pul so'rovi tarixi",
          style: AppTextStyles().body16w6,
        ),
        10.verticalSpace,
        TitleWithRow(
          title: 'Amount: ',
          value: "UZS 100",
        ),
        TitleWithRow(
          title: 'Status: ',
          value: "Tasdiqlangan",
        ),
        TitleWithRow(
          title: 'Card number: ',
          value: "1123 2344 4566 4566",
        ),
        TitleWithRow(
          title: 'Date: ',
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
      builder: (context) {
        return this;
      },
    );
  }
}
