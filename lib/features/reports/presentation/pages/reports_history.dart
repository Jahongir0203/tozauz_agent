import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/core/utils/status_manager.dart';
import 'package:tozauz_agent/features/reports/presentation/pages/part/reports_history_bottom_sheet.dart';

import '../../../../core/utils/general_functions.dart';
import '../../../../export.dart';
import '../cubit/reports_cubit/reports_cubit.dart';

class ReportsHistory extends StatelessWidget {
  const ReportsHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, ReportsState>(
      bloc: context.read<ReportsCubit>()
        ..fetchAgentApplicationList()
        ..onScroll(),
      builder: (context, state) {
        if (state.agentApplicationSt == Status.LOADING) {
          return LoadingWidget();
        }

        if (state.agentApplicationSt == Status.ERROR) {
          return Center(
              child: Text(
                  state.agentApplicationFailure.getLocalizedMessage(context)));
        }
        if (state.agentApplicationSt == Status.SUCCESS) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ReportsCubit>().fetchAgentApplicationList();
            },
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              controller: context.read<ReportsCubit>().scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemBuilder: (context, index) {
                final results = state.applicationList?.results;
                if (results?.length == 0) {
                  return Text(
                    LocaleKeys.empty.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      ReportHistoryBottomSheet(
                        results: results?[index],
                      ).show(context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              blurRadius: 10.r,
                              // spreadRadius: ,
                              offset: const Offset(0, 0),
                            ),
                          ]),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5.h,
                            children: [
                              Text(
                                results?[index].box?.name ?? '',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                MyFunctions.localDateFormat(DateTime.parse(
                                    results?[index].createdAt ?? '')),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            spacing: 5.h,
                            children: [
                              Text(
                                "UZS ${results?[index].amount}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: StatusManager.getStatusColor(
                                        results?[index].status ?? ''),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Text(
                                  StatusManager.getStatus(
                                      results?[index].status ?? ''),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.white),
                                ).paddingAll(5.sp),
                              ),
                            ],
                          ),
                        ],
                      ).paddingAll(16.sp),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) {
                return customDivider;
              },
              itemCount: state.applicationList?.results?.length ?? 0,
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
