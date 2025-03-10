// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/utils/helper_widget.dart';
import 'package:tozauz_agent/core/utils/size_config.dart' show wi;
import 'package:tozauz_agent/core/values/app_assets.dart' show AppIcons;
import 'package:tozauz_agent/core/values/app_colors.dart' show AppColors;


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? leftIcon;
  final bool isDivider;
  final List<Widget>? action;

  final String? rightIcon;
  final Function()? leftOnTap;
  final Function()? rightOnTap;

  const CustomAppBar({
    super.key,
     this.title,
     this.leftIcon,
    this.rightIcon,
     this.leftOnTap,
     this.rightOnTap,
    this.isDivider = true, this.action,
  }) : preferredSize =  const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.1),
          child: isDivider ? customDivider : const SizedBox.shrink()),
      title: Text(title ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.primaryColor
      )),
      leading: leftIcon != null 
          ? ScaleButton(
                  bound: 0.040,
                  onTap: leftOnTap,
                  child: SvgPicture.asset(
                      leftIcon ?? AppIcons.noImg))
               .paddingAll(14)
          : const SizedBox.shrink(),
      actions: action ?? [
        rightIcon != null
            ? ScaleButton(
                    bound: 0.040,
                    onTap: rightOnTap,
                    child: SvgPicture.asset(rightIcon ?? AppIcons.noImg))
                .paddingOnly(right: wi(16))
            : const SizedBox.shrink(),
      ],
    );
  }
}
