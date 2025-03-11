import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';

class ContainerDetailListItem extends StatelessWidget {
  final Function() onTap;
  const ContainerDetailListItem({super.key, required this.onTap});

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
            "title",
            style: AppTextStyles().body16w6,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+UZS 450",
                style: AppTextStyles().body14w6.copyWith(
                      color: AppColors.green,
                    ),
              ),
              Text(
                "2025 M03 7 15:51",
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
