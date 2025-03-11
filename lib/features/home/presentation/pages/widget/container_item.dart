import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';
import 'package:tozauz_agent/features/home/data/models/container_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

class ContainerItem extends StatelessWidget {
  final ContainerModel model;
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
            color: AppColors.white,
          ),
          child: Column(
            children: [
              TitleWithRow(
                title: 'Doramad: ',
                value: model.daromad,
              ),
              TitleWithRow(
                title: 'Oxirgi bo‘shatish: ',
                value: "${model.price}/${model.currency}",
              ),
              TitleWithRow(
                title: 'Narxi: ',
                value: "${model.price}/${model.currency}",
              ),
              TitleWithRow(
                title: 'Holati: ',
                value: model.status == 1 ? "Activ" : "Aktiv emas",
              ),
              TitleWithRow(
                title: 'Sim module: ',
                value: model.simModul,
              ),
              TitleWithRow(
                title: 'Manzil: ',
                value: model.address,
              ),
            ],
          ).paddingAll(24.sp),
        ),
      ),
    );
  }
}
