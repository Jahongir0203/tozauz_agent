import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/core/extension/date_time_formatter.dart';
import 'package:tozauz_agent/core/utils/formatters.dart';
import 'package:tozauz_agent/core/utils/general_functions.dart';
import 'package:tozauz_agent/core/utils/status_manager.dart';
import 'package:tozauz_agent/features/reports/data/model/agent_application_list.dart';

import '../../../../../export.dart';
import '../../../../home/presentation/pages/widget/title_with_row.dart';

class ReportHistoryBottomSheet extends StatelessWidget {
  const ReportHistoryBottomSheet({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.reportDescription.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        10.verticalSpace,
        TitleWithRow(
          title: LocaleKeys.container.tr(),
          value: results?.box?.name ?? '',
        ),
        TitleWithRow(
          title: LocaleKeys.amount.tr(),
          value: 'UZS ${results?.amount.toString() ?? ''}',
        ),
        TitleWithRow(
          title: LocaleKeys.status.tr(),
          value: StatusManager.getStatus(results?.status ?? ''),
        ),
        TitleWithRow(
          title: LocaleKeys.paymentType.tr(),
          value: StatusManager.getPaymentType(results?.paymentType ?? ''),
        ),
        TitleWithRow(
            title: LocaleKeys.containers.tr(),
            value: "${results?.containersCount ?? 0}"),
        TitleWithRow(
          title: LocaleKeys.date.tr(),
          value: MyFunctions.localDateFormat(
              DateTime.parse(results?.createdAt??'')),
        ),
        20.verticalSpace,
        CustomButton(
          text: LocaleKeys.close.tr(),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    ).paddingAll(24.sp);
  }

  show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return this;
      },
    );
  }
}
