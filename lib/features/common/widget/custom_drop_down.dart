

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/values/theme_notifier.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';

import '../../../export.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.list,
    required this.hintText,
    this.width,
    this.onChanged,
    this.bgColor,
    this.borderColor,
    this.hintStyle,
    this.headerStyle,
    this.icColor,
    this.initialItem,
    this.padding,
    this.height,
    this.label,
    this.validator,
    this.selectController,
    this.radius, this.multiSelection, this.multiSelectionListChanged,
  });

  final List<String> list;
  final String? hintText;
  final double? width;
  final Color? bgColor;
  final Color? icColor;
  final EdgeInsets? padding;
  final SingleSelectController<String>? selectController;

  final Color? borderColor;
  final Function(String?)? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? headerStyle;
  final String? initialItem;
  final double? height;
  final String? label;
  final double? radius;
  final int? multiSelection;
  final String? Function(String? v)? validator;
  final Function(List<String> value)? multiSelectionListChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 13.sp
              ),
            ),
            // 5.verticalSpace,
          ],
          if(multiSelection == null)
            CustomDropdown<String>(
              validator: validator,
              hideSelectedFieldWhenExpanded: true,
              excludeSelected: false,
              enabled: true,
              closedHeaderPadding: padding ??
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              hintText: hintText,
              controller: selectController,
              decoration: CustomDropdownDecoration(
                // closedErrorBorderRadius: BorderRadius.circular(radius ?? 10.r),
                // closedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                // expandedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                expandedFillColor: Theme.of(context).scaffoldBackgroundColor,
                // closedSuffixIcon: SvgPicture.asset(
                //   AppIcons.dropDown,
                //   colorFilter: ColorFilter.mode(
                //     icColor ?? AppColors.black,
                //     BlendMode.srcIn,
                //   ),
                // ),
                errorStyle: AppTextStyles().body12w4.copyWith(
                  color: Colors.red,
                ),
                closedErrorBorder: Border.all(color: Colors.red, width: 1),
                closedFillColor: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
                listItemDecoration: ListItemDecoration(
                  selectedIconColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor,
                  selectedColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.2),
                  highlightColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.3),
                  splashColor: AppColors.transparent,
                ),
                hintStyle: hintStyle ??
                    context.theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey2,
                        fontSize: 14.sp),
                listItemStyle: context.theme.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                headerStyle: headerStyle ??
                    Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
              ),
              items: list,
              initialItem: initialItem,
              onChanged: onChanged,
            ),
          if(multiSelection != null && multiSelection == 2) ...[
            CustomDropdown<String>.search(
              validator: validator,
              hideSelectedFieldWhenExpanded: true,
              excludeSelected: false,
              enabled: true,
              closedHeaderPadding: padding ??
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              hintText: hintText,
              controller: selectController,
              decoration: CustomDropdownDecoration(
                closedErrorBorderRadius: BorderRadius.circular(radius ?? 10.r),
                closedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                expandedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                expandedFillColor: AppColors.white,
                // closedSuffixIcon: SvgPicture.asset(
                //   AppIcons.dropDown,
                //   colorFilter: ColorFilter.mode(
                //     icColor ?? AppColors.black,
                //     BlendMode.srcIn,
                //   ),
                // ),
                errorStyle: AppTextStyles().body12w4.copyWith(
                  color: Colors.red,
                ),
                closedErrorBorder: Border.all(color: Colors.red, width: 1),
                closedBorder:
                Border.all(color: borderColor ?? AppColors.grey2),
                closedFillColor: bgColor ?? AppColors.white,
                listItemDecoration: ListItemDecoration(
                  selectedIconColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor,
                  selectedColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.2),
                  highlightColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.3),
                  splashColor: AppColors.transparent,
                ),
                hintStyle: hintStyle ??
                    context.theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey2,
                        fontSize: 14.sp),
                listItemStyle: context.theme.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                headerStyle: headerStyle ??
                    Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        fontSize: 14.sp),
              ),
              items: list,
              initialItem: initialItem,
              onChanged: onChanged,
            ),
          ],
          if(multiSelection != null && multiSelection == 3) ...[
            CustomDropdown<String>.multiSelect(
              hideSelectedFieldWhenExpanded: true,
              enabled: true,
              closedHeaderPadding: padding ??
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              hintText: hintText,
              controller: selectController,
              decoration: CustomDropdownDecoration(
                closedErrorBorderRadius: BorderRadius.circular(radius ?? 10.r),
                closedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                expandedBorderRadius: BorderRadius.circular(radius ?? 10.r),
                expandedFillColor: AppColors.white,
                // closedSuffixIcon: SvgPicture.asset(
                //   AppIcons.dropDown,
                //   colorFilter: ColorFilter.mode(
                //     icColor ?? AppColors.black,
                //     BlendMode.srcIn,
                //   ),
                // ),
                errorStyle: AppTextStyles().body12w4.copyWith(
                  color: Colors.red,
                ),
                closedErrorBorder: Border.all(color: Colors.red, width: 1),
                closedBorder:
                Border.all(color: borderColor ?? AppColors.grey2),
                closedFillColor: bgColor ?? AppColors.white,
                listItemDecoration: ListItemDecoration(
                  selectedIconColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor,
                  selectedColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.2),
                  highlightColor: themeNotifier.isDarkMode
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(.3),
                  splashColor: AppColors.transparent,
                ),
                hintStyle: hintStyle ??
                    context.theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey2,
                        fontSize: 14.sp),
                listItemStyle: context.theme.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                headerStyle: headerStyle ??
                    Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        fontSize: 14.sp),
              ),
              items: list,
              onListChanged: (List<String> value){
                if(multiSelectionListChanged != null) {
                  multiSelectionListChanged!(value);
                }
              },
            ),
          ]

        ],
      ),
    );
  }
}
