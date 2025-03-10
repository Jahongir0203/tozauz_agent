import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/home/data/models/container_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/container_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Konterneylar",
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h
        ),
        itemBuilder: (context, index) {
          return ContainerItem(
            model: containerList[index],
          );
        },
        separatorBuilder: (context, index) {
          return 10.verticalSpace;
        },
        itemCount: containerList.length,
      ),
    );
  }
}
