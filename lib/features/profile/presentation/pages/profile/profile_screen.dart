import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/number_formatter.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/utils/helper_widget.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/profile/presentation/pages/profile/widget/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileActionModel> actions = [
      ProfileActionModel(
        icon: Icons.call,
        title: "Phone number",
        value: "998123456789".formatUzPhoneNumber(),
        onTap: () {},
      ),
      ProfileActionModel(
        icon: Icons.wallet,
        title: "Balance",
        value: "UZS 123456",
        onTap: () {},
      ),
      ProfileActionModel(
        icon: Icons.security_outlined,
        title: "Update password",
        value: "",
        onTap: () {},
      ),
      ProfileActionModel(
        icon: Icons.logout,
        title: "Logout",
        value: "",
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.primaryOpacity,
                child: Text(
                  "R",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              10.horizontalSpace,
              Text(
                "Ulugbek Boriyev",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          40.verticalSpace,
          DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                  ),
                ]),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProfileItem(
                  icon: actions[index].icon,
                  title: actions[index].title,
                  onTap: actions[index].onTap,
                  value: actions[index].value,
                );
              },
              separatorBuilder: (context, index) => customDivider,
              itemCount: actions.length,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
    );
  }
}

class ProfileActionModel {
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;

  ProfileActionModel({
    required this.title,
    required this.value,
    required this.onTap,
    required this.icon,
  });
}
