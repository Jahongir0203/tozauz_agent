import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/extension/number_formatter.dart';
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
          "Daromat tafsilotlari",
          style: AppTextStyles().body16w6,
        ),
        10.verticalSpace,
        TitleWithRow(
          title: 'Foydalanuvchi: ',
          value: "Ulug'bek",
        ),
        TitleWithRow(
          title: 'Miqdor: ',
          value: "UZS 750",
        ),
        TitleWithRow(
          title: 'Sana: ',
          value: DateTime.now().toDateFormat(),
        ),
        TitleWithRow(
          title: 'Tarif: ',
          value: "Baklashka 10 l",
        ),
        TitleWithRow(
          title: 'Telefon raqam: ',
          value: "+998901234567".formatUzPhoneNumber(),
        ),
        TitleWithRow(
          title: 'ID: ',
          value: "112344",
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
