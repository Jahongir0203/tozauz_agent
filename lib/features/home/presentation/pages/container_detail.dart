import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/utils/helper_widget.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/common/widget/custom_page_selector.dart';
import 'package:tozauz_agent/features/home/presentation/pages/part/container_income_bottom_sheet.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/container_detail_list_item.dart';

class ContainerDetailScreen extends StatefulWidget {
  const ContainerDetailScreen({super.key});

  @override
  State<ContainerDetailScreen> createState() => _ContainerDetailScreenState();
}

class _ContainerDetailScreenState extends State<ContainerDetailScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "EcoVazir",
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              itemBuilder: (context, index) {
                return ContainerDetailListItem(
                  onTap: () {
                    ContainerIncomeBottomSheet(
                      title: "$index title",
                    ).show(context);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return customDivider;
              },
              itemCount: 20,
            ),
          ),
          16.verticalSpace,
          CustomPageSelector(
            currentPage: currentPage,
            maxPage: (10).ceil(),
            minPage: 1,
            onNextPage: () {
              if (currentPage < (10).ceil()) {
                setState(() {
                  currentPage++;
                });
              }
            },
            onPrevPage: () {
              if (currentPage >= 1) {
                setState(() {
                  currentPage--;
                });
              }
            },
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          SizedBox(
            height: customButtonPadding,
          ),
        ],
      ),
    );
  }
}
