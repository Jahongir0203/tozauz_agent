import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/core/values/app_strings.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/common/widget/custom_page_selector.dart';
import 'package:tozauz_agent/features/home/data/models/earning_filter_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/part/container_income_bottom_sheet.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/container_detail_list_item.dart';

class ContainerDetailScreen extends StatefulWidget {
  final String box;
  final int id;

  const ContainerDetailScreen({super.key, required this.box, required this.id});

  @override
  State<ContainerDetailScreen> createState() => _ContainerDetailScreenState();
}

class _ContainerDetailScreenState extends State<ContainerDetailScreen> {
  int currentPage = 0;

  DateRange? selectedDateRange;
  bool doubleMonth = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<ContainerCubit>()
        ..fetchEarning(
          EarningFilterModel(
            page: 1,
            id: widget.id,
          ),
        ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.box,
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
                      return Center(
                        child: DateRangePickerWidget(
                          doubleMonth: doubleMonth,
                          maximumDateRangeLength: 365,
                          minimumDateRangeLength: 2,
                          height: context.h * 0.4,
                          initialDateRange: selectedDateRange,
                          // disabledDates: [DateTime(2023, 11, 20),],
                          initialDisplayedDate: selectedDateRange?.start ??
                              DateTime(2023, 11, 20),
                          onDateRangeChanged: (d) {
                            setState(() {
                              selectedDateRange = d;
                            });
                          },
                        ),
                      );
                    });
              },
            ),
            16.verticalSpace,
            BlocBuilder<ContainerCubit, ContainerState>(
              builder: (context, state) {
                if (state.earningListStatus == Status.LOADING) {
                  return LoadingWidget();
                } else if (state.earningListStatus == Status.ERROR) {
                  return Column(
                    children: [
                      20.verticalSpace,
                      Text(
                        state.boxListFailure.getLocalizedMessage(context),
                        style: AppTextStyles().body20w6,
                      ),
                      20.verticalSpace,
                      CustomButton(
                        text: "Qayta yuklash",
                        onTap: () {
                          context.read<ContainerCubit>().fetchBoxes();
                        },
                      ),
                    ],
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ContainerDetailListItem(
                      onTap: () {
                        ContainerIncomeBottomSheet(
                          mode: state.earningList[index],
                        ).show(context);
                      },
                      model: state.earningList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return customDivider;
                  },
                  itemCount: state.earningList.length,
                );
              },
            ),
            16.verticalSpace,
            Spacer(),
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
      ),
    );
  }
}
