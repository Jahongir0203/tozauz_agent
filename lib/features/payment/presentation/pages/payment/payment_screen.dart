import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/extension/for_context.dart';
import 'package:tozauz_agent/core/utils/formatters.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/common/widget/text_field_widget.dart';
import 'package:tozauz_agent/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:tozauz_agent/features/payment/presentation/pages/payment/payment_history.dart';
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
        title: "Pul so'rovlari",
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Yangi pul so'rovi"),
            Tab(text: "Pul so‘rovlar tarixi"),
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
                      text: "Qayta urunish",
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
                    textColor: context.theme.textTheme.titleLarge?.color,
                    text: "Balans: UZS, ${state.bankResponseModel?.capital}",
                    onTap: () {},
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: context.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pul so'rovi",
                            style: AppTextStyles().body20w6.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          20.verticalSpace,
                          CustomTextField(
                            textEditingController: amountController,
                            labelText: "Pul miqdori",
                            textInputType: TextInputType.number,
                            hintText: "Pul miqdori",
                          ),
                          10.verticalSpace,
                          CustomTextField(
                            textEditingController: cardNumberController,
                            labelText: "Karta raqami",
                            formatter: [Formatters.cardNumberFormatter],
                            textInputType: TextInputType.number,
                            hintText: "Karta raqamingizni kiriting",
                          ),
                        ],
                      ).paddingAll(24.sp),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: "Pul so‘rovini so‘rash",
                    onTap: buttonEnabled ? () {} : () {},
                    bgColor: buttonEnabled
                        ? AppColors.primaryColor
                        : AppColors.grey2,
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
