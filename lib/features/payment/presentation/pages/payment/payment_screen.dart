import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/core/utils/formatters.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';
import 'package:tozauz_agent/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:tozauz_agent/features/payment/presentation/pages/payment/payment_history.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../../../core/values/app_strings.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController amountController;
  late TextEditingController cardNumberController;
  bool buttonEnabled = false;


  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().getArchivePayment();
    _tabController = TabController(length: 2, vsync: this);
    amountController = TextEditingController();
    cardNumberController = TextEditingController();
    amountController.addListener(_validateForm);
    cardNumberController.addListener(_validateForm);
  }

  void _validateForm() {
    final amountValid = amountController.text.isNotEmpty &&
        double.tryParse(amountController.text) != null &&
        double.parse(amountController.text) > 0;

    final cardValid = cardNumberController.text.isNotEmpty &&
        cardNumberController.text.replaceAll(' ', '').length == 16;

    setState(() {
      buttonEnabled = amountValid && cardValid;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    amountController.dispose();
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.paymentRequest.tr(),
        bottom: TabBar(
          controller: _tabController,
          tabs:  [
            Tab(text: LocaleKeys.newPaymentRequest.tr()),
            Tab(text: LocaleKeys.paymentRequestHistory.tr()),
          ],
        ),
      ),
      body: TabBarView(
        clipBehavior: Clip.none,
        controller: _tabController,
        children: [
          BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              if (state.bankSt == Status.LOADING) {
                return Center(
                  child: LoadingWidget(),
                );
              } else if (state.bankSt == Status.ERROR) {
                return Column(
                  children: [
                    Text(
                      state.bankFailure.getLocalizedMessage(context),
                      style: AppTextStyles().body20w6,
                    ),
                    16.verticalSpace,
                    CustomButton(
                      text: LocaleKeys.reDownload.tr(),
                      onTap: () {
                        context.read<PaymentCubit>().getMeBank();
                      },
                    )
                  ],
                );
              }
              return Column(
                children: [
                  CustomButton(
                    bgColor: AppColors.transparent,
                    borderColor: AppColors.grey2,
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                    text: "${LocaleKeys.balance.tr()} UZS, ${state.bankResponseModel?.capital}",
                    onTap: () {},
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: context.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2,
                          width: 0.5

                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.paymentRequest.tr(),
                            style:Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          20.verticalSpace,
                          CustomTextField(
                            textEditingController: amountController,
                            labelText: LocaleKeys.amount.tr(),
                            textInputType: TextInputType.number,
                            hintText: LocaleKeys.enterAmount.tr(),
                          ),
                          10.verticalSpace,
                          CustomTextField(
                            textEditingController: cardNumberController,
                            labelText: LocaleKeys.cardNumber.tr(),
                            formatter: [Formatters.cardNumberFormatter],
                            textInputType: TextInputType.number,
                            hintText: LocaleKeys.cardNumber.tr(),
                          ),
                        ],
                      ).paddingAll(24.sp),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: LocaleKeys.paymentRequest.tr(),
                    onTap: buttonEnabled ? () {} : () {},
                    bgColor: buttonEnabled
                        ? AppColors.primaryColor
                        : Theme.of(context).highlightColor,
                  ),
                ],
              );
            },
          ),
          PaymentHistory(),
        ],
      )
          .paddingSymmetric(
            horizontal: 16.w,
            vertical: 20.h,
          )
          .paddingOnly(bottom: customButtonPadding),
    );
  }
}
