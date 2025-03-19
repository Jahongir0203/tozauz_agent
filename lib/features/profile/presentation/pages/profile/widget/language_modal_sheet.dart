import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../../../export.dart';

class LanguageModalSheet extends StatelessWidget {
  const LanguageModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Text(
            LocaleKeys.selectLang.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.verticalSpace,
          _LanguageItem(
              onTap: () {
                context.setLocale(EasyLocale.all.first);
              },
              label: 'Uzbek',
              isActive: context.locale == EasyLocale.all.first,
              image: AppIcons.flagUz),
          _LanguageItem(
              onTap: () {
                context.setLocale(EasyLocale.all[1]);
              },
              label: 'Russian',
              isActive: context.locale == EasyLocale.all[1],
              image: AppIcons.flagRu),
          _LanguageItem(
              onTap: () {
                context.setLocale(EasyLocale.all.last);
              },
              label: 'English',
              isActive: context.locale == EasyLocale.all.last,
              image: AppIcons.flagEn),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool isActive;
  final String image;

  const _LanguageItem(
      {required this.onTap,
      required this.label,
      required this.isActive,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.splashScreen,
          (route) => false,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 30.r,
              height: 30.r,
              fit: BoxFit.cover,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ).paddingOnly(left: 10.w),
            const Spacer(),
            if (isActive)
              SvgPicture.asset(
                AppIcons.icCheck,
                fit: BoxFit.scaleDown,
              )
          ],
        ),
      ),
    );
  }
}
