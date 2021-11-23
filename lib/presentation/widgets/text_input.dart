import 'package:flutter/material.dart';
import 'package:testapp/core/constants/app_colors.dart';
import 'package:testapp/core/constants/constant.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      required this.hintText,
      this.isPass = false,
      required this.controller})
      : super(key: key);
  final String hintText;
  final bool isPass;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: AppColors.inputHint.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        obscureText: isPass,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.inputBack,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          hintText: hintText,
          hintStyle: AppTextStyles.openSans500.copyWith(
            fontSize: 14,
            color: AppColors.inputHint,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.inputHint,
          ),
        ),
      ),
    );
  }
}
