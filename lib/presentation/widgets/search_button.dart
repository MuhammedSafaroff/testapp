import 'package:flutter/material.dart';
import 'package:testapp/core/constants/constant.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Search',
        style: AppTextStyles.openSans500.copyWith(color: Colors.black),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        elevation: 0,
      ),
    );
  }
}
