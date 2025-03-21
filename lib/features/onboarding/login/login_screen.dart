import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/utils/formatters.dart';
import 'package:tozauz_agent/core/utils/locale_keys.g.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/custom_constrained_scroll.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.enterPhone.tr();
    }
    String digitsOnly = value.replaceAll(RegExp(r'\D'), ''); // Faqat raqamlarni olish

    if (!digitsOnly.startsWith('998') || digitsOnly.length != 12) {
      return LocaleKeys.enterAvailablePhone.tr();
    }

    return null; // Hammasi to‘g‘ri bo‘lsa, xatolik qaytarmaydi
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.enterPassword.tr();
    } else if (value.length < 4) {
      return LocaleKeys.passwordLeastFour.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<AuthCubit>(),
      child: Scaffold(
        body: AppConstrainedScrollView(
          child: Form(
            key: _formKey,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (_, state) {
                if (state is UnAuthenticatedState) {
                  DelightToastBar(
                    autoDismiss: true,
                    position: DelightSnackbarPosition.top,
                    builder: (_) => ToastCard(
                      color: Colors.red,
                      title: Text(
                        LocaleKeys.error.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: AppColors.white
                        ),
                      ),
                    ),
                  ).show(context);
                } else if (state is AuthenticatedState) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.mainScreen,
                    (_) => false,
                  );
                }
              },
              builder: (c, state) {
                var cubit = c.read<AuthCubit>();
                return Column(
                  children: [
                    Spacer(),
                    CustomTextField(
                      formatter: [
                        Formatters.phoneFormatter,
                      ],
                      hintText: "(99) 999 99 99",
                      labelText: LocaleKeys.enterPhone.tr(),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.phone,
                      textEditingController: phoneController,
                      validator: _validatePhone,
                    ),
                    16.verticalSpace,
                    CustomTextField(
                      hintText: LocaleKeys.password.tr(),
                      labelText: LocaleKeys.enterPassword.tr(),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      obscure: true,
                      textEditingController: passwordController,
                      validator: _validatePassword,
                    ),
                    Spacer(),
                    CustomButton(
                      text: LocaleKeys.logIn.tr(),
                      isLoading: state is AuthLoadingState,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await cubit.login(
                            username: "+${phoneController.text.replaceAll(RegExp(r'\D'), '')}",
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            )
                .paddingSymmetric(horizontal: 16.w, vertical: 20.h)
                .paddingOnly(bottom: customButtonPadding),
          ),
        ),
      ),
    );
  }
}
