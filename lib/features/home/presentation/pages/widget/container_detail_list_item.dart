import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/home/data/models/earning_response_model.dart';

class ContainerDetailListItem extends StatelessWidget {
  final Function() onTap;
  final EarningResponseModel model;
  const ContainerDetailListItem({super.key, required this.onTap, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.primaryOpacity,
      hoverColor: AppColors.primaryOpacity,
      highlightColor: AppColors.primaryOpacity,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.tarrif ?? '',
            style: AppTextStyles().body16w6,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+UZS ${model.amount}",
                style: AppTextStyles().body14w6.copyWith(
                      color: AppColors.green,
                    ),
              ),
              Text(
                model.createdAt?.toDateFormat() ?? '',
                style: AppTextStyles().body12w6.copyWith(
                  color: AppColors.grey4,
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16.sp),
    );
  }
}
