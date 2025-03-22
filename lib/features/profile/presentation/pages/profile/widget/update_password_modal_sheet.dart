import 'package:easy_localization/easy_localization.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';
import 'package:tozauz_agent/features/profile/data/models/update_password_request.dart';
import 'package:tozauz_agent/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

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
  bool isButtonEnabled = false;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    currentPasswordController.addListener(_validForm);
    newPasswordController.addListener(_validForm);
    repeatPasswordController.addListener(_validForm);
    super.initState();
  }

  void _validForm() {
    final validCurrentPassword = currentPasswordController.text.isNotEmpty &&
        currentPasswordController.text.length > 3;

    final validNewPassword = newPasswordController.text.isNotEmpty &&
        newPasswordController.text.length > 3;

    final validRepeatPassword = repeatPasswordController.text.isNotEmpty &&
        repeatPasswordController.text == newPasswordController.text;

    setState(() {
      isButtonEnabled =
          validRepeatPassword && validNewPassword && validCurrentPassword;
    });
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
    return BlocProvider(
      create: (context) => inject<ProfileCubit>(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == Status.ERROR) {
            customDelightToastBar(
                    isSuccess: false,
                    text: state.failure.getLocalizedMessage(context))
                .show(context);
          }

          if (state.status == Status.SUCCESS) {
            customDelightToastBar(text: LocaleKeys.updatePasswordSuccess.tr())
                .show(context);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
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
                  bgColor: isButtonEnabled
                      ? AppColors.primaryColor
                      : Theme.of(context).highlightColor,
                  isLoading: state.status == Status.LOADING ? true : false,
                  onTap: isButtonEnabled
                      ? () {
                          context.read<ProfileCubit>().updatePassword(
                                updatePasswordRequest: UpdatePasswordRequest(
                                  newPassword:
                                      newPasswordController.text.trim(),
                                  oldPassword:
                                      currentPasswordController.text.trim(),
                                ),
                              );
                        }
                      : () {},
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
        },
      ),
    );
  }
}
