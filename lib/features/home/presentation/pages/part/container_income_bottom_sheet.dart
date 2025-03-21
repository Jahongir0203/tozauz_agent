import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/extension/number_formatter.dart';
import 'package:tozauz_agent/core/utils/locale_keys.g.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/home/data/models/earning_response_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

class ContainerIncomeBottomSheet extends StatelessWidget {
  final EarningResponseModel mode;

  const ContainerIncomeBottomSheet({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.incomeDescription.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        10.verticalSpace,
        TitleWithRow(
          title: LocaleKeys.user.tr(),
          value: "Ulug'bek",
        ),
        TitleWithRow(
          title: LocaleKeys.amount.tr(),
          value: "UZS 750",
        ),
        TitleWithRow(
          title: LocaleKeys.date.tr(),
          value: DateTime.now().toDateFormat(),
        ),
        TitleWithRow(
          title: LocaleKeys.description.tr(),
          value: "Baklashka 10 l",
        ),
        TitleWithRow(
          title: LocaleKeys.phoneNumberR.tr(),
          value: "+998901234567".formatUzPhoneNumber(),
        ),
        TitleWithRow(
          title: 'ID: ',
          value: "112344",
        ),
        20.verticalSpace,
        CustomButton(
          text: LocaleKeys.close.tr(),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    ).paddingAll(24.sp);
  }

  show(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      context: context,

      builder: (context) {

        return this;
      },
    );
  }
}
