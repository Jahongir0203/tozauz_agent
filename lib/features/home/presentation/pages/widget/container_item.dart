import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/utils/locale_keys.g.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/home/data/models/box_response_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

class ContainerItem extends StatelessWidget {
  final BoxResponseModel model;
  final Function() onTap;

  const ContainerItem({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primaryOpacity,
        hoverColor: AppColors.primaryOpacity,
        highlightColor: AppColors.primaryOpacity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 0),
              )
            ],
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.verticalSpace,
              TitleWithRow(
                title: LocaleKeys.earnings.tr(),
                value:
                    "UZS ${double.parse(model.sellerShare ?? '').toStringAsFixed(0)}/${double.parse(model.sellerPercentage ?? '').toStringAsFixed(0)}%",
              ),
              TitleWithRow(
                title: LocaleKeys.lastEmpty.tr(),
                value: "",
              ),
              TitleWithRow(
                title: LocaleKeys.price.tr(),
                value: "UZS ${model.category?.summa}",
              ),
              TitleWithRow(
                title: LocaleKeys.status.tr(),
                value: model.isActive! ? LocaleKeys.active.tr(): LocaleKeys.notActive.tr(),
              ),
              TitleWithRow(
                title: LocaleKeys.simModule.tr(),
                value: model.simModule.toString() ?? '',
              ),
              TitleWithRow(
                title: LocaleKeys.address.tr(),
                value: model.address ?? '',
              ),
            ],
          ).paddingAll(24.sp),
        ),
      ),
    );
  }
}
