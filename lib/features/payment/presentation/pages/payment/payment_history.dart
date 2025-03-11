import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/utils/helper_widget.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/payment/presentation/pages/payment/part/payment_history_modal_bottom.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            PaymentHistoryBottomSheet().show(context);
          },
          splashColor: AppColors.primaryOpacity,
          hoverColor: AppColors.primaryOpacity,
          highlightColor: AppColors.primaryOpacity,
          child: Row(
            children: [
              Text(
                "2225 5555 5555 5599",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "UZS 100",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Text(
                      "To'landi",
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
        );
      },
      separatorBuilder: (context, index) {
        return customDivider;
      },
      itemCount: 10,
    );
  }
}
