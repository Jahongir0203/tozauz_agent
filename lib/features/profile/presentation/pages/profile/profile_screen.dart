
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/locale_keys.g.dart';
import '../../../../../export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileActionModel> actions = [];

  UserBankModel? userBankModel = UserBankModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.profile.tr(),
        action: [
          DayNightSwitch(
            initiallyDark: themeNotifier.isDarkMode,

            onChange: (p0) {
              themeNotifier.changeTheme(
                  isSystem: false, isDarkMode: !themeNotifier.isDarkMode);
            },
          ).paddingOnly(right: 20.w),
        ],
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state.bankSt == Status.LOADING) {
            return LoadingWidget();
          } else if (state.bankSt == Status.ERROR) {
            return Column(
              children: [
                Text(
                  state.bankFailure.getLocalizedMessage(context),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                16.verticalSpace,
                CustomButton(
                  text: LocaleKeys.reDownload.tr(),
                  onTap: () {
                    context.read<PaymentCubit>().getMeBank();
                  },
                ),
              ],
            );
          }
          if (state.bankSt == Status.SUCCESS) {
            userBankModel = state.bankResponseModel?.user;

            actions = [
              ProfileActionModel(
                icon: Icons.call,
                title: LocaleKeys.phoneNumber.tr(),
                value: state.bankResponseModel?.user?.phoneNumber
                        ?.formatUzPhoneNumber() ??
                    '',
                onTap: () {},
              ),
              ProfileActionModel(
                icon: Icons.wallet,
                title: LocaleKeys.balance.tr(),
                value: "UZS ${state.bankResponseModel?.capital}",
                onTap: () {},
              ),
              ProfileActionModel(
                icon: Icons.security_outlined,
                title: LocaleKeys.updatePassword.tr(),
                value: "",
                onTap: () {},
              ),
              ProfileActionModel(
                icon: Icons.logout,
                title: LocaleKeys.logOut.tr(),
                value: "",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.loginScreen,
                    (_) => false,
                  );
                },
              ),
              ProfileActionModel(
                icon: Icons.language,
                title: LocaleKeys.changeLanguage.tr(),
                value: "",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    useSafeArea: true,
                    builder: (context) {
                      return LanguageModalSheet();
                    },
                  );
                },
              ),
            ];
          }
          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Theme.of(context).highlightColor,
                    child: Text(
                      "${userBankModel?.firstName?.substring(0, 1) ?? ''}${userBankModel?.lastName?.substring(0, 1) ?? ''}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    "${userBankModel?.firstName} ${userBankModel?.lastName}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              40.verticalSpace,
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ]),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProfileItem(
                      icon: actions[index].icon,
                      title: actions[index].title,
                      onTap: actions[index].onTap,
                      value: actions[index].value,
                    );
                  },
                  separatorBuilder: (context, index) => customDivider,
                  itemCount: actions.length,
                ),
              ),
            ],
          );
        },
      ).paddingSymmetric(horizontal: 16.w, vertical: 20.h),
    );
  }
}



class ProfileActionModel {
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;

  ProfileActionModel({
    required this.title,
    required this.value,
    required this.onTap,
    required this.icon,
  });
}
