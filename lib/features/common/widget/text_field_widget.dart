// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';
import 'package:tozauz_agent/core/extension/widget_extantion.dart';
import 'package:tozauz_agent/core/utils/size_config.dart' show he;
import 'package:tozauz_agent/core/values/app_colors.dart' show AppColors;

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.onChange,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscure,
    this.textInputAction,
    this.fillColor,
    this.initialValue,
    this.preIconColor,
    this.textEditingController,
    this.readOnly = false,
    this.onTap,
    this.formatter,
    required this.textInputType,
    this.maxLength,
    this.focusNode,
    this.suffixIconOnTap,
    this.borderColor,
    this.onFieldSubmitted,
    this.hintText,
    this.labelText,
  });

  final TextEditingController? textEditingController;
  Function(String value)? onChange;

  final String? prefixIcon;
  final String? suffixIcon;
  final bool? obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? preIconColor;
  final Color? borderColor;
  final String? initialValue;
  FormFieldValidator<String>? validator;
  final int? maxLines;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function()? suffixIconOnTap;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? formatter;
  final String? hintText;
  final String? labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscure ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.black,
              fontSize: 12.sp,
            ),
          ),
          5.verticalSpace
        ],
        TextFormField(
          maxLines: widget.obscure == true ? 1 : widget.maxLines ?? 1,
          minLines: widget.minLines ?? 1,
          validator: widget.validator,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          inputFormatters: widget.formatter,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          initialValue: widget.initialValue,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          obscureText: isObscured,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChange,
          controller: widget.textEditingController,
          cursorColor: AppColors.primaryColor,
          maxLength: widget.maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.grey3,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8.h),
            suffixIconConstraints:
            const BoxConstraints(minHeight: 25, minWidth: 25),
            prefixIcon: widget.prefixIcon == null
                ? null
                : SvgPicture.asset(
              widget.prefixIcon!,
              height: he(20),
              colorFilter: ColorFilter.mode(
                  widget.preIconColor ?? AppColors.grey1,
                  BlendMode.srcIn),
            ).paddingAll(11),

            // **Ko‘zcha ikonasi orqali ko'rinishni o'zgartirish**
            suffixIcon: widget.obscure == true
                ? IconButton(
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              color: AppColors.black,
              icon: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            )
                : (widget.suffixIcon == null
                ? null
                : ScaleButton(
              bound: 0.040,
              onTap: widget.suffixIconOnTap,
              child: SvgPicture.asset(
                widget.suffixIcon!,
                height: he(20),
                colorFilter: ColorFilter.mode(
                    widget.preIconColor ?? AppColors.grey1,
                    BlendMode.srcIn),
              ),
            ).paddingAll(11)),
            filled: true,
            fillColor: widget.fillColor ?? Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.primaryColor,
                width: 1.2,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.grey2),
            ),
          ),
        ),
      ],
    );
  }
}

