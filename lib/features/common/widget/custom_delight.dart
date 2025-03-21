import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';

import '../../../export.dart';

DelightToastBar customDelightToastBar({bool isSuccess = true, required String text}) {
  return DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.top,
    builder: (_) => ToastCard(
      color: isSuccess ? Colors.green : Colors.red,
      title: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.white),
      ),
    ),
  );
}
