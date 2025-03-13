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
  int currentPage = 1;

  DateRange? selectedDateRange;
  bool doubleMonth = false;

  late EarningFilterModel filter;

  @override
  void initState() {
    filter = EarningFilterModel(
      page: 1,
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<ContainerCubit>()
        ..fetchEarning(
          filter,
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
                var cubit = context.read<ContainerCubit>();
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
                          cubit.fetchEarning(filter.copyWith(page: 1));
                        },
                      ),
                    ],
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    return cubit.fetchEarning(filter);
                  },
                  child: ListView.separated(
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
                  ),
                );
              },
            ),
            16.verticalSpace,
            Spacer(),
            Visibility(
              visible: false,
              child: BlocBuilder<ContainerCubit, ContainerState>(
                builder: (context, state) {
                  var cubit = context.read<ContainerCubit>();

                  return CustomPageSelector(
                    currentPage: currentPage,
                    maxPage: (state.earningList.length).ceil(),
                    minPage: 1,
                    onNextPage: () async {
                      if (currentPage < (state.earningList.length).ceil()) {
                        setState(() {
                          currentPage++;
                        });
                        await cubit
                            .fetchEarning(filter.copyWith(page: currentPage));
                      }
                    },
                    onPrevPage: () async {
                      if (currentPage >= 1) {
                        setState(() {
                          currentPage--;
                        });
                        await cubit
                            .fetchEarning(filter.copyWith(page: currentPage));
                      }
                    },
                    onPageChanged: (int index) async {
                      setState(() {
                        currentPage = index;
                      });
                      await cubit
                          .fetchEarning(filter.copyWith(page: currentPage));
                    },
                  );
                },
              ),
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
