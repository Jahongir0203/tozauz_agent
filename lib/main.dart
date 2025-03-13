import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show ScreenUtil, ScreenUtilInit;
import 'package:provider/provider.dart';
import 'core/values/theme_notifier.dart';
import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDi();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject<AuthCubit>()),
        BlocProvider(
          create: (context) => inject<ContainerCubit>()..fetchBoxes(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeNotifier(Brightness.light)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.init(context);

    themeNotifier = Provider.of<ThemeNotifier>(context);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
                title: 'Tips',
                theme: appThemeData,
                // locale: Locale(state.language),
                // localizationsDelegates: const [
                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalCupertinoLocalizations.delegate,
                //   S.delegate
                // ],
                // supportedLocales: const [
                //   Locale('en'),
                //   Locale('ru'),
                //   Locale('uz'),
                // ],
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
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
