


import 'package:tozauz_agent/core/extension/for_context.dart';

import '../../../export.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? buttonText;
  final String? icon;
  final Function()? onTap;


  const CustomEmptyWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.buttonText,
      this.onTap,

      this.icon});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.w / 1.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon ?? AppIcons.noImg),
                SizedBox(height: he(18)),
                Text(title, style: Theme.of(context).textTheme.headlineLarge),
               buttonText == null ?SizedBox(height: he(4)) : SizedBox(height: he(18)),
                Text(subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: he(18)),
                buttonText == null
                    ? const SizedBox.shrink()
                    : CustomButton(text: buttonText ?? "", onTap: onTap ?? (){})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
