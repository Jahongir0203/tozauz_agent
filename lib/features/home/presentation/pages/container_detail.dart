import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/export.dart';
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

  DateRange? selectedDateRange;
  bool doubleMonth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "EcoVazir",
      ),
      body: Column(
        children: [
          20.verticalSpace,
          CustomButton(
            text: selectedDateRange.toString(),
            onTap: () {
              showDateRangePickerDialog(
                  context: context,
                  builder: (context, _) {
                    return  Center(
                      child: DateRangePickerWidget(
                        doubleMonth: doubleMonth,
                        maximumDateRangeLength: 365,
                        minimumDateRangeLength: 2,
                        height: context.h * 0.4,
                        initialDateRange: selectedDateRange,
                        // disabledDates: [DateTime(2023, 11, 20),],
                        initialDisplayedDate:
                        selectedDateRange?.start ?? DateTime(2023, 11, 20),
                        onDateRangeChanged: (d) {
                          setState(() {
                            selectedDateRange = d;
                          });
                        },
                      ),
                    );
                  }
              );
            },
          ),
          16.verticalSpace,
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
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
            maxPage: (7).ceil(),
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
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
