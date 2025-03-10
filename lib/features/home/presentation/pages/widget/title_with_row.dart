import 'package:flutter/cupertino.dart';
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
          style: AppTextStyles().body16w6,
        ),
        Spacer(),
        Text(
          value,
          style: AppTextStyles().body16w6,
        ),
      ],
    );
  }
}
