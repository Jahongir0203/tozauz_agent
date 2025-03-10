import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';

import '../../../export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var connectivity = Connectivity();

    Future.delayed(const Duration(seconds: 2), () async {
      final doubleCheck = await connectivity.checkConnectivity();
      Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
      //
      // if (mounted) {
      //   // Ensure the widget is still in the tree
      //   if (doubleCheck == ConnectivityResult.wifi ||
      //       doubleCheck == ConnectivityResult.mobile ||
      //       doubleCheck == ConnectivityResult.ethernet) {
      //   // } else {
      //   //   // Navigator.pushReplacementNamed(context, AppRoutes.noInternet);
      //   // }
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff2A6EB1), Color(0xff003366)],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Expanded(
            child: Center(
                child: ZoomIn(
              duration: const Duration(milliseconds: 700),
              child: SvgPicture.asset(
                AppIcons.appLogo,
                height: he(100),
                width: wi(100),
              ),
            )),
          ),
          Text(
            textAlign: TextAlign.center,
            "Сервис для получения и оплаты чаевых, сбор средств",
            style: AppTextStyles().body24w4.copyWith(
                  color: AppColors.white,
              fontSize: 22.sp,
                ),
          ),

          Spacer(),
          Text(
              textAlign: TextAlign.center,
              "V.${AppUpdateService.appVersion}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: he(13), color: AppColors.black)),
          SizedBox(height: customButtonPadding)
        ],
      ).paddingSymmetric(horizontal: 16.w),
    ));
  }
}
