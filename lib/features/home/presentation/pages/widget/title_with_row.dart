import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';

class TitleWithRow extends StatelessWidget {
  final String title, value;

  const TitleWithRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
