import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show ScreenUtil, ScreenUtilInit;
import 'package:provider/provider.dart';
import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject<AuthCubit>()),
        BlocProvider(
          create: (context) => inject<ContainerCubit>()..fetchBoxes(),
        ),
        BlocProvider(
          create: (context) => inject<PaymentCubit>()..getMeBank(),
        ),
      ],
      child: EasyLocalization(
        path: AppStrings.localePath,
        supportedLocales: EasyLocale.all,
        fallbackLocale: EasyLocale.all.last,
        saveLocale: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.init(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    themeNotifier =
        ThemeNotifier(WidgetsBinding.instance.window.platformBrightness);

    return ChangeNotifierProvider(
      create: (context) => themeNotifier,
      child: ValueListenableBuilder<ThemeData>(
        valueListenable: themeNotifier,
        builder: (context, value, child) {
          return ScreenUtilInit(
            minTextAdapt: true,
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, child) {
              return GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus,
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1),
                  ),
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'TozaUz Agent',
                    theme: value,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    onGenerateRoute: RouteGenerate().generate,
                    navigatorKey: navigatorKey,
                    builder: (context, child) {
                      return ScrollConfiguration(
                          behavior: MyBehavior(), child: child!);
                    },
                    initialRoute: AppRoutes.splashScreen,
                    // home: CustomLeftDrawerWithoutIcon(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
