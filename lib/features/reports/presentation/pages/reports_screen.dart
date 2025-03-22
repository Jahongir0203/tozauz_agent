import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/custom_drop_down.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/title_with_row.dart';
import 'package:tozauz_agent/features/reports/presentation/cubit/reports_cubit/reports_cubit.dart';
import 'package:tozauz_agent/features/reports/presentation/pages/reports_history.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int paymentType = 0;
  int containerCount = 1;
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.reports.tr(),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: LocaleKeys.newReports.tr()),
            Tab(text: LocaleKeys.reportsHistory.tr()),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => inject<ReportsCubit>(),
        child: TabBarView(
          controller: _tabController,
          children: [
            BlocConsumer<ReportsCubit, ReportsState>(
              listener: (context, state) {
                if (state.status == Status.SUCCESS) {
                  customDelightToastBar(
                          text: LocaleKeys.createPaymentSuccess.tr())
                      .show(context);
                }

                if (state.status == Status.ERROR) {
                  customDelightToastBar(
                          text: state.failure.getLocalizedMessage(context),
                          isSuccess: false)
                      .show(context);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.w,
                        child: CustomDropDownWidget(
                          list: ["Eco vazir"],
                          hintText: LocaleKeys.typeOfContainers.tr(),
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        LocaleKeys.numOfContainers.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      10.verticalSpace,
                      Row(
                        spacing: 10.w,
                        children: [
                          Expanded(
                            child: IconButton.filled(
                              style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              onPressed: () {
                                if (containerCount > 1) {
                                  setState(() {
                                    containerCount--;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                color: AppColors.white,
                              ).paddingAll(9.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.grey2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Text(
                                containerCount.toString(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge,
                              ).paddingAll(16.sp),
                            ),
                          ),
                          Expanded(
                            child: IconButton.filled(
                              style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              onPressed: () {
                                setState(() {
                                  containerCount++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: AppColors.white,
                              ).paddingAll(9.sp),
                            ),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      CustomTextField(
                        textInputType: TextInputType.text,
                        textEditingController: commentController,
                        hintText: LocaleKeys.comment.tr(),
                        minLines: 2,
                        maxLines: 100,
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
                              LocaleKeys.oneContainer.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            10.verticalSpace,
                            TitleWithRow(
                              title: LocaleKeys.numOfContainers.tr(),
                              value: "$containerCount ta",
                            ),
                            10.verticalSpace,
                            Text(
                              LocaleKeys.totalPayment.tr(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            16.verticalSpace,
                            CustomButton(
                              bgColor: paymentType == 0
                                  ? AppColors.green
                                  : AppColors.grey2,
                              text:
                                  "${LocaleKeys.payWithBalance.tr()} UZS 2000",
                              onTap: () {
                                setState(() {
                                  paymentType = 0;
                                });
                              },
                            ),
                            10.verticalSpace,
                            CustomButton(
                              bgColor: paymentType == 1
                                  ? AppColors.green
                                  : AppColors.grey2,
                              text: LocaleKeys.withCard.tr(),
                              onTap: () {
                                setState(() {
                                  paymentType = 1;
                                });
                              },
                            ),
                          ],
                        ).paddingAll(24.sp),
                      ),
                      20.verticalSpace,
                      CustomButton(
                        text: LocaleKeys.sendPaymentRequest.tr(),
                        isLoading:
                            state.status == Status.LOADING ? true : false,
                        bgColor: containerCount > 0
                            ? AppColors.primaryColor
                            : Theme.of(context).highlightColor,
                        onTap: () {
                          context.read<ReportsCubit>().createAgentApplication(
                              containerCount: containerCount,
                              paymentType:
                                  paymentType == 0 ? "bank_account" : "card");
                        },
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
                );
              },
            ),
            ReportsHistory(),
          ],
        ),
      ),
    );
  }
}
