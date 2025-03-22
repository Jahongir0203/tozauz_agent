import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/payment/presentation/pages/payment/part/payment_history_modal_bottom.dart';

import '../../../../../core/utils/locale_keys.g.dart';
import '../../cubit/payment_cubit.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        var cubit = context.read<PaymentCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            return cubit.getArchivePayment();
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              var model = state.archivePaymentList[index];
              return GestureDetector(
                onTap: () {
                  PaymentHistoryBottomSheet(
                    model: model,
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
                      Text(
                        model.card?.cardFormatter() ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            "UZS ${model.amount}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Text(
                              LocaleKeys.expecting.tr(),
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
            },
            separatorBuilder: (context, index) {
              return customDivider;
            },
            itemCount: state.archivePaymentList.length??0,
          ),
        );
      },
    );
  }
}
