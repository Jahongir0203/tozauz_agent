import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';

import '../../../../../../export.dart';

class UpdatePasswordModalSheet extends StatefulWidget {
  const UpdatePasswordModalSheet({super.key});

  @override
  State<UpdatePasswordModalSheet> createState() =>
      _UpdatePasswordModalSheetState();
}

class _UpdatePasswordModalSheetState extends State<UpdatePasswordModalSheet> {
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController repeatPasswordController;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Text(
            LocaleKeys.updatePassword.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.verticalSpace,
          CustomTextField(
            textInputType: TextInputType.text,
            textEditingController: currentPasswordController,
            hintText: LocaleKeys.currentPass.tr(),
            labelText: LocaleKeys.currentPass.tr(),
            obscure: true,
          ),
          20.verticalSpace,
          CustomTextField(
            textInputType: TextInputType.text,
            textEditingController: newPasswordController,
            hintText: LocaleKeys.newPass.tr(),
            labelText: LocaleKeys.newPass.tr(),
            obscure: true,
          ),
          20.verticalSpace,
          CustomTextField(
            textInputType: TextInputType.text,
            textEditingController: repeatPasswordController,
            hintText: LocaleKeys.confirmNewPass.tr(),
            labelText: LocaleKeys.confirmNewPass.tr(),
            obscure: true,
          ),
          30.verticalSpace,
          CustomButton(
            text: LocaleKeys.updatePassword.tr(),
            onTap: () {},
          ),
          20.verticalSpace,
          CustomButton(
            text: LocaleKeys.cancel.tr(),
            onTap: () {
              Navigator.pop(context);
            },
            bgColor: Theme.of(context).highlightColor,
          )
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
