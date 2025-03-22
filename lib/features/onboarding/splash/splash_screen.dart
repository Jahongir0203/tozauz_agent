import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;

  String token = '';

  @override
  void initState() {
    initShared();
    var connectivity = Connectivity();

    Future.delayed(const Duration(seconds: 2), () async {
      final doubleCheck = await connectivity.checkConnectivity();
      Navigator.pushReplacementNamed(context,
          token.isNotEmpty ? AppRoutes.mainScreen : AppRoutes.loginScreen);
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

  Future initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(ListAPI.token) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              child: Center(
                  child: ZoomIn(
                duration: const Duration(milliseconds: 700),
                child: Image.asset(
                  AppImages.appLogo,
                  height: he(100),
                  width: wi(100),
                ),
              )),
            ),
            // Text(
            //   textAlign: TextAlign.center,
            //   "Сервис для получения и оплаты чаевых, сбор средств",
            //   style: AppTextStyles().body24w4.copyWith(
            //         color: AppColors.white,
            //     fontSize: 22.sp,
            //       ),
            // ),

            Spacer(),
            Text(
                textAlign: TextAlign.center,
                "v.1.0.0",
                // "V.${AppUpdateService.appVersion}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: he(13),
                    )),
            SizedBox(height: customButtonPadding)
          ],
        ).paddingSymmetric(horizontal: 16.w));
  }
}
