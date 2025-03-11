import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title, value;
  final Function() onTap;

  const ProfileItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryOpacity,
      hoverColor: AppColors.primaryOpacity,
      highlightColor: AppColors.primaryOpacity,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            // color: AppC
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: AppColors.black.withAlpha(0x80),
            ),
            10.horizontalSpace,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ).paddingAll(
          16.sp,
        ),
      ),
    );
  }
}
