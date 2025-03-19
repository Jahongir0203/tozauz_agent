import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tozauz_agent/core/values/app_colors.dart';
import '../../../core/utils/size_config.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: color ?? Theme.of(context).colorScheme.onPrimary,
              strokeWidth: wi(2.5),
              backgroundColor: AppColors.black.withOpacity(.1),
            )
          : CupertinoActivityIndicator(
              color: color ?? Theme.of(context).colorScheme.onSecondary),
    );
  }
}
