import 'package:flutter/material.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';

String elon =
    "https://www.gipr.uz/files/01-2024/ad20104/bannierlarda-rieklama-riek-1305947804_large.webp";
String news =
    "https://static.1tv.ru/uploads/video/material/splash/2024/11/12/913099/_original/913099_2fa85cecc2.jpg";
String elon1 =
    'https://nurobod.takm.uz/media/k2/items/cache/0a47a31ecf1649c40be3821bbc214aed_L.jpg';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

final double customButtonPadding =
    MediaQuery.of(navigatorKey.currentState!.context).padding.bottom + 20;
final double customBarPadding =
    MediaQuery.of(navigatorKey.currentState!.context).padding.top;
Widget customDivider =
    const Divider(color: AppColors.secondary, thickness: 1.5, height: 0);





