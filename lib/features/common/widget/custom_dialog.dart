import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../export.dart';

customDialog(BuildContext context, String title, String subtitle, String icon,
    Function()? onTap) {
  return showDialog(
      context: context,
      builder: (context) {
        return FadeInUp(
          child: AlertDialog(
            backgroundColor: AppColors.white,
            // title:  Text(title,style: Theme.of(context).textTheme.titleLarge,),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 70.w,
                  height: 70.h,
                ),
                SizedBox(height: 20.sp),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    // fontSize:
                    color: AppColors.grey2,
                  ),
                ),
                10.verticalSpace,
                onTap == null
                    ? const SizedBox.shrink()
                    : CustomButton(
                  height: 40.h,
                  textColor: AppColors.primaryColor,
                  text: "Yaxshi",
                  bgColor: AppColors.primaryColor,
                  onTap:
                  onTap,
                ),
              ],
            ),
          ),
        );
      });
}
