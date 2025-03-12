import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/utils/formatters.dart';
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
      return "Telefon raqamini kiriting";
    } else if (!RegExp(r'^\+?\d{10,13}$').hasMatch(value)) {
      return "Yaroqli telefon raqamini kiriting";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Parolni kiriting";
    } else if (value.length < 4) {
      return "Parol kamida 4 ta belgidan iborat bo‘lishi kerak";
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
                        "Xatolik",
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
                      labelText: "Enter phone number",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.phone,
                      textEditingController: phoneController,
                      validator: _validatePhone,
                    ),
                    16.verticalSpace,
                    CustomTextField(
                      hintText: "Password",
                      labelText: "Enter password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      obscure: true,
                      textEditingController: passwordController,
                      validator: _validatePassword,
                    ),
                    Spacer(),
                    CustomButton(
                      text: "Login",
                      isLoading: state is AuthLoadingState,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await cubit.login(
                            username: phoneController.text,
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
