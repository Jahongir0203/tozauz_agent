// import 'package:flutter/material.dart';
// import 'package:tips/core/values/app_colors.dart';
// import 'package:tips/features/common/widget/custom_button.dart';
//
// import '../../../core/utils/size_config.dart';
//
// class CanCallDialog extends StatelessWidget {
//   final Function() submitOnTap;
//   final Function() cancelOnTap;
//
//   const CanCallDialog(
//       {super.key, required this.submitOnTap, required this.cancelOnTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: AppColors.white,
//       title: Text(
//         'Do you really want to call?',
//         style: Theme.of(context).textTheme.headlineLarge,
//       ),
//       actions: [
//         Row(
//           children: [
//             Expanded(
//               child: CustomButton(
//                 text: "Cancel",
//                 borderColor: AppColors.transparent,
//                 onTap: cancelOnTap,
//               ),
//             ),
//             SizedBox(width: wi(10)),
//             Expanded(
//               child: CustomButton(
//                 borderColor: AppColors.transparent,
//                 text: "Call",
//                 onTap: submitOnTap,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
