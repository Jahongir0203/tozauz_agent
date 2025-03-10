import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/common/widget/custom_drop_down.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int paymentType = 0;
  int containerCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Arizalar",
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Yangi Ariza"),
            Tab(text: "Arizalar"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              SizedBox(
                width: context.w,
                child: CustomDropDownWidget(
                  list: [
                    "Eco vazir",
                    "Tashkent",
                    "Namangan",
                  ],
                  hintText: "Konater turi",
                ),
              ),
              16.verticalSpace,
              Text(
                "Konterlar soni: ",
                style: AppTextStyles().body16w6,
              ),
              SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey2,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(
                          Icons.remove,
                        ),
                      ).paddingAll(20.sp),
                    ), Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey2,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(
                          Icons.remove,
                        ),
                      ).paddingAll(20.sp),
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey2,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(
                          Icons.add,
                        ),
                      ).paddingAll(20.sp),
                    )
                  ],
                ),
              ),
              30.verticalSpace,
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.grey2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 ta Kontainer",
                      style: AppTextStyles().body16w6,
                    ),
                    10.verticalSpace,
                    TitleWithRow(
                      title: "Kontainer somi",
                      value: "1 ta",
                    ),
                    10.verticalSpace,
                    Text(
                      "Umumiy to'lov",
                      style: AppTextStyles().body20w6,
                    ),
                    16.verticalSpace,
                    CustomButton(
                      bgColor:
                          paymentType == 0 ? AppColors.green : AppColors.grey2,
                      text: "Balans bilan to'lash UZS 2000",
                      onTap: () {
                        setState(() {
                          paymentType = 0;
                        });
                      },
                    ),
                    10.verticalSpace,
                    CustomButton(
                      bgColor:
                          paymentType == 1 ? AppColors.green : AppColors.grey2,
                      text: "Karta bilan",
                      onTap: () {
                        setState(() {
                          paymentType = 1;
                        });
                      },
                    ),
                    20.verticalSpace,
                    CustomButton(
                      text: "Ariza yuborish",
                      onTap: () {},
                    )
                  ],
                ).paddingAll(24.sp),
              )
            ],
          ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
          Center(child: Text("Arizalar ro'yxati")),
        ],
      ),
    );
  }
}
